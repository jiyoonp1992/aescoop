$(function() {
	$(".glyphicon").click(function(e) {
		e.preventDefault();
		$(".prod_info_char_more_overlay").fadeIn(300);
		
        });

    $(".x_icon").click(function(e) {
        e.preventDefault();
        $(".prod_info_char_more_overlay").fadeOut(300);
    });
    
    $(".more_bt").click(function(e) {
		e.preventDefault();
		$(".more_view_overlay").fadeIn(300);
		
        });

    $(".x_icon").click(function(e) {
        e.preventDefault();
        $(".more_view_overlay").fadeOut(300);
    });
});
