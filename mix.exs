defmodule Sonar.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_sonar,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  def deps do
    [
      {:exvcr, "~> 0.7", only: :test},
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 2.1"},
      {:floki, "~> 0.8"},
      {:mix_test_watch, github: "lpil/mix-test.watch", only: :dev}
    ]
  end

  defp description do
    """
    A Sonar API interface for Elixir
    """
  end

  defp package do
    [
    name: :ex_sonar,
    maintainers: ["Erik Nilsen"],
    licenses: ["MIT"],
    links: %{"GitHub" => "https://github.com/enilsen16/ex_sonar"}]
  end
end
