defmodule Sonar.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_sonar,
     version: "2.0.1",
     elixir: "~> 1.3",
     docs: docs(),
     description: description(),
     package: package(),
     preferred_cli_env: [
        vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
      ],
     deps: deps()]
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
      {:httpoison, "~> 0.8"},
      {:poison, "~> 2.2"},
      {:floki, "~> 0.8"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 1.0", only: :dev, override: true}
    ]
  end

  defp docs do
    [
      extras: docs_extras(),
      main: "readme"
    ]
  end

  defp docs_extras do
    ["README.md"]
  end

  defp description do
    """
    A @sendsonar API interface for Elixir
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      name: :ex_sonar,
      maintainers: ["Erik Nilsen"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/enilsen16/ex_sonar",
        "Docs" => "https://hexdocs.pm/ex_sonar"
      }
    ]
  end
end
