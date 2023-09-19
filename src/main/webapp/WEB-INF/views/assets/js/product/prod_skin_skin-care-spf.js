$(function() {
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll > 168) {
            $(".list_theme_detail_prod").css("position", "fixed");
            $(".list_theme_detail_prod").css("top", "74px");
            $(".list_theme_detail_prod").css("left", "0");
            $(".list_theme_detail_prod").css("width", "100%");
            $(".list_explanation").css("margin-top", "98px");
        } else {
            $(".list_theme_detail_prod").css("position", "");
            $(".list_explanation").css("margin-top", "0");
        }
    })

    
    $(".filter").click(function(e) {
        e.preventDefault();
        $(".overlay_filter").fadeIn(300);
    });

    $(".x_icon").click(function(e) {
        e.preventDefault();
        $(".overlay_filter").fadeOut(300);
    });
})