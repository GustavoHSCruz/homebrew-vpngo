class Vpngo < Formula
  desc "Route selected applications through WireGuard VPN profiles"
  homepage "https://github.com/GustavoHSCruz/VPNGo"
  url "https://github.com/GustavoHSCruz/VPNGo/releases/download/v0.7.1/vpngo-0.7.1-macos.tar.gz"
  sha256 "628a897fd92420796ac91717eb9f7e0ec4978e0ed81b454fdcd3610f1fd0af1f"
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

      Step-by-step guide: https://github.com/GustavoHSCruz/VPNGo/blob/v0.7.1/docs/HOWTO.md#4-macos
    EOS
  end

  test do
    assert_equal "vpngo #{version}", shell_output("#{bin}/vpngo version").strip
  end
end
