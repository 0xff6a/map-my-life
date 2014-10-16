require "#{Dir.pwd}/app/lib/application_settings.rb"
ApplicationSettings.config = YAML.load_file("config/application_settings.yml")[Rails.env]