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
end
