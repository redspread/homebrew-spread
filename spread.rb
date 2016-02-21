class Spread < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "https://redspread.com"
  url "https://github.com/redspread/spread/archive/0.0.4.tar.gz"
  version "0.0.4"
  sha256 "7231bac42d7052870c25fb0c016710f0145c7a831888a4a486c97c59f77f2e8a"

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
