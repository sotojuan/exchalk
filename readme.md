# exchalk

[![Build Status](https://travis-ci.org/sotojuan/exchalk.svg?branch=master)](https://travis-ci.org/sotojuan/exchalk)

> Easier terminal styling

This library is a very light abstraction over `IO.ANSI` that makes it easy to style text. It's heavily inspired by Node's [chalk](https://github.com/chalk/chalk).

## Install

In your `mix.exs`:

```elixir
defp deps do
  [
    { :exchalk, "~> 0.0.0" }
  ]
end
```

Then run `mix deps.get`.

## Usage

```elixir
IO.puts ExChalk.red("Hello world!")

# or

"Hello world!"
  |> ExChalk.red
  |> ExChalk.italic
  |> ExChalk.bg_blue
  |> IO.puts
```

## Why do I need to call `ExChalk.to_str` for string concatenation?

ExChalk by default returns IO lists instead of strings. IO lists can be printed, but since they aren't strings the `<>` doesn't work (though interpolation does!).

If you're planning on doing a lot of concatenation this may sound annoying, but there's a good reason. IO lists are a lot more performant than strings as they require less allocation and copying.

See José's explanation in [this thread](https://elixirforum.com/t/implications-of-string-concatenation-vs-iolist-for-ansi-color-codes/1804) for more information.

## Styles

### Modifiers

- `reset`
- `bold`
- `dim`
- `italic` *(not widely supported)*
- `underline`
- `inverse`
- `hidden`
- `strikethrough` *(not widely supported)*

### Colors

- `black`
- `red`
- `green`
- `yellow`
- `blue`
- `magenta`
- `cyan`
- `white`
- `gray`

### Background colors

- `bg_black`
- `bg_red`
- `bg_green`
- `bg_yellow`
- `bg_blue`
- `bg_magenta`
- `bg_cyan`
- `bg_white`

## 256-colors

ExChalk does not support anything other than the base eight colors, which guarantees it will work on all terminals and systems. For this the lower level [`IO.ANSI`](https://github.com/jbnicolai/ansi-256-colors) or the awesome [Bunt](https://github.com/rrrene/bunt) can be used.

## Windows

If you're on Windows, do yourself a favor and use [`cmder`](http://cmder.net/) instead of `cmd.exe`.

## License

MIT © [Juan Soto](http://juansoto.me)
