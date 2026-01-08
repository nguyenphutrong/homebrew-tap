class Agentlens < Formula
  desc "Prepare codebases for AI agents with structured documentation"
  homepage "https://github.com/nguyenphutrong/agentlens"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/agentlens/releases/download/v#{version}/agentlens-darwin-aarch64.tar.gz"
      sha256 "73b8341de259c2d6b8eb017aea4a586c5a81b675433503d5d5d1233b03b8d4b5"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/agentlens/releases/download/v#{version}/agentlens-darwin-x86_64.tar.gz"
      sha256 "c38b4a9c2650b5ee60738203b301495894aeedaa3933a883bd124365318ce499"
    end
  end

  def install
    bin.install "agentlens"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentlens --version")
  end
end
