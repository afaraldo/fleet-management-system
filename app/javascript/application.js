// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import jquery from "jquery"; // Import JQuery

window.jQuery = jquery
window.$ = jquery

$( document ).ready(function() {
    $('.layout-menu-toggle').click(function(){
        $('#html-document').toggleClass('layout-menu-expanded');
    });
});



