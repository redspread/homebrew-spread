class SpreadVersioning < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "http://redspread.com"
  url "https://github.com/redspread/spread/archive/version-preview1.tar.gz"
  version "0.1.6-versioning1"
  sha256 "bf52817e9c16845175e8b53f6b19b6561710f3150bec09acfa5b88a25bed7927"

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
