class CpaPlusplus < Formula
  desc "OpenAI/Gemini/Claude/Codex compatible API proxy"
  homepage "https://github.com/nguyenphutrong/cpa-plusplus"
  version "7.1.45-plus.1"
  license "MIT"

  depends_on "git" => :optional

  on_macos do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_aarch64.tar.gz"
      sha256 "64fc9c3a7582fcfd2e14a05ca8bae43db9599f24b845b98cb7988bbf263cd3dc"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_darwin_amd64.tar.gz"
      sha256 "1abb2a2adb2aef0caed682227c0ba624c83dd662055e8956445f40650862b6ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_aarch64.tar.gz"
      sha256 "a7035fd18d239bb0b2ce8889bf0b3281bccb878aff24d6347235303091dcd552"
    end
    on_intel do
      url "https://github.com/nguyenphutrong/cpa-plusplus/releases/download/v#{version}/cpa-plusplus_#{version}_linux_amd64.tar.gz"
      sha256 "19d8ab935001fecdfd0dd6d2204554c7e7b20df6d08498de1ad62bc38532617b"
    end
  end

  def install
    bin.install "cpa-plusplus"
    (etc/"cpa-plusplus").install "config.example.yaml" => "config.yaml"
    pkgshare.install "config.example.yaml"
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
