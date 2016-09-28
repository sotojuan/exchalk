defmodule ExChalk do
  @moduledoc """
  Provides a simple interface to text color and styling.

  ExChalk exposes three APIs: colors, background colors, and modifiers.

  ## Colors

  `ExChalk.color_name(text)` will color `text` with `color_name` color.

  Supported colors are:

  - `black`
  - `red`
  - `green`
  - `yellow`
  - `blue`
  - `magenta`
  - `cyan`
  - `white`
  - `gray`

  Example: `ExChalk.red("Hello!")`

  ## Background colors

  `ExChalk.bg_color_name(text)` will color `text` with `bg_color_name`
  background color.

  Supported background colors are:

  - `bg_black`
  - `bg_red`
  - `bg_green`
  - `bg_yellow`
  - `bg_blue`
  - `bg_magenta`
  - `bg_cyan`
  - `bg_white`

  Example: `ExChalk.bg_red("Hello!")`

  ## Modifiers

  `ExChalk.modifier(text)` will style `text` with a given `modifier`.

  Supported modifiers are:

  - `reset`
  - `bold`
  - `dim`
  - `italic`
  - `underline`
  - `inverse`
  - `hidden`
  - `strikethrough`

  Example: `ExChalk.italic("Hello!")`
  """

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
