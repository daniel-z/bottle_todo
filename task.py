import sqlite3
from bottle import request, abort

def validateDecorator (writeFnc):
    def validateAndExecute (params):
        username = request.get_cookie('username')
        if not username:
            abort(401, "Sorry, access denied.")

        params['username'] = username
        return writeFnc(params)
    return validateAndExecute;

def insertNewTask (params):
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("INSERT INTO todo (task,status,last_edited_by) VALUES (?,?,?)", (params['task'],1,params['username']))
    new_id = c.lastrowid
    conn.commit()
    c.close()
    return new_id

def removeTask (params):
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("DELETE FROM todo WHERE id LIKE ?;", (params['id'],))
    conn.commit()
    c.close()
    return

def updateTask (params):
    if params['status'] == 'open':
        status = 1
    else:
        status = 0

    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("UPDATE todo SET task = ?, status = ?, last_edited_by = ? WHERE id LIKE ?", (params['edit'], status, params['username'], params['number']))
    conn.commit()
    c.close()
