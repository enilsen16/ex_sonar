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

  def sign_in(email, password) do
    {[{"Set-Cookie", cookie}], auth_token} = capture_tokens
    sign_in_url = url <> "users/sign_in"
    data = sign_in_params(auth_token, email, password)
    headers =
      [{"Cookie", cookie}, {"Referer", sign_in_url}, {"Origin", url},
      {"User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2724.0 Safari/537.36"},
      {"Upgrade-Insecure-Requests", 1}, {"Content-Type", "application/x-www-form-urlencoded"}]

    {:ok, response} = HTTPoison.request(:post, sign_in_url, data, headers, [{:follow_redirect, true}])
    get_cookie(response)
  end

  defp sign_in_params(auth_token, email, password) do
    [auth_token, email, password] =
      Enum.map [auth_token, email, password], &URI.encode_www_form(&1)
    "utf8=%E2%9C%93&authenticity_token=#{auth_token}&user%5Bemail%5D=#{email}&user%5Bpassword%5D=#{password}&commit=Log+in&user%5Bremember_me%5D=0&user%5Bremember_me%5D=1"
  end

  defp capture_tokens do
    {:ok, response} = HTTPoison.get(url <> "users/sign_in")
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

    Enum.filter headers, fn(header) ->
      case header do
        {"Set-Cookie", "_texthub_session" <> _ } -> true
        _ -> false
      end
    end
  end

  defp get_authenticity_token(response) do
    response.body
    |> Floki.find("head meta[name=csrf-token]")
    |> Floki.attribute("content")
    |> List.first
  end
end
