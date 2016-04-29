# SendSonar

A SendSonar Interface for Elixir

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `send_sonar_api` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:send_sonar_api, "~> 0.0.1"}]
    end
    ```

  2. Ensure `send_sonar_api` is started before your application:

    ```elixir
    def application do
      [applications: [:send_sonar_api]]
    end
    ```

## TODO

- [ ] Webhooks
- [ ] Messages support
  - [ ] Facebook messenger
