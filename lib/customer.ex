defmodule Customer do
  use HTTPoison.Base

  @url Helper.url(:customer)

  def get_customer(phone_number, token) do
    tokened_url =
      @url <>
      "?token=#{token}" <>
      "&phone_number=#{phone_number}"
    HTTPoison.get(tokened_url)
  end

  def available_numbers(token) do
    url = Helper.api_url <> "phone_numbers/available"
    HTTPoison.get(url, [{"X-Publishable-Key", token}], [])
  end

  def all_customers(email, password) do
    internal_api = Helper.url <> "/api/customers?customer_type=all"
    {{"Set-Cookie", cookie }, auth_token} = Helper.sign_in(email, password)

    headers =
      [{"Cookie", cookie}, {"Referer", Helper.url},
      {"User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2724.0 Safari/537.36"}, {"X-CSRF-Token", auth_token}, {"X-Requested-With", "XMLHttpRequest"} ]

    {:ok, %HTTPoison.Response{body: response}} = HTTPoison.get(internal_api, headers)
    Helper.decode(response)
  end
end
