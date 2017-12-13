var setElementHeight = function () {
    var height = $(window).height();
    $('.autoheight').css('height', (height));
    var height1 = $(window).height()/1.45;
    var heightS = $(window).height()/1.093;
    $('.autoheightS').css('height', (heightS));
    $('.autoheight1').css('height', (height1));
    $('.autoheight1').css('min-height', (height1));
    var height2 = $('.autoheight1').height()/5;
    $('.autoheight2').css('height', (height2));$('.autoheight2');
};

$(window).on("resize", function () {
    setElementHeight();
}).resize();
var rangeSlider = function(){
    var slider = $('.range-slider'),
        range = $('.range-slider__range'),
        value = $('.range-slider__value');

    slider.each(function(){

        value.each(function(){
            var value = $(this).prev().attr('value');
            $(this).html(value);
        });

        range.on('input', function(){
            $(this).next(value).html(this.value);
        });
    });
};

rangeSlider();