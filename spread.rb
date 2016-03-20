class Spread < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "https://redspread.com"
  url "https://github.com/redspread/spread/archive/0.1.3.tar.gz"
  version "0.1.3"
  sha256 "ba1e3f387a818c2e695a00826f00fffb822006adeb3550d2f7db1508aa064b47"

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