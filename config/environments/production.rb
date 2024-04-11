Rails.application.configure do
  # Disable automatic reloading of code between requests.
  config.cache_classes = true

  # Eager load code on boot to improve performance.
  config.eager_load = true

  # Disable full error reports and enable caching of error pages.
  config.consider_all_requests_local = false

  # Ensure a master key is present to decrypt credentials.
  # config.require_master_key = true

  # Disable serving static files directly from the public folder.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Configure Active Storage service to store files locally.
  config.active_storage.service = :local

  # Enable SSL to force all access to the app over HTTPS.
  config.force_ssl = true

  # Set logging level to info and include request ID in log tags.
  config.log_level = :info
  config.log_tags = [ :request_id ]

  # Disable caching of deprecation notices.
  config.active_support.report_deprecations = false

  # Use the default logging formatter to include PID and timestamp.
  config.log_formatter = ::Logger::Formatter.new

  # Use STDOUT for logging if RAILS_LOG_TO_STDOUT environment variable is present.
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations to avoid accidental exposure of schema in production.
  config.active_record.dump_schema_after_migration = false

  # Enable locale fallbacks for I18n to fallback to default locale if translation is missing.
  config.i18n.fallbacks = true
end
