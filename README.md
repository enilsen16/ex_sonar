# Sonar

[![Build Status](https://travis-ci.org/enilsen16/ex_sonar.svg?branch=master)](https://travis-ci.org/enilsen16/ex_sonar)
[![Hex](https://img.shields.io/hexpm/v/ex_sonar.svg)](https://hex.pm/packages/ex_sonar)

Sonar documentation here -- http://docs.sendsonar.com/

## Installation

This package can be installed as:

  1. Add `ex_sonar` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ex_sonar, "~> 0.1.0"}]
    end
    ```

  2. Ensure `ex_sonar` is started before your application:

    ```elixir
    def application do
      [applications: [:ex_sonar]]
    end
    ```
  3. Add this line to your config if you'd like to change the mix environments for the dependency:

  ```elixir
  config :ex_sonar, environment_name: Mix.env
  ```

## TODO

- [X] Messages support
  - [ ] Facebook messenger
- [X] Add Documentation
- [ ] Handle Error Cases
