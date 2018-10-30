$(function () {
  // $('#products th a, #products .pagination a').live('click', function () {
  //   $.getScript(this.href);
  //   return false;
  // });

  $('#products th, #products .pagination').on('click', 'a', function () {
    $.getScript(this.href);
    return false;
  });

  // Search form.
  // $('#products_search').submit(function () {
  //   $.get(this.action, $(this).serialize(), null, 'script');
  //   return false;
  // });

  $('#products_search input').keyup(function () {
    $.get($("#products_search").attr("action"), $(this).serialize(), null, 'script');
    return false;
  });
});