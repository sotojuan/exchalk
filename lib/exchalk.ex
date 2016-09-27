defmodule ExChalk do
  @moduledoc false

  alias IO.ANSI

  @colors [
    "black",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white"
  ]

  @modifiers [
    reset: ANSI.reset,
    bold: ANSI.bright,
    dim: ANSI.faint,
    italic: ANSI.italic,
    underline: ANSI.underline,
    hidden: "\e[8m",
    strikethrough: "\e[9m"
  ]

  for {name, code} <- Enum.with_index(@colors) do
    def unquote(:"#{name}")(str) do
      # Forcing to string for easier dev and testing; may change laters
      [ANSI.color(unquote(code)), str, ANSI.reset] |> IO.iodata_to_binary
    end

    def unquote(:"bg_#{name}")(str) do
      [ANSI.color_background(unquote(code)), str, ANSI.reset]
        |> IO.iodata_to_binary
    end
  end

  for {name, code} <- @modifiers do
    def unquote(:"#{name}")(str) do
      [unquote(code), str, ANSI.reset] |> IO.iodata_to_binary
    end
  end

  def gray(str), do: ["\e[90m", str, ANSI.reset]
  def grey(str), do: gray(str)
end
