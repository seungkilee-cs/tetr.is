import Config

config :tetr_is, TetrIsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "generate_your_own_secret_key_base_here",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:tetr_is, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:tetr_is, ~w(--watch)]}
  ]

config :tetr_is, TetrIsWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/tetr_is_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true
