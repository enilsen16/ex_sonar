defmodule ExSonar.Customer do
  alias ExSonar.Helper.Helper, as: Helper
  alias ExSonar.Helper.Internal, as: Internal

  @url Helper.url(:customer)
  @opts Helper.config_opts
  @moduledoc """
    Customer related info
  """

  def get_customer(phone_number) do
    tokened_url =
      @url <>
      "?token=#{@opts[:xtoken]}" <>
      "&phone_number=#{phone_number}"
    HTTPoison.get!(tokened_url)
  end

  def available_numbers() do
    url = Helper.api_url <> "phone_numbers/available"
    HTTPoison.get!(url, [{"X-Publishable-Key", @opts[:public_key]}], [])
  end

  def all_customers() do
    internal_api = Helper.url <> "/api/customers?customer_type=all"
    {{"Set-Cookie", cookie }, auth_token} = Internal.sign_in()

    headers =
      [{"Cookie", cookie}, {"Referer", Helper.url},
      {"User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2724.0 Safari/537.36"}, {"X-CSRF-Token", auth_token}, {"X-Requested-With", "XMLHttpRequest"} ]

    %HTTPoison.Response{body: response} = HTTPoison.get!(internal_api, headers)
    Helper.decode(response)
  end

  def build(params) do
    {:ok, data} = params |> Poison.encode
    headers = [{"X-Token", @opts[:xtoken]}, {"Content-Type", "application/json"}]
    response = HTTPoison.post!(@url, data, headers)
    if response.status_code <= 300, do: true, else: false
  end
end
