#!/bin/bash
# We setup local pathing so it doesn't use the system go, as
# that will break stuff, everything needs to install locally
export PATH=`pwd`/go/bin:$PATH
export GOPATH=`pwd`/go
export GOROOT=`pwd`/go
hg clone -u release https://code.google.com/p/go
cd `pwd`/go/src
./all.bash
git clone git://github.com/davecheney/golang-crosscompile.git
source golang-crosscompile/crosscompile.bash
go-crosscompile-build darwin/386
go-crosscompile-build darwin/amd64
go-crosscompile-build freebsd/386
go-crosscompile-build freebsd/amd64
go-crosscompile-build linux/386
go-crosscompile-build linux/amd64
go-crosscompile-build linux/arm
go-crosscompile-build windows/386
go-crosscompile-build windows/amd64
