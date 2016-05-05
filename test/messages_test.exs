defmodule MessagesTest do
  use ExUnit.Case

  setup_all do
    HTTPoison.start
    {:ok, to: "5103437203", token: "U0pdMeJMbO1nwEuQ_0QcVH8uQjPjDIxk"}
  end

  test "send a message", context do
    text = "Testy"
    response = Messages.send(context[:token], context[:to], text)
    assert {:ok, response_body} = response
    assert response_body.status_code == 200
  end
end
