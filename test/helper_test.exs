defmodule HelperTest do
  alias ExSonar.Helper.Internal, as: Internal
  use ExUnit.Case

  test "valid sign_in", context do
    {{"Set-Cookie", "_texthub_session=" <> x }, string} = Internal.sign_in()
    assert String.ends_with? x, "HttpOnly"
    assert String.ends_with? string, "=="
  end
end
