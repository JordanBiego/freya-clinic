source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "image_processing", "~> 1.2"

#Life-Savers and Validators
gem 'cns_brazil'
gem 'validates_cpf'
gem 'validates_email_format_of'
gem 'simple_form'

gem 'kaminari'
gem 'bootstrap5-kaminari-views'

gem 'elasticsearch', "< 7.14"
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

  # Using only on development fase, gonna delete this soon
  gem 'pry-byebug'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'pry'
  # gem 'pry-byebug'

  gem 'rubocop', '~> 1.32', require: false
  gem 'solargraph'

end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
