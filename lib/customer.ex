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

  def all_customers do
    true
  end
end
