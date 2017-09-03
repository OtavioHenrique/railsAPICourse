source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "active_model_serializers", "~> 0.10.0"
gem "jwt"
gem "puma", "~> 3.0"
gem "rack-cors"
gem "rails", "~> 5.0.1"
gem "rails-i18n", "~> 5.0.0"
gem "sqlite3"

group :development, :test do
  gem "byebug", platform: :mri
  gem "faker"
  gem "pry-rails"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
