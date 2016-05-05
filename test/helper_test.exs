defmodule HelperTest do
  alias ExSonar.Helper.Internal, as: Internal
  use ExUnit.Case

  test "valid sign_in" do
    {{"Set-Cookie", "_texthub_session=" <> x }, string} = Internal.sign_in("enilsen16@icloud.com", "HiSunny12")
    assert String.ends_with? x, "HttpOnly"
    assert String.ends_with? string, "=="
  end
end
