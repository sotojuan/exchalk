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

  def gray(str), do: ["\e[90m", str, ANSI.reset]
  def grey(str), do: gray(str)
end
