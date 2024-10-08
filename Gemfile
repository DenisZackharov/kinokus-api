source "https://rubygems.org"

ruby file: ".ruby-version"

gem "aws-sdk-s3"
gem "bootsnap", require: false
gem "dotenv"
gem "jsonapi-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rack-cors"
gem "rails", "~> 7.1.3.2"
gem "seedbank"
gem "tzinfo-data", platforms: %i[windows jruby]

gem "rswag-api"
gem "rswag-ui"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails"
  gem "rswag-specs"
  gem "rubocop"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "annotate"
  gem "brakeman"
  gem "bundler-audit"
  gem "ruby_audit"
end
