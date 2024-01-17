require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module RegistrationApp
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
  end
end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:4200' 
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :delete, :options, :head],
      credentials: true 
  end
end
