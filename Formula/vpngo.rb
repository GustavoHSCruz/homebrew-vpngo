class Vpngo < Formula
  desc "Route selected applications through WireGuard VPN profiles"
  homepage "https://github.com/GustavoHSCruz/VPNGo"
  url "https://github.com/GustavoHSCruz/VPNGo/releases/download/v0.5.0/vpngo-0.5.0-macos.tar.gz"
  sha256 "543347ca9f3531ef243d2ef5056fa1b0a79cad07d7eaab9b5b8da22e14ba34c0"
  license "Apache-2.0"

  depends_on "mihomo"
  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"macos/vpngo"
  end

  def caveats
    <<~EOS
      vpngo uses the python3 that comes with Apple's command line tools.
      If `python3 --version` asks to install them, accept.

      Step-by-step guide: https://github.com/GustavoHSCruz/VPNGo/blob/v0.5.0/docs/HOWTO.md#4-macos
    EOS
  end

  test do
    assert_equal "vpngo #{version}", shell_output("#{bin}/vpngo version").strip
  end
end
