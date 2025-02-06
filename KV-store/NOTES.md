https://github.com/wasmCloud/go/tree/main/examples/provider/keyvalue-inmemory

In addition to the standard elements of a Go project,
the example directory includes the following files and directories:
- /bindings: An auto-generated directory for Go bindings of interfaces.
  Users tipicly do not interact with the contents of this directory.
- /wit: Directory for WIT packages that define interfaces.
- wasmcloud.toml: Configuration file for a wasmCloud app.
- The example includes a shell script that simulates what the host does to
  run the provider, enabling you to test the provider without running a host.

./run.sh

You can also perform each step manually:

host_data='{"lattice_rpc_url": "0.0.0.0:4222", \
"lattice_rpc_prefix": "default", "provider_key": \
"keyvalue-inmemory", "link_name": "default","log_level": "debug"}' 
echo $host_data | base64 | go run ./

