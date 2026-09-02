class Portkill < Formula
  desc "Kill processes listening on TCP ports"
  homepage "https://github.com/burakboduroglu/portkill"
  url "https://github.com/burakboduroglu/portkill/releases/download/v0.4.6/portkill-0.4.6.tgz"
  sha256 "d16926d701737f196ec33fa7a4502675eb128d4492c288d2c05586a041161d33"
  license "MIT"

  depends_on "node"
  uses_from_macos "lsof"

  resource "chalk" do
    url "https://registry.npmjs.org/chalk/-/chalk-5.6.2.tgz"
    sha256 "94957715a483aa3b9db60c8f22d5498227d8025c407f982eef81e34f37574ffd"
  end

  resource "commander" do
    url "https://registry.npmjs.org/commander/-/commander-13.1.0.tgz"
    sha256 "d5703ba285336d6d6d86fecf7a9f064e248879497d98ccc98ca849a62e34822a"
  end

  def install
    libexec.install Dir["*"]

    resource("chalk").stage do
      (libexec/"node_modules/chalk").install Dir["*"]
    end

    resource("commander").stage do
      (libexec/"node_modules/commander").install Dir["*"]
    end

    bin.install_symlink libexec/"dist/index.js" => "portkill"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/portkill --version")
    assert_match "Usage: portkill", shell_output("#{bin}/portkill --help")
  end
end
