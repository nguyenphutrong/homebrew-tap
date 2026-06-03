class CpaPlusplus < Formula
  desc "OpenAI/Gemini/Claude/Codex compatible API proxy"
  homepage "https://github.com/nguyenphutrong/cpa-plusplus"
  version "7.1.38-plus.3"
  license "MIT"

  depends_on "git" => :optional

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_aarch64.tar.gz"
      sha256 "70b536e6744c853f6de484ae527d239455ddb7926b876b5dbd81c119356ccc5b"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_amd64.tar.gz"
      sha256 "94001caa2875333f5b2283cefc675acec16421d3d0005d3e614d9a06d71ab11f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_aarch64.tar.gz"
      sha256 "7089b5d9599f01e462f51deaf218f36a98a45771d5c6d72cebed20ad23edc0ca"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_amd64.tar.gz"
      sha256 "1845f82ae3eb650aa8a2ac4227541748d0ac700c47430b8ba97ea9de5f8eb436"
    end
  end

  def install
    bin.install "cpa-plusplus"
    pkgshare.install "config.example.yaml"
    doc.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cpa-plusplus --help")
  end
end
