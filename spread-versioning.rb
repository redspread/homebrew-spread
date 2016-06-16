class SpreadVersioning < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "http://redspread.com"
  url "https://github.com/redspread/spread/archive/version-test.tar.gz"
  version "0.1.6-versioning"
  sha256 "e187e486926f97d4c71fcfb49a1dce3589d689b02103e550d3e6e7f8e9817d3a"

  depends_on "libgit2"
  depends_on "go" => :build 
  depends_on "pkg-config" => :build

  def install
      ENV["GOPATH"] = buildpath
      system "mkdir", "-p", "src/rsprd.com/spread"
      system "cp", "-r", "pkg", "src/rsprd.com/spread/"
      system "cp", "-r", "cmd", "src/rsprd.com/spread/"
      system "cp", "-r", "cli", "src/rsprd.com/spread/"
      system "cp", "-r", "vendor/", "src"
      system "go", "build", "rsprd.com/spread/cmd/spread"
      bin.install "spread"
  end
end
