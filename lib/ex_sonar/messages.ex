defmodule ExSonar.Messages do
  alias ExSonar.Helper.Helper, as: Helper

  @moduledoc """
  Send messages
  """
  @url Helper.url(:messages)
  @opts Helper.config_opts

  def send_sms(to_number, message, media) do
    {:ok, body} =
      %{to: to_number, text: message, media_url: media}
      |> Enum.filter(fn {_k, v} -> v != "" end)
      |> Enum.into(%{})
      |> Poison.encode

    HTTPoison.post(@url, body, [{"X-Token", @opts[:xtoken]}, {"Content-Type", "application/json"}])
  end
end
