source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '~> 2.4'
gem 'rails', '~> 5'
gem 'puma', '~> 3.11'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'bcrypt', platforms: :ruby #https://github.com/codahale/bcrypt-ruby/issues/142
gem 'rinku'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # unfortunate, but hopefully temporary
  if RUBY_PLATFORM =~ /win/ || RUBY_PLATFORM =~ /mingw/
    gem "sqlite3", git: "https://github.com/stomar/sqlite3-ruby", branch: "add-dlfcn", platforms: [:mingw, :x64_mingw]
  else
    gem "sqlite3"
  end
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'better_errors'
  gem 'rails_apps_pages'
  gem 'rails_apps_testing'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :production do
  gem 'pg'
end
group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.0'

gem 'momentjs-rails'
gem 'rails_bootstrap_sortable'


gem 'high_voltage'
gem 'jquery-rails'

gem 'devise'

gem 'gon'
