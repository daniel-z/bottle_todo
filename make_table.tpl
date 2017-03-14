<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/styles.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:700|Passion+One|Roboto+Condensed:300|Scope+One" rel="stylesheet">
  </head>
  <body class="main-page">

    <div class="container">

      <!-- header -->
      <div class="row">
        <div class="col-xs-12 header">
          <h1>
            <span class="main">Bottle</span>
            <span class="secondary">ToDo App</span>
          </h1>
          <h2>Manage your ToDo list</h2>
          %if loggeduser:
            <span class="user">User: {{loggeduser}}</span>
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
            <tr>
              <th>Id</th>
              <th>Task</th>
              <th>Last Edited By</th>
              <th>Actions</th>
            </tr>
          %for row in rows:
            <tr>
            %for col in row:
              <td>{{col}}</td>
            %end
              <td>
                <a class="btn btn-default" href="/edit/{{row[0]}}"><i class="glyphicon glyphicon-pencil"></i></a>
                <a class="btn btn-danger" href="/?id={{row[0]}}&delete=delete"><i class="glyphicon glyphicon-trash"></i></a>
              </td>
            </tr>
          %end
          </table>
        </div>
      </div>

      <!-- footer -->
      <div class="row">
        <div class="col-xs-12">
          <footer>
            <ul>
              <li class="author">Daniel Zamorano Mejia</li>
              <li class="email">daniel.zamorano.m@gmail.com</li>
              <li class="github"><a href="https://github.com/daniel-z">github</a></li>
              <li class="bitbucket"><a href="https://bitbucket.org/danielzm/">bitbucket</a></li>
              <li class="about-bottle"><a href="http://bottlepy.org/">Bottlepy.org</a></li>
            </ul>
          </footer>
        </div>
      </div>
  </div>

    <!-- scripts -->
    <script type="text/javascript" src="/static/lib/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/static/index.js"></script>

  </body>
</html>
