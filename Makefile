CC=/opt/wasi-sdk/bin/clang
CFLAGS=-fvisibility=hidden
LDFLAGS=-Wl,--export-all -shared

.PHONY: build
build:
	cd src && \
		LDFLAGS="$(LDFLAGS)" CFLAGS="$(CFLAGS)" CC=${CC} cmake . -DCMAKE_INSTALL_PREFIX=$(PWD)/install -DCPUINFO_LIBRARY_TYPE=shared -DCPUINFO_BUILD_TOOLS=OFF -DCMAKE_SYSTEM_NAME=WASI -DCMAKE_SYSTEM_PROCESSOR=x64 \
		-DCPUINFO_BUILD_UNIT_TESTS=OFF -DCPUINFO_BUILD_MOCK_TESTS=OFF -DCPUINFO_BUILD_BENCHMARKS=OFF -DCPUINFO_BUILD_PKG_CONFIG=OFF && \
		cmake --build . --target install

.PHONY: clean
clean:
	cd src && \
		cmake --build . --target clean
	rm -rf ./install
