defmodule ExSonar.Helper.Internal do
  alias ExSonar.Helper.Helper, as: Helper
  @moduledoc """
    Helper functions to access Sonar's Internal API
  """

  def sign_in(email, password) do
    sign_in_url = Helper.url <> "users/sign_in"
    {:ok, response} = HTTPoison.get(sign_in_url)
    {{"Set-Cookie", cookie}, auth_token} = capture_tokens(response)
    data = sign_in_params(auth_token, email, password)
    headers =
      [{"Cookie", cookie}, {"Referer", sign_in_url}, {"Origin", Helper.url},
      {"User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2724.0 Safari/537.36"},
      {"Upgrade-Insecure-Requests", 1}, {"Content-Type", "application/x-www-form-urlencoded"}]

    {:ok, response} = HTTPoison.request(:post, sign_in_url, data, headers, [{:follow_redirect, true}])
    {"Set-Cookie", cookie} = get_cookie(response)

    headers =
      [{"Cookie", cookie}, {"Referer", sign_in_url}, {"Origin", Helper.url},
      {"User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2724.0 Safari/537.36"}]

    {:ok, response} = HTTPoison.get(Helper.url, headers)
    capture_tokens(response)
  end

  defp sign_in_params(auth_token, email, password) do
    [auth_token, email, password] =
      Enum.map [auth_token, email, password], &URI.encode_www_form(&1)
    "utf8=%E2%9C%93&authenticity_token=#{auth_token}&user%5Bemail%5D=#{email}&user%5Bpassword%5D=#{password}&commit=Log+in&user%5Bremember_me%5D=0&user%5Bremember_me%5D=1"
  end

  defp capture_tokens(response) do
    {get_cookie(response), get_authenticity_token(response)}
  end

  defp get_cookie(response) do
    headers =
      case Map.has_key?(response, :headers) do
        true ->
          response.headers
        false ->
         %HTTPoison.AsyncResponse{id: {:maybe_redirect, 302, response_headers, _}} = response
         response_headers
      end
    list =
      Enum.filter headers, fn(header) ->
        case header do
          {"Set-Cookie", "_texthub_session" <> _ } -> true
          _ -> false
        end
      end
    List.first(list)
  end

  defp get_authenticity_token(response) do
    response.body
    |> Floki.find("head meta[name=csrf-token]")
    |> Floki.attribute("content")
    |> List.first
  end
end
