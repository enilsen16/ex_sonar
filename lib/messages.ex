defmodule ExSonar.Messages do
  alias ExSonar.Helper.Helper, as: Helper
  use HTTPoison.Base

  @moduledoc """
  Send a message
  """
  @url Helper.url(:messages)
  @opts Helper.config_opts

  @doc """
    Send a SMS message
  """
  def send(to_number, message, media \\ "") do
    {:ok, body} = %{to: to_number, text: message, media_url: media} |> Poison.encode
    HTTPoison.post(@url, body, [{"X-Token", @opts[:xtoken]}, {"Content-Type", "application/json"}])
  end
end
