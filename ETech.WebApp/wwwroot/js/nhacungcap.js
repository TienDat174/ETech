$(document).ready(function () {
    $('.sub-btn').click(function () {
        $(this).next('.sub-menu').slideToggle();
        $(this).find('.side-bar_dropdown').toggleClass('rotate');
    });
});