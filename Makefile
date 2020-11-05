BUILDFOLDER := build

BINFILE := $(BUILDFOLDER)/gomake

BINLINUXFILE := $(BUILDFOLDER)/gomake_linux

BINWINDOWSFILE := $(BUILDFOLDER)/gomake.exe

cleanFlag := -ldflags "-s -w"

clean:
	@echo "清理编译文件"
	rm -rf $(BUILDFOLDER)

build-macos:
	@echo "==> 编译 `macos` 环境"
	go build -o $(BINFILE) $(cleanFlag) .
	upx -9 $(BINFILE)

build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o $(BINLINUXFILE) $(cleanFlag) .
	upx -9 $(BINLINUXFILE)

build-windows:
	CGO_ENABLED=0 GOOS=windows go build -o $(BINWINDOWSFILE) $(cleanFlag) .
	upx -9 $(BINWINDOWSFILE)