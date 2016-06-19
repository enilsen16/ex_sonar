defmodule ExSonar.Messages do
  alias ExSonar.Helper.Helper, as: Helper
  use HTTPoison.Base

  @moduledoc """
  Send a message
  """
  @url Helper.url(:messages)

  @doc """
    Send a SMS message
  """
  def send(token, to_number, message, media \\ nil) do
    {:ok, body} = %{to: to_number, text: message, media: media} |> Poison.encode
    HTTPoison.post(@url, body, [{"X-Token", token}, {"Content-Type", "application/json"}])
  end
end
