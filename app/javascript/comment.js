window.onload = function () {
  document.oncontextmenu =  function () { return false; }
  let con = document.getElementById('conmenu');
  let rightclick = document.getElementById('rightclick');
  let body = document.body;

  rightclick.addEventListener('contextmenu', function (e) {
    con.style.left = e.pageX + 'px';
    con.classList.add('show');
  });

  body.addEventListener('click', function () {
    if (con.classList.contains('show')) {
      con.classList.remove('show');
    }
  });
}