# exchalk

[![Build Status](https://travis-ci.org/sotojuan/exchalk.svg?branch=master)](https://travis-ci.org/sotojuan/exchalk)

> Easier terminal styling

This library is a very light abstraction over `IO.ANSI` that makes it easy to style text.

## 256-colors

ExChalk does not support anything other than the base eight colors, which guarantees it will work on all terminals and systems. For this the lower level [`IO.ANSI`](https://github.com/jbnicolai/ansi-256-colors) or the awesome [Bunt](https://github.com/rrrene/bunt) can be used.

## Windows

If you're on Windows, do yourself a favor and use [`cmder`](http://cmder.net/) instead of `cmd.exe`.

## License

MIT © [Juan Soto](http://juansoto.me)
