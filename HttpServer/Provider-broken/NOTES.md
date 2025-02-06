https://github.com/wasmCloud/go/tree/main/examples/provider/http-server

This capability provider example
- imports the wasi:http/incoming-handler interface
- demonstrates how to forward HTTP requests to
  components that export the same interface, so
  components can  accept incoming HTTP(s) requests.

The provider starts an HTTP server listening on port 8080 with two routes:
- /proxy: Fwds the request to the component http-component
- /:    Serves the request directly from the provider

In addition to the standard elements of a Go project,
the example directory includes the following files and directories:
- /bindings: An auto-generated directory for Go bindings of interfaces.
  Users tipicly do not interact with the contents of this directory.
- /wit: Directory for WIT packages that define interfaces.
- wadm.yaml: Declarative application manifest.
- wasmcloud.toml: Configuration file for a wasmCloud app. 

Note that the "wash build" process links to  ../../../provider/

