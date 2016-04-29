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
end
