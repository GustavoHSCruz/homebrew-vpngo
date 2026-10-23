class Vpngo < Formula
  desc "Route selected applications through WireGuard VPN profiles"
  homepage "https://github.com/GustavoHSCruz/VPNGo"
  url "https://github.com/GustavoHSCruz/VPNGo/releases/download/v0.8.1/vpngo-0.8.1-macos.tar.gz"
  sha256 "9c7a05689f34644a75c2c408be1dd75919d3adb2024389dca8a5937f9fcca115"
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

      Step-by-step guide: https://github.com/GustavoHSCruz/VPNGo/blob/v0.8.1/docs/HOWTO.md#4-macos
    EOS
  end

  test do
    assert_equal "vpngo #{version}", shell_output("#{bin}/vpngo version").strip
  end
end
