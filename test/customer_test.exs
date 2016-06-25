defmodule CustomerTest do
  alias ExSonar.Customer, as: Customer
  alias ExSonar.Helper.Helper, as: Helper
  use ExUnit.Case

  setup_all do
    {:ok, customer_number: "5103437203"}
  end

  test "valid phone number and token", context do
    response = Customer.get_customer(context[:customer_number])
    assert response
    assert response.status_code == 200
  end

  test "return a list of valid numbers", context do
    response = Customer.available_numbers()
    assert response
    assert response.status_code == 200
    {:ok, body} = response.body
    |> Helper.decode
    assert body["available_number"] == "6188470781"
  end

  test "return a list of all customers" do
    assert {:ok, _} = Customer.all_customers()
  end

  test "add a customer", context do
    assert Customer.build(%{phone_number: context[:customer_number]})
  end
end
