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

  @color_reset "\e[39m"
  @bg_reset "\e[49m"

  alias IO.ANSI

  @colors [
    "black": ANSI.color(0),
    "red": ANSI.color(1),
    "green": ANSI.color(2),
    "yellow": ANSI.color(3),
    "blue": ANSI.color(4),
    "magenta": ANSI.color(5),
    "cyan": ANSI.color(6),
    "white": ANSI.color(7),
    "gray": "\e[90m",
    "grey": "\e[90m"
  ]

  @bg_colors [
    "black": ANSI.color_background(0),
    "red": ANSI.color_background(1),
    "green": ANSI.color_background(2),
    "yellow": ANSI.color_background(3),
    "blue": ANSI.color_background(4),
    "magenta": ANSI.color_background(5),
    "cyan": ANSI.color_background(6),
    "white": ANSI.color_background(7)
  ]

  @modifiers [
    reset: {ANSI.reset, ANSI.reset},
    bold: {ANSI.bright, "\e[22m"},
    dim: {ANSI.faint, "\e[22m"},
    italic: {ANSI.italic, "\e[23m"},
    underline: {ANSI.underline, "\e[24m"},
    inverse: {"\e[7m", "\e[27m"},
    hidden: {"\e[8m", "\e[28m"},
    strikethrough: {"\e[9m", "\e[29m"}
  ]

  for {name, code} <- @colors do
    def unquote(:"#{name}")(str) when is_list(str) do
      [prev_start, prev, prev_end] = str

      [prev_start, [unquote(code), prev, @color_reset], prev_end]
    end

    def unquote(:"#{name}")(str) do
      [unquote(code), str, @color_reset]
    end
  end

  for {name, code} <- @bg_colors do
    def unquote(:"bg_#{name}")(str) when is_list(str) do
      [prev_start, prev, prev_end] = str

      [prev_start, [unquote(code), prev, @bg_reset], prev_end]
    end

    def unquote(:"bg_#{name}")(str) do
      [unquote(code), str, @bg_reset]
    end
  end

  for {name, {start, reset}} <- @modifiers do
    def unquote(:"#{name}")(str) when is_list(str) do
      [prev_start, prev, prev_end] = str

      [prev_start, [unquote(start), prev, unquote(reset)], prev_end]
    end

    def unquote(:"#{name}")(str) do
      [unquote(start), str, unquote(reset)]
    end
  end

  @doc """
  Converts the given IO list to a string
  """
  @spec to_str(iodata) :: binary
  def to_str(list), do: IO.iodata_to_binary(list)
end
