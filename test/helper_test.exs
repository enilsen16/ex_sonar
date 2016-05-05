defmodule HelperTest do
  use ExUnit.Case

  test "valid sign_in" do
    {{"Set-Cookie", "_texthub_session=" <> x }, string} = Helper.sign_in("enilsen16@icloud.com", "HiSunny12")
    assert String.ends_with? x, "HttpOnly"
    assert String.ends_with? string, "=="
  end
end
