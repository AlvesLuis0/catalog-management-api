# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDIS_URL") { Rails.application.credentials.redis_url || "redis://localhost:6379/0" } }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL") { Rails.application.credentials.redis_url || "redis://localhost:6379/0" } }
end
