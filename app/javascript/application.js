// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
//import "controllers"
import * as bootstrap from "bootstrap"

// Import JQuery
//import jquery from 'jquery'

import jquery from "jquery";
import Polipop from 'polipop';

window.jQuery = jquery
window.$ = jquery
window.Polipop = Polipop
var polipop1 = new Polipop('lollipop', {
    layout: 'popups',
    insert: 'before',
    pool: 5,
    sticky: true,
    theme: 'default',
    closer: false,
    position: 'top-right'
});
window.polipop1 = polipop1

$( document ).ready(function() {
    $('.layout-menu-toggle').click(function(){
        $('#html-document').toggleClass('layout-menu-expanded');
    });
});



