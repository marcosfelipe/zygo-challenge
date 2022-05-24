// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('select')
  var instances = M.FormSelect.init(elems, {})
});
