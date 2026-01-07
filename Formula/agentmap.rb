class Agentmap < Formula
  desc "Prepare codebases for AI agents with structured documentation"
  homepage "https://github.com/nguyenphutrong/agentmap"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-aarch64.tar.gz"
      sha256 "78fb65eba5c6297a505a1031679cdbc93984ca19e56cf49f68108a984aeba3cd"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/agentmap/releases/download/v#{version}/agentmap-darwin-x86_64.tar.gz"
      sha256 "0dc5f65ba52579328cbb26d2364190bac5c4a0962af30bfe6358df6179ca53c1"
    end
  end

  def install
    bin.install "agentmap"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentmap --version")
  end
end
