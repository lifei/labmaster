var $j = jQuery.noConflict();
$j(document).ready(function() {
    $j('#fold').click(function() {
        if($j(this).text() != '[展开]') {
            $j(this).text('[展开]');
            $j('#filter').height('29px');
            $j('form', $j('#filter')).hide();
        } else {
            $j(this).text('[折叠]');
            $j('form', $j('#filter')).show();
            var button = $j('#filter-button');
            var h = button.offset().top +
            button.height() + 15 - $j('#filter').offset().top
            $j('#filter').height(h + 'px');
        }
    });
    try {
    if(fold == 'open')
        $j('#fold').click();
        } catch(e) {}
});

