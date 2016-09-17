class Spread < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "http://redspread.com"
  url "https://github.com/redspread/spread/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "cb3b56e2d274ba78bdfedf19d6f74876b6ea786fce7e01cb908e320b982869ec"

  depends_on "pkg-config" => :run
  depends_on "go" => :build

  def install
      ENV["GOPATH"] = buildpath
      system "mkdir", "-p", "src/rsprd.com/spread"
      system "cp", "-r", "pkg", "src/rsprd.com/spread/"
      system "cp", "-r", "cmd", "src/rsprd.com/spread/"
      system "cp", "-r", "cli", "src/rsprd.com/spread/"
      system "cp", "-r", "vendor/", "src"
      system "go", "build", "-ldflags", "-X main.Version=v1.0.0", "rsprd.com/spread/cmd/spread"
      bin.install "spread"
  end

end
