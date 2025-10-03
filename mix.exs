defmodule TetrIs.MixProject do
  use Mix.Project

  def project do
    [
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
      {:jason, "~> 1.4"},
      {:bandit, "~> 1.0"},
      {:msgpax, "~> 2.4"},
      {:gettext, "~> 0.20"},
      {:dns_cluster, "~> 0.2.0"},
      {:telemetry_metrics, "~> 1.0"},
      {:telemetry_poller, "~> 1.0"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
