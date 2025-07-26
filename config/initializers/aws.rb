Aws.config.update(
  region: ENV.fetch("AWS_REGION") { Rails.application.credentials.dig(:aws, :region) },
  credentials: Aws::Credentials.new(
    ENV.fetch("AWS_ACCESS_KEY_ID") { Rails.application.credentials.dig(:aws, :access_key_id) },
    ENV.fetch("AWS_SECRET_ACCESS_KEY") { Rails.application.credentials.dig(:aws, :secret_access_key) }
  )
)
