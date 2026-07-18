cask "frontasks" do
  version "0.1.3"
  sha256 "158538a434c8557292f91f06f92f24dadf27db736c18bbfe5d0a6f4e014ccf70"

  url "https://github.com/ananiasfilho/frontasks-app/releases/download/v#{version}/Frontasks-#{version}.dmg"
  name "Frontasks"
  desc "Floating, always-on-top task list for macOS"
  homepage "https://github.com/ananiasfilho/frontasks-app"

  depends_on macos: :sequoia

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
