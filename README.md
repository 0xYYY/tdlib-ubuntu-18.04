# tdlib-ubuntu-18.04

## Goal

Build Telegram [`TDLib`](https://github.com/tdlib/td) shared object file `tdlibjson.so` in Ubuntu
18.04 with GitHub workflow. The built object can then be used to create a
[`tdl`](https://github.com/Bannerets/tdl)'s `TDLib` instance.

## Build

The following commands are provided as [`just`](https://github.com/casey/just) recipes. (See
[`justfile`](./justfile) for details.)

-   Execute workflow: `just build`
-   View run status: `just status`
-   Download artifact: `just download`

## Motivation

### Why not use [`prebuilt-tdlib`](https://github.com/Bannerets/tdl/tree/master/packages/prebuilt-tdlib)?

The provided shared object for x86_64 Linux is built against Ubuntu 20.04. However, I was trying to
use `tdl` on [Google Cloud Fuctions](https://cloud.google.com/functions), which is using
[Ubuntu 18.04](https://cloud.google.com/functions/docs/concepts/execution-environment) for
`nodejs16` runtimes (as of Oct. 7th, 2022). Since they have different `glibc` versions, the object
built on the former won't be compatible on the latter.

### Whu not just spin up a Ubuntu 18.04 docker and build it locally?

I am on a Apple Silicon device, so the shared object built this way will still have `ARM aarch64`
architecture.

## Credit

The GitHub workflow is extracted and modified from `tdl`'s `prebuilt-tdlib` package
[`workflow`](https://github.com/Bannerets/tdl/blob/master/.github/workflows/prebuilt-tdlib.yml).
