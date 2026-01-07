class Agentlens < Formula
  desc "Prepare codebases for AI agents with structured documentation"
  homepage "https://github.com/nguyenphutrong/agentlens"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/agentlens/releases/download/v#{version}/agentlens-darwin-aarch64.tar.gz"
      sha256 "4591cff2d23949be27e594b4ff54d4e94edb84175d9ec1fa0e5c8ec74f91988e"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/agentlens/releases/download/v#{version}/agentlens-darwin-x86_64.tar.gz"
      sha256 "93f979d1614f58d66247bb8c0edc43e7971fe898b099e078cee22913c89da483"
    end
  end

  def install
    bin.install "agentlens"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlens --version")
  end
end
