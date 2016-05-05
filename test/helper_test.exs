defmodule HelperTest do
  use ExUnit.Case

  setup_all do
    HTTPoison.start
  end

  test "valid sign_in" do
     assert [{"Set-Cookie", "_texthub_session" <> x }] = Helper.sign_in("enilsen16@icloud.com", "HiSunny12")
  end
end
