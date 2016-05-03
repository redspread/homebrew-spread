class Spread < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "http://redspread.com"
  url "https://github.com/redspread/spread/archive/0.1.6.tar.gz"
  version "0.1.6"
  sha256 "65e0e3531deb3b5c39c68d55605d1b2903b2eb88337e1888aa0f4135392441ec"

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