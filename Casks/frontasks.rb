cask "frontasks" do
  version "0.1.0"
  sha256 "2d8cc348677dae58f2e78a6af0142b6e2b92148bd7d6662d994a708cf21249a8"

  url "https://github.com/ananiasfilho/frontasks-app/releases/download/v#{version}/FronTasks-#{version}.dmg"
  name "FronTasks"
  desc "Floating, always-on-top task list for macOS"
  homepage "https://github.com/ananiasfilho/frontasks-app"

  depends_on macos: :sequoia

  app "FronTasks.app"

  caveats <<~EOS
    O FronTasks nao e notarizado pela Apple, entao na primeira vez o macOS pode
    bloquear a abertura. Para liberar, rode:

      xattr -dr com.apple.quarantine "/Applications/FronTasks.app"

    ou va em Ajustes do Sistema -> Privacidade e Seguranca -> "Abrir Assim Mesmo".
  EOS

  zap trash: [
    "~/Library/Application Support/Frontasks",
    "~/Library/Preferences/com.ananiasfilho.frontasks.plist",
  ]
end
