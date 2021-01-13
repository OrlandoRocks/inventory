source 'https://api.rubygems.org'

ruby '2.5.1'
#ruby-gemset=inventory-gemset


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'.
gem 'rails', github: 'rails/rails', branch: '5-2-stable'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.20.0'
# Use SCSS for stylesheets.
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets.
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views.
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes.
# gem 'execjs', '~> 2.7'
# gem 'therubyracer', platforms: :ruby

gem 'rake', '~> 12.3', '>= 12.3.3'

gem 'audited', '~> 4.9'

gem 'bootsnap', require: false

gem 'redis', '~> 3.0'

gem 'money'


# Use jquery as the JavaScript library.
gem 'jquery-rails', '~> 4.3'

gem 'jquery-ui-rails', '~> 5.0.5'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks.
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder.
gem 'jbuilder', '~> 2.10'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Puma as the app server
gem 'puma'

# Simple Rails app configuration.
gem 'figaro', '~> 1.1.1'

# Pry-based enhancements for the defaults Rails 3 and 4 consoles.
#gem 'jazz_hands', github: 'danrabinowitz/jazz_hands', branch: 'use-newer-version-of-pry', groups: [:development, :test]

# Rails seed data structure.
gem 'seedbank', '~> 0.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console.
  #
  #
  gem 'listen'
  gem 'awesome_print', require: 'ap'
  gem 'byebug'
  gem 'rb-readline'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views.
  # gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring.
  gem 'spring', '~> 2.0'

  # Add a comment summarizing the current schema.
  gem 'annotate', '~> 2.7.5'

  # Code metric tool for rails projects.
  gem 'rails_best_practices', '>= 1.15.7'

  # A static analysis security vulnerability scanner for Ruby on Rails applications.
  gem 'brakeman', '~> 3.1.4'

  # Better error page for Rack apps.
  gem 'better_errors', '>= 2.1.1'

  # Remote multi-server automation tool.
  gem 'mina'
  gem 'mina-multistage', '~> 1.0.2', require: false
  gem 'mina-puma', '~> 1.0.0', require: false
end

# Provides the generator settings required for Rails 3 and 4 to use Slim
gem 'slim-rails', '~> 3.2.0'

# Search Engine Optimization (SEO) plugin for Ruby on Rails applications.
gem 'meta-tags'

# Bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications.
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

# Font-Awesome SASS gem for use in Ruby projects
gem 'font-awesome-sass', '~> 5.13.0'

# Flag icons SASS gem for Ruby
gem 'flag-icons-rails', '~> 1.1', '>= 1.1.2'

# Integrates the Twitter Bootstrap pagination component with will_paginate
gem 'will_paginate-bootstrap', '~> 1.0.1'

# This Modernizr.js was built using the at http://www.modernizr.com/download/ with all options enabled.
gem 'modernizr-rails', '~> 2.7', '>= 2.7.1'

# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.7.2'

# ClientSideValidations for Ruby on Rails
gem 'client_side_validations', '~> 12.0.0'

# Pace automatic web page progress bar
gem 'pace-rails', '~> 0.1.3'

# Super customized checkboxes and radio buttons with jquery & zepto
gem 'icheck-rails', '~> 1.0', '>= 1.0.2.1'

# Object oriented authorization for Rails applications
gem 'pundit', '~> 1.1'

# Dump (parts) of your database to db/Items_csv.rb to get a headstart creating a meaningful Items_csv.rb file.
gem 'seed_dump', '~> 3.3.0'

# A simple Ruby on Rails plugin for creating and managing a breadcrumb navigation.
gem 'breadcrumbs_on_rails', '~> 2.3.1'

# Ransack enables the creation of both simple and advanced search forms for your Ruby on Rails application.
gem 'ransack', github: 'activerecord-hackery/ransack', branch: '8daa87a0389d380f7c9fd7ea9cb5bda634d5dc7d'

source 'https://rails-assets.org' do
  # Sweet Alert gem to replace JavaScript's alert
  # gem 'rails-assets-sweetalert2', '~> 0.4.0'
end


#Gema de apoyo para reportes de jasper
#
# gem 'rjb'

# Easy upload management for ActiveRecord
# gem 'paperclip', '~> 4.3', '>= 4.3.5'
gem 'mini_magick'
gem 'carrierwave', '~> 2.0'
#

#Gema para el manejo del componente de fecha
gem 'bootstrap-datepicker-rails', '~> 1.6.4'

# Parse, validate, manipulate, and display dates in JavaScript. Needed by bootstrap-daterangepicker-rails
gem 'momentjs-rails', '~> 2.11.1'

# Bootstrap-date-range-picker. A JavaScript component for choosing date ranges.
gem 'bootstrap-daterangepicker-rails', '~> 0.1.5'

#Gema para generar archivos de excel
gem 'caxlsx'
gem 'caxlsx_rails'

# Double entry accounting system
gem "plutus", "~> 0.13.0"

gem 'active_model_serializers', '~> 0.10.0'


gem 'fcm'


#Gema que nos sirve para eliminar acentos.
gem 'unidecoder'

gem "roo", "~> 2.8.0"

gem 'awesome_rails_console'
# Please clean up duplicated gems if any.
# Feel free to remove gems that you don't want to use or if they conflict with other gem dependencies. (you might need to update .pryrc also)
group :development, :test do
  gem 'hirb'
  gem 'hirb-unicode-steakknife', require: 'hirb-unicode'
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
end

#Gema nueva para generar reportes
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

