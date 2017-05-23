source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'jbuilder'
gem 'mysql2'
gem 'puma'
gem 'rails'
gem 'sass-rails'
gem 'slim'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier'

gem 'elasticsearch-model'
gem 'elasticsearch-rails'

group :development, :test do
  gem 'active_record-annotate'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'pry'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end
