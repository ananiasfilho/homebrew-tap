cask "frontasks" do
  version "0.1.1"
  sha256 "2fefdcd1ed860aa85d3fa29f2e2cd6b92110228991f6054d230539fae4b07d61"

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
