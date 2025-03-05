# railsでバックエンドからフロントエンドまで完結する設定
# require_relative "boot"

# require "rails/all"

# # Require the gems listed in Gemfile, including any gems
# # you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

# module ShelfApp
#   class Application < Rails::Application
#     # Initialize configuration defaults for originally generated Rails version.
#     config.load_defaults 7.0

#     config.middleware.insert_before 0, Rack::Cors do
#       allow do
#         origins 'http://localhost:3001' # フロントエンドのURLを指定
#         resource '*',
#                  headers: :any,
#                  methods: [:get, :post, :put, :patch, :delete, :options, :head],
#                  credentials: true
#       end
#     end

#     # Configuration for the application, engines, and railties goes here.
#     #
#     # These settings can be overridden in specific environments using the files
#     # in config/environments, which are processed later.
#     #
#     # config.time_zone = "Central Time (US & Canada)"
#     # config.eager_load_paths << Rails.root.join("extras")
#   end
# end

# # フロントエンドにreactを用いる場合の設定

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ShelfApp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.middleware.use ActionDispatch::Cookies
    config.action_dispatch.cookies_same_site_protection = :none

    # Rack::Cors の設定
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins ENV.fetch('FRONTEND_URL', 'http://localhost:3001')
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :patch, :delete, :options, :head],
                 credentials: true
      end
    end

    # API 専用設定
    config.api_only = true
  end
end
