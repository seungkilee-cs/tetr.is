import Config

config :tetr_is, TetrIsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  debug_errors: true,
  secret_key_base: "local_dev_secret_key_base_at_least_64_bytes_long_for_development_only"

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
