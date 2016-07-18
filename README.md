# Sonar

[![Build Status](https://travis-ci.org/enilsen16/ex_sonar.svg?branch=master)](https://travis-ci.org/enilsen16/ex_sonar)
[![Hex](https://img.shields.io/hexpm/v/ex_sonar.svg)](https://hex.pm/packages/ex_sonar)

Sonar documentation here -- http://docs.sendsonar.com/

## Installation

This package can be installed as:

  1. Add `ex_sonar` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ex_sonar, "~> 2.0"}]
    end
    ```

  2. Ensure `ex_sonar` is started before your application:

    ```elixir
    def application do
      [applications: [:ex_sonar]]
    end
    ```
  3. OPTIONAL: Add this line to your config if you'd like to change the dev and test mix environments for the dependency:

  ```elixir
  # log-in info from sandbox.sendsonar.com
  config :ex_sonar, Sonar,
    environment_name: Mix.env, # optional
    xtoken: YOUR_PRIVATE_KEY,
    public_key: YOUR_PUBLIC_KEY,
    email: YOUR_EMAIL,
    password: YOUR_PASSWORD
  ```

  4. REQUIRED: You will need these config options for production though:

  ```elixir
  # log-in info from sendsonar.com
  # /config/prod.exs
  config :ex_sonar, Sonar,
    xtoken: YOUR_PRIVATE_KEY,
    public_key: YOUR_PUBLIC_KEY,
    email: YOUR_EMAIL,
    password: YOUR_PASSWORD
  ```

## TODO

- [X] Messages support
  - [ ] Facebook messenger
- [X] Add Documentation
- [ ] Handle Error Cases
