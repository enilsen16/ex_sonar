defmodule CustomerTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
    {:ok, customer_number: "5103437203", token: "U0pdMeJMbO1nwEuQ_0QcVH8uQjPjDIxk", public_key: "910f62e3-dc80-40f4-a541-36770daedabc"}
  end

  test "valid phone number and token", context do
    use_cassette "return customer" do
      response = Customer.get_customer(context[:customer_number], context[:token] )
      assert {:ok, body} = response
      assert body.status_code == 200
    end
  end

  test "return a list of valid numbers", context do
    use_cassette "our number" do
      response = Customer.available_numbers(context[:public_key])
      assert {:ok, response_body} = response
      assert response_body.status_code == 200
      {:ok, body} = response_body.body
      |> Helper.decode
      assert body["available_number"] == "6188470781"
    end
  end

  # test "return a list of all customers" do
  #   use_cassette "all_customers" do
  #     response = Customer.all_customers
  #   end
  # end
end
