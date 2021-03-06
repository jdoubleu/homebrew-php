require File.expand_path("../../language/php", __FILE__)
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)

class PhpCsFixer < Formula
  include Language::PHP::Composer

  desc "A tool to automatically fix PHP coding standards issues"
  homepage "http://cs.sensiolabs.org"
  url "https://github.com/FriendsOfPHP/PHP-CS-Fixer/archive/v2.8.3.tar.gz"
  sha256 "28059e131d87d7b3facb2fa6dc6330ee77af39faf246d1b811ddd3a547b80994"
  head "https://github.com/FriendsOfPHP/PHP-CS-Fixer.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "6b9793c9e9fefc2d605c35df67962b731e35aec347633d2fb369b807c614ef19" => :high_sierra
    sha256 "34e8cbe738a4fd4f25e047e94f25faedf60394da0ada33ca63cac0624b403904" => :sierra
    sha256 "4404457eeee496446e36c6bc137dade895507cce0deb776903d6588b1932abfc" => :el_capitan
  end

  depends_on PhpMetaRequirement

  def install
    composer_install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"php-cs-fixer"
  end

  test do
    system "#{bin}/php-cs-fixer", "--version"
  end
end
