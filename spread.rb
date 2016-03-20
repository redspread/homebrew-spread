class Spread < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "https://redspread.com"
  url "https://github.com/redspread/spread/archive/0.1.2.tar.gz"
  version "0.1.2"
  sha256 "3a315135e9508c6ff863b3bd0e17572aabd3168aee2fc3bcc87cd6fb66555ac5"

  depends_on "go" => :build

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