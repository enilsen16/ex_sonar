defmodule Helper do
  @env if Mix.env != :prod, do: :staging, else: :live

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

  def url do
    case @env do
      :staging ->
        "https://sandbox.sendsonar.com/api/v1/"
      :live ->
        "https://sendsonar.com/api/v1/"
    end
  end

  def decode(input) do
    Poison.decode(input)
  end
end
