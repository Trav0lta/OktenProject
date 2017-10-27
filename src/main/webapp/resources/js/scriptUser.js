var setElementHeight = function () {
    var height = $(window).height();
    $('.autoheight').css('height', (height));
    var height1 = $(window).height()/1.352;
    $('.autoheight1').css('height', (height1));
    $('.autoheight1').css('min-height', (height1));
    var height2 = $('.autoheight1').height()/5;
    $('.autoheight2').css('height', (height2));$('.autoheight2').css('min-height', (height2));
    var mTop = $('.autoheight2').height()/2.7;
    $('.mTop').css('margin-top', (mTop));
};

$(window).on("resize", function () {
    setElementHeight();
}).resize();