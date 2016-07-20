defmodule ExSonar.Helper.Helper do
  @env if Application.get_env(:ex_sonar, :environment_name, :prod) != :prod, do: :staging, else: :live
  @moduledoc false

  def url(:customer) do
    case @env do
      :staging ->
        "https://sandbox.sendsonar.com/api/v1/customers"
      :live ->
        "https://sendsonar.com/api/v1/customers"
    end
  end

  def url(:messages) do
    case @env do
      :staging ->
        "https://sandbox.sendsonar.com/api/v1/messages"
      :live ->
        "https://sendsonar.com/api/v1/messages"
    end
  end

  def api_url do
    case @env do
      :staging ->
        "https://sandbox.sendsonar.com/api/v1/"
      :live ->
        "https://sendsonar.com/api/v1/"
    end
  end

  def url do
    case @env do
      :staging ->
        "https://sandbox.sendsonar.com/"
      :live ->
        "https://www.sendsonar.com/"
    end
  end

  def decode(input) do
    Poison.decode(input)
  end
end
