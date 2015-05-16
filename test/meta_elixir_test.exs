defmodule MetaElixirTest do
  use ExUnit.Case

  require MetaElixir.MyMacros
  alias MetaElixir.MyMacros

  @tag timeout: 99999999

  test "my_if" do
    result = MyMacros.my_if 1 == 2, do: "works"
    assert result == nil

    result = MyMacros.my_if 1 == 1, do: "works"
    assert result == "works"
  end

  test "my_if_else" do
    result = MyMacros.my_if_else 1 == 2, do: "nope", else: "works"
    assert result == "works"

    result = MyMacros.my_if_else 1 == 1, do: "works", else: "nope"
    assert result == "works"
  end

  test "my_unless/1" do
    result = MyMacros.my_unless 1 == 2, do: "works"
    assert result == "works"

    result = MyMacros.my_unless 1 == 1, do: "works"
    assert result == nil
  end
end
