cask "frontasks" do
  version "0.1.0"
  sha256 "8fe130bb964fbfe9fe3b404d336379efe6d8481283541661e0851e3c6bac20fd"

  url "https://github.com/ananiasfilho/frontasks-app/releases/download/v#{version}/Frontasks-#{version}.dmg",
      verified: "github.com/ananiasfilho/frontasks-app/"
  name "Frontasks"
  desc "Floating, always-on-top task list for macOS"
  homepage "https://github.com/ananiasfilho/frontasks-app"

  depends_on macos: ">= :sequoia"
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
    "~/Library/Preferences/com.kmee.frontasks.plist",
  ]
end
