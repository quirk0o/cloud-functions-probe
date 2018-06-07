defmodule CloudFunctions.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cloud_functions,
      version: "0.0.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      escript: [
        main_module: CloudFunctions.Probe
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [:logger, :poison, :hackney],
      mod: {CloudFunctions.Application, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:tesla, "~> 0.7.0"},
      {:poison, ">= 1.0.0"},
      {:hackney, "~> 1.8"}
    ] # for JSON middleware
  end
end
