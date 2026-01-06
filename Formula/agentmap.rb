class Agentmap < Formula
  desc "Prepare codebases for AI agents with structured documentation"
  homepage "https://github.com/nguyenphutrong/agentmap"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-aarch64.tar.gz"
      sha256 "320a1419e5f6ad99781cd58f0af2ffae0acbeb2be8553f45553bb5e411cc0dea"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-x86_64.tar.gz"
      sha256 "b5239156faf4142459eb6f7c0d446ccf07530666a6cc09ecf3195130e6587ff0"
    end
  end

  def install
    bin.install "agentmap"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentmap --version")
  end
end
