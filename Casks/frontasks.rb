cask "frontasks" do
  version "0.1.2"
  sha256 "54e9d48357f11271ff4e7c0470ab9068090a8c1fa372d6e663704620ab64fee8"

  url "https://github.com/ananiasfilho/frontasks-app/releases/download/v#{version}/Frontasks-#{version}.dmg"
  name "Frontasks"
  desc "Floating, always-on-top task list for macOS"
  homepage "https://github.com/ananiasfilho/frontasks-app"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Frontasks.app"

  caveats <<~EOS
    O Frontasks nao e notarizado pela Apple, entao na primeira vez o macOS pode
    bloquear a abertura. Para liberar, rode:

      xattr -dr com.apple.quarantine "/Applications/Frontasks.app"

    ou va em Ajustes do Sistema -> Privacidade e Seguranca -> "Abrir Assim Mesmo".
  EOS

  zap trash: [
    "~/Library/Application Support/Frontasks",
    "~/Library/Preferences/com.ananiasfilho.frontasks.plist",
  ]
end
