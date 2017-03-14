<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/styles.css">
  </head>
  <body>

    <div class="container">

      <!-- header -->
      <div class="row">
        <div class="col-xs-12">
          <h1>Welcome to the Bottle Todo App</h1>
          <h3>Manage your todo list</h3>
          %if loggeduser:
            <p>Welcome {{loggeduser}}!</p>
          %else:
            <p>You're not logged in, to get edit permissions login <a href="/login">here</a>.</p>
          %end
        </div>
      </div>

      <!-- content -->
      <div class="row">
        <div class="col-xs-12">

          <div class="row">
            <div class="col-xs-12 col-sm-6">
              <p>Add a new task to the ToDo list:</p>
              <form action="/" method="GET">
                <div class="form-group">
                  <input class="form-control" placeholder="Task Description" type="text" size="100" maxlength="100" name="task">
                  <input class="btn btn-default" type="submit" name="save" value="save">
                </div>
              </form>
            </div>
          </div>

          <p>Open items:</p>

          <table id="open-items">
          %for row in rows:
            <tr>
            %for col in row:
              <td>{{col}}</td>
            %end
              <td>
                <a href="/edit/{{row[0]}}">Edit</a>
              </td>
              <td>
                <form>
                  <input type="hidden" name="id" value="{{row[0]}}">
                  <input type="submit" name="delete" value="delete">
                </form>
              </td>
            </tr>
          %end
          </table>
        </div>
      </div>
    </div>

    <!-- scripts -->
    <script type="text/javascript" src="/static/lib/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/static/index.js"></script>

  </body>
</html>
