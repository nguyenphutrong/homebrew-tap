class CpaPlusplus < Formula
  desc "OpenAI/Gemini/Claude/Codex compatible API proxy"
  homepage "https://github.com/nguyenphutrong/cpa-plusplus"
  version "7.1.62-plus.3"
  license "MIT"

  depends_on "git" => :optional

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_aarch64.tar.gz"
      sha256 "90c2036b506fa3fc6ba4016d61396bf3d2373cd700816affb99d0ab03593d49a"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_amd64.tar.gz"
      sha256 "bbbc76b7a8b3040032baea3178092e5837bd0f1fd9900a5696aa0b296ad1977a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_aarch64.tar.gz"
      sha256 "08cc32266757174b4f76bbe88707e05dc6d5ba7762c84a00fa38a8463ff7f101"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_amd64.tar.gz"
      sha256 "7f792daebcc2064f019a051113298be3c4dc6c6198599832c8f9b882691d1b3d"
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
