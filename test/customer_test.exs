defmodule CustomerTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "valid phone number and token" do
    use_cassette "get_customer_valid" do
      response = Customer.get_customer("5103437203", "U0pdMeJMbO1nwEuQ_0QcVH8uQjPjDIxk")
      assert {:ok, body} = response
      assert body.status_code == 200
    end
  end

  test "return a list of valid numbers" do
    use_cassette "valid_numbers" do
      response = Customer.avialable_numbers('910f62e3-dc80-40f4-a541-36770daedabc')
      assert {:ok, response_body} = response
      assert response_body.status_code == 200
      {:ok, body} = response_body.body
      |> Helper.decode
      assert body["available_number"] == "6188470781"
    end
  end
end
