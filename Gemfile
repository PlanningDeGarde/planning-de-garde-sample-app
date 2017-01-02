source 'https://rubygems.org'

ruby '2.3.2'

gem 'rails', '4.2.4'
gem 'pg'

gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.0'

gem 'coffee-rails', '~> 4.1.0'
gem 'sass-rails', '~> 5.0'

# External assets
source 'https://rails-assets.org' do
	gem 'rails-assets-jquery'
	gem 'rails-assets-jquery-ujs'
	gem 'rails-assets-bootstrap'
	gem 'rails-assets-fullcalendar', '2.4.0'
end

gem 'sdoc', '~> 0.4.0', group: :doc

gem 'nokogiri', '~> 1.6.8'

# Server
gem 'unicorn'

# Forms
gem 'simple_form'

# Auth
gem 'devise'

# Planning de garde
gem 'omniauth-planningdegarde', github: "PlanningDeGarde/omniauth-planningdegarde"#, path: "../omniauth-planningdegarde/"
gem 'planning-de-garde', github: "PlanningDeGarde/planning-de-garde" #, path: "../planning-de-garde/"


group :development do
  gem 'letter_opener'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

