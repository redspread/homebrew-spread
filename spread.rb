class Spread < Formula
  desc "Deploy Docker to Kubernetes in one command"
  homepage "https://redspread.com"
  url "https://github.com/redspread/spread/archive/0.0.3.tar.gz"
  version "0.0.3"
  sha256 "6f453c52038636043735387b7ea31b2036468568d663cfb73893fbba09b66d34"

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