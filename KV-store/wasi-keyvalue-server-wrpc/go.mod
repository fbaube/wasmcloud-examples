module wrpc.io/examples/go/wasi-keyvalue-server

go 1.22.2
toolchain go1.24.1

replace wrpc.io/go v0.1.0 => ../../../go

require (
	github.com/nats-io/nats.go v1.38.0
	wrpc.io/go v0.1.0
)

require (
	github.com/klauspost/compress v1.17.9 // indirect
	github.com/nats-io/nkeys v0.4.9 // indirect
	github.com/nats-io/nuid v1.0.1 // indirect
	golang.org/x/crypto v0.35.0 // indirect
	golang.org/x/sys v0.30.0 // indirect
)
