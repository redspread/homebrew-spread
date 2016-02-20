class Spread < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "https://redspread.com"
  url "https://github.com/redspread/spread/archive/0.0.3.tar.gz"
  version "0.0.3"
  sha256 "e40df333863974241cd37cc5040a80faa5935f2d42434b8cd728bb889e5c2962"

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