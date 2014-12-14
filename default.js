function newTab(selectors) {
  if (!(selectors instanceof Array)) {
    selectors = [selectors];
  }
  selectors.forEach(function(selector) {
    $(selector).attr('target', '_blank');
  });
}
