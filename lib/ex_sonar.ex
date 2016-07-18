defmodule ExSonar do
  alias ExSonar.{Messages, Customer}

  @doc """
  Send a SMS message
  """
  #TODO: Add FB Messenger Support
  def send(phone_number, message, media \\ "") do
    Messages.send_sms(phone_number, message, media)
  end

  @doc """
  Returns a specfic customer
  """
  def list_customer(phone_number) do
    Customer.get_customer(phone_number)
  end

  @doc """
  Returns a list of phone_numbers avialable to you
  """
  def list_numbers() do
    Customer.available_numbers()
  end

  @doc """
  Returns a list of all customers
  """
  def list_all_customers() do
    Customer.all_customers()
  end

  @doc """
  Add or update a customer/user
  """
  def update_user(params) do
    Customer.build(params)
  end
end
