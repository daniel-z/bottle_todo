import sqlite3
from bottle import route, run, debug, template, request, response, redirect, static_file, error, abort
from task import *
# only needed when you run Bottle on mod_wsgi
from bottle import default_app

# ----------------------------------------------------------------
# MAIN PAGE
# ----------------------------------------------------------------
@route('/')
@route('/todo')
def todo_list():
    username = ""
    message = request.GET.get('message','').strip()

    if request.get_cookie('username'):
        username = request.get_cookie('username')

    if request.GET.get('save','').strip():
        createNewTask = validateDecorator(insertNewTask)
        task = request.GET.get('task', '').strip()
        message = 'The new task was inserted into the database, the ID is %s' % createNewTask({'task': task})
        redirect('/?message='+message)
    elif request.GET.get('delete','').strip():
        deleteTask = validateDecorator(removeTask)
        id = request.GET.get('id', '').strip()
        deleteTask({'id': id})
        message = 'Task: %s removed, successfully' %id
        redirect('/?message='+message)

    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT id, task, last_edited_by FROM todo WHERE status LIKE '1';")
    result = c.fetchall()
    c.close()

    output = template('make_table', rows=result, loggeduser=username, message=message)
    return output

# ----------------------------------------------------------------
# LOGIN PAGE
# ----------------------------------------------------------------
@route('/login', method='GET')
def login():
    if request.GET.get('login','').strip():
        username = request.GET.get('username','').strip()
        if username:
            response.set_cookie('username', username)
            redirect("/")
    return template('login')

# ----------------------------------------------------------------
# NEW PAGE
# ----------------------------------------------------------------
@route('/new', method='GET')
def new_item():
    if request.GET.get('save','').strip():
        createNewTask = validateDecorator(insertNewTask)
        task = request.GET.get('task', '').strip()
        return '<p>The new task was inserted into the database, the ID is %s</p>' % createNewTask({'task': task})
    else:
        return template('new_task')

# ----------------------------------------------------------------
# EDIT PAGE
# ----------------------------------------------------------------
@route('/edit/<no:int>', method='GET')
def edit_item(no):

    if request.GET.get('save','').strip():
        edit = request.GET.get('task','').strip()
        status = request.GET.get('status','').strip()
        editTask = validateDecorator(updateTask);
        editTask({'edit': edit, 'status': status, 'number': no})
        message = 'The item number %s was successfully updated' %no
        redirect('/?message='+message)
    else:
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("SELECT task FROM todo WHERE id LIKE ?", (str(no),))
        cur_data = c.fetchone()

        return template('edit_task', old = cur_data, no = no)

# ----------------------------------------------------------------
# ITEM PAGE
# ----------------------------------------------------------------
@route('/item<item:re:[0-9]+>')
def show_item(item):

    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT task FROM todo WHERE id LIKE ?", (item))
    result = c.fetchall()
    c.close()

    format = request.GET.get('format','').strip()
    if format and format == 'json':
        if not result:
            return {'task':'This item number does not exist!'}

        return {'Task': result[0][0]}

    if not result:
        return 'This item number does not exist!'

    return 'Task: %s' %result[0]

# ----------------------------------------------------------------
# JSON PAGE
# ----------------------------------------------------------------
@route('/json<json:re:[0-9]+>')
def show_json(json):
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT task FROM todo WHERE id LIKE ?", (json))
    result = c.fetchall()
    c.close()

    if not result:
        return {'task':'This item number does not exist!'}
    else:
        return {'Task': result[0][0]}

# ----------------------------------------------------------------
# ERRORS PAGE
# ----------------------------------------------------------------
@error(403)
def mistake403(code):
    return 'There is a mistake in your url!'

@error(404)
def mistake404(code):
    return 'Sorry, this page does not exist!'

@error(401)
def error401(error):
    return template('login', msg='Need to login first!')

# ----------------------------------------------------------------
# SERVE STATIC FILES
# ----------------------------------------------------------------
@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root='static/')

# ----------------------------------------------------------------
# DATABASE FUNCTIONS
# ----------------------------------------------------------------
def databaseCheck ():
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("PRAGMA table_info(todo)")
    result = c.fetchall()
    c.close()
    if result[3][1] != 'last_edited_by':
        updateDatabase()

def updateDatabase ():
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("ALTER TABLE todo ADD COLUMN last_edited_by TEXT")
    result = c.fetchall()
    c.close()

databaseCheck()
debug(True)
run(reloader=True)
#remember to remove reloader=True and debug(True) when you move your application from development to a productive environment
