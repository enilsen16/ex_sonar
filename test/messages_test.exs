defmodule MessagesTest do
  use ExUnit.Case, async: false

  setup_all do
    {:ok, to: "5103437203"}
  end

  test "send a message", context do
    response = ExSonar.send(context[:to], "Testy")
    assert {:ok, response_body} = response
    assert response_body.status_code == 200
  end
end
