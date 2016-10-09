defmodule ExChalkTest do
  use ExUnit.Case

  test "should style string with color" do
    actual = ExChalk.red("foo") |> ExChalk.to_str
    expected = "\e[38;5;1mfoo\e[39m"

    assert actual == expected
  end

  test "should apply the latest style" do
    actual = "hi" |> ExChalk.red |> ExChalk.blue |> ExChalk.to_str
    expected = "\e[38;5;1m\e[38;5;4mhi\e[39m\e[39m"

    assert actual == expected
  end

  test "should style string with modifiers" do
    actual = ExChalk.underline("foo") |> ExChalk.to_str
    expected = "\e[4mfoo\e[24m"

    assert actual == expected
  end

  test "should allow string concatenation" do
    a = ExChalk.red("red") |> ExChalk.to_str
    b = ExChalk.red("yellow") |> ExChalk.to_str
    actual = a <> " " <> b
    expected = "\e[38;5;1mred\e[39m \e[38;5;1myellow\e[39m"

    assert actual == expected
  end

  test "sets background" do
    actual = ExChalk.bg_red("foo") |> ExChalk.to_str
    expected = "\e[48;5;1mfoo\e[49m"

    assert actual == expected
  end

  test "should be pipable" do
    actual =
      "foo"
        |> ExChalk.bg_red
        |> ExChalk.blue
        |> ExChalk.italic
        |> ExChalk.to_str
    expected = "\e[48;5;1m\e[3m\e[38;5;4mfoo\e[39m\e[23m\e[49m"

    assert actual == expected
  end
end
