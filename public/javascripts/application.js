function toggleSearch() {
  jQuery("#search").toggle();
  positionSearch();
}

function positionSearch() {
  jQuery("#search").
    css("left", jQuery("#menu_search").offset().left - jQuery("#search").width() + jQuery("#menu_search").width()).
    css("top", jQuery("#menu_search").offset().top + jQuery("#menu_search").height() + 8).
      find("input[type=text]").focus();
}

function after_ajax() {
  jQuery("[data-tip_html_selector]").each(function(i, el) {
    var tip = Ext.create('Ext.tip.ToolTip', {
      target: el.id,
      html: jQuery(jQuery(el).attr("data-tip_html_selector")).html(),
      anchor: 'left',
      anchorToTarget: true,
      dismissDelay: 5000,
      hideDelay: 5000
    });
  });
}

jQuery(function() {
  after_ajax();
});

jQuery(document).ajaxSuccess(function() {
  after_ajax();
});

jQuery(window).resize(function() {
  positionSearch();
})
