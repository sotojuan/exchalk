defmodule ExChalkTest do
  use ExUnit.Case

  test "should style string" do
    actual = ExChalk.red("foo")
    expected = "\e[38;5;1mfoo\e[0m"

    assert actual == expected
  end

  test "should allow string concatenation" do
    actual = ExChalk.red("red") <> " " <> ExChalk.yellow("yellow")
    expected = "\e[38;5;1mred\e[0m \e[38;5;3myellow\e[0m"

    assert actual == expected
  end
end
