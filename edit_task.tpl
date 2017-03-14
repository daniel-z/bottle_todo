<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/styles.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:700|Passion+One|Roboto+Condensed:300|Scope+One|Roboto+Condensed:700" rel="stylesheet">
  </head>
  <body class="edit-page">

    <div class="container">

      <!-- header -->
      <div class="row">
        <div class="col-xs-12 header">
          <h1>
            <span class="main">Bottle</span>
            <span class="secondary">ToDo App</span>
          </h1>
          <h2>Edit Task {{no}}</h2>
        </div>
      </div>

      <!-- content -->
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6">
          <form action="/edit/{{no}}" method="get">

          <input type="text" class="form-control" name="task" value="{{old[0]}}" size="100" maxlength="100">
          <select name="status" class="form-control">
            <option>open</option>
            <option>closed</option>
          </select>

          <input type="hidden" name="save" value="save">
          <button type="submit" class="btn btn-primary">Save</button>
          </form>
        </div>
      </div>

      <!-- footer -->
      <div class="row">
        <div class="col-xs-12">
          <footer>
            <ul>
              <li class="author">
                <i class="glyphicon glyphicon-user"></i> Daniel Zamorano Mejia
              </li>
              <li class="email">
                <i class="glyphicon glyphicon-envelope"></i> daniel.zamorano.m@gmail.com
              </li>
              <li class="github">
                <i class="glyphicon glyphicon-asterisk"></i> <a href="https://github.com/daniel-z">github</a>
              </li>
              <li class="bitbucket">
                <i class="glyphicon glyphicon-asterisk"></i> <a href="https://bitbucket.org/danielzm/">bitbucket</a>
              </li>
              <li class="about-bottle">
                <i class="glyphicon glyphicon-asterisk"></i> <a href="http://bottlepy.org/">Bottlepy.org</a>
              </li>
            </ul>
          </footer>
        </div>
      </div>
    </div> <!-- container -->
    <!-- scripts -->
    <script type="text/javascript" src="/static/lib/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/static/index.js"></script>

  </body>
</html>
