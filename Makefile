.PHONY: build

build:
	@rm -rf fb303 scribe
	@thrift --gen go:package_prefix=github.com/mapix/scribe-go/  if/fb303.thrift
	@thrift --gen go:package_prefix=github.com/mapix/scribe-go/  if/scribe.thrift
	@mv gen-go/* ./
	@rmdir gen-go
	@ack -al git.apache.org/thrift.git/lib/go/thrift | grep -v Makefile |xargs sed -i "s:git.apache.org/thrift.git/lib/go/thrift:github.com/apache/thrift/lib/go/thrift:"
