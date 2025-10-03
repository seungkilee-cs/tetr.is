# /mix.exs
defmodule TetrIs.MixProject do
  use Mix.Project

  def project do
    [
      # Make sure this is tetr_is, not temp_tetr_is
      app: :tetr_is,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {TetrIs.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.8.1"},
      {:phoenix_live_view, "~> 1.0"},
      {:telemetry_metrics, "~> 1.0"},
      {:telemetry_poller, "~> 1.0"},
      {:jason, "~> 1.4"},
      {:dns_cluster, "~> 0.2.0"},
      {:bandit, "~> 1.0"},
      {:msgpax, "~> 2.4"},
      {:gettext, "~> 0.20"},

      # Development and test dependencies
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      "assets.setup": ["esbuild.install --if-missing"],
      "assets.build": ["esbuild tetr_is"],
      "assets.deploy": [
        "esbuild tetr_is --minify",
        "phx.digest"
      ]
    ]
  end
end
