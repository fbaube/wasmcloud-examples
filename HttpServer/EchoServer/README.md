<h1 align="center">HTTP Echo (TinyGo)</h1>
<hr>

This repository contains a [WASI)][wasi] and
[Component Model][component-model] enabled WebAssembly component
example of a [TinyGo][tinygo] built to run on [wasmCloud][wasmcloud].

**Warning**: Old stuff.

# Quickstart

## Install dependencies

Before starting, ensure that you have the following installed:

- The [TinyGo toolchain][tinygo-toolchain]
- [`wash`, the WAsmcloud SHell][wash] installed.

## Build the WASI component

Once you have these two things, build the project locally:

```console
wash build
```

You'll have a couple new folders, most importantly the `build` folder:

```
build
├── http-echo-component_s.wasm
└── http-echo-component.wasm
```

`build/http-echo-component_s.wasm` is the WebAssembly module, signed with
its required capabilities, and ready to run on a wasmCloud lattice.

## Start wasmCloud

Start wasmCloud, in a separate terminal:

```console
wash up --nats-websocket-port 4223
```

Optionally, you can also start the UI by running (in a separate terminal):

```console
wash ui
```

[host-v1.4.0]: https://github.com/wasmCloud/wasmCloud/releases/tag/v1.4.0

## Deploy this application

We can deploy the local project using [`wadm`][wadm].

First, edit `wadm.yaml` to include the absolute
path to the signed WebAssembly module:

```diff
# ....
  components:
    - name: http-echo
      type: component
      properties:
-        # TODO: replace the path below to match your generated code in build
-       image: file:///absolute/path/to/this/repo/build/http-echo-tinygo_s.wasm
+       image: file:///the/absolute/path/to/build/http-echo-tinygo-component_s.wasm
      traits:
# ...
```

Then, deploy using `wash`:

```console
wash app deploy --replace wadm.yaml
```

`wash app` can do much more. For example:

```console
wash app delete http-echo-tinygo-component v0.0.1
```

# Development

## Running tests

To run tests for this example:

```console
cd tests
go test -tags e2e
```

**Information**: The tests use `go`, _not_ `tinygo`, and require `wash`.

[wasmcloud]: https://github.com/wasmCloud/wasmCloud
[wash]: https://github.com/wasmCloud/wasmCloud/tree/main/crates/wash-cli
[go]: https://go.dev
[tinygo]: https://tinygo.org
[tinygo-toolchain]: https://tinygo.org/getting-started/install/
[wasi]: https://github.com/bytecodealliance/wasmtime/blob/main/docs/WASI-intro.md
[component-model]: https://github.com/WebAssembly/component-model/blob/main/design/mvp/Explainer.md
[wadm]: https://github.com/wasmCloud/wadm
