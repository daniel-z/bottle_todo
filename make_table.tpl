%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)
<p>{{message}}</p>
<p>The open items are as follows:</p>

<table border="1">
%for row in rows:
  <tr>
  %for col in row:
    <td>{{col}}</td>
  %end
  </tr>
%end
</table>

<!-- convert this to post -->
<p>Add a new task to the ToDo list:</p>
<form action="/" method="GET">
  <input type="text" size="100" maxlength="100" name="task">
  <input type="submit" name="save" value="save">
</form>
