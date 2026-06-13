class CpaPlusplus < Formula
  desc "OpenAI/Gemini/Claude/Codex compatible API proxy"
  homepage "https://github.com/nguyenphutrong/cpa-plusplus"
  version "7.1.64-plus.1"
  license "MIT"

  depends_on "git" => :optional

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_aarch64.tar.gz"
      sha256 "34b57335d14d92afb1f17906279132d99a99d6158294b98a71aff562feec36c0"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_amd64.tar.gz"
      sha256 "ce7063ba587910e732644dc074e25447489c9bd41b206a6a19f468006f759f77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_aarch64.tar.gz"
      sha256 "b2b48bef2e1bb0aebd3198dbbace1f772589063ffb837c81ef7d3324f0b50766"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_amd64.tar.gz"
      sha256 "9100acbe28f1aece93ec9073a2f35ae8fd3d5c91cec56c10f1a970c49b6d4bf6"
    end
  end

  def install
    bin.install "cpa-plusplus"
    pkgshare.install "config.example.yaml" if (buildpath/"config.example.yaml").exist?

    unless (etc/"cpa-plusplus/config.yaml").exist?
      if (pkgshare/"config.example.yaml").exist?
        (etc/"cpa-plusplus").install pkgshare/"config.example.yaml" => "config.yaml"
      else
        (etc/"cpa-plusplus/config.yaml").write <<~YAML
host: "127.0.0.1"
port: 8317
auth-dir: "~/.cli-proxy-api"
        YAML
      end
    end

    doc.install "README.md", "LICENSE"
  end

  service do
    run [opt_bin/"cpa-plusplus", "--config", etc/"cpa-plusplus/config.yaml"]
    keep_alive true
    working_dir var/"cpa-plusplus"
    log_path var/"log/cpa-plusplus/cpa-plusplus.log"
    error_log_path var/"log/cpa-plusplus/cpa-plusplus.err.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cpa-plusplus --help")
  end
end
