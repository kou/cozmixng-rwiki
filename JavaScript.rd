= JavaScript

== プロパティ一覧を出力

  for (m in o)
  {
     document.write(m);
     document.write(":");
     document.write(typeof(m));
     document.write("<br>");
  }

== 選択されたテキスト(エリア)のテキストを変換

replace.html

  <html>
    <head>
      <title>event</title>
      <script type="text/javascript" src="replace.js"></script>
    </head>
    <body>
      <form action="">
        <p>
          <input onclick="do_click(event);" type="button" value="push!">
        </p>
        <p>
        <textarea rows="40" cols="40" onselect="do_select(event);">
  abcde
        </textarea>
        </p>
      </form>
    </body>
  </html>

replace.js

  var textarea = null
  var start = 0
  var end = 0

  function do_click(e) 
  {
    if (textarea && end != start) {
      var new_str = "|" + textarea.value.slice(start, end) + "|";
      textarea.value = replace_string(textarea.value, start, end, new_str);
    } else {
      alert("Not selected!");
    }
  }

  function do_select(e)
  {
    textarea = e.currentTarget;
    start = textarea.selectionStart;
    end = textarea.selectionEnd;
  }

  function replace_string(str, start, end, new_str)
  {
    var rv = str.substring(0, start);
    rv += new_str;
    rv += str.substring(end, str.length);
    return rv;
  }
