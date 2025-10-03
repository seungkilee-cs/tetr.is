# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :tetr_is,
  generators: [timestamp_type: :utc_datetime]

config :tetr_is, TetrIsWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: TetrIsWeb.ErrorHTML, json: TetrIsWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: TetrIs.PubSub,
  # Generate new one if needed
  live_view: [signing_salt: "your_signing_salt"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
