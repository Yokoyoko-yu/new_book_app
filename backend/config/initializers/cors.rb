Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # ReactのURL
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: true  # これが必要
  end
end