cask "frontasks" do
  version "0.1.6"
  sha256 "eedaaf2c92cabd66638719d2f0063bb0766b17a74f9b37ede8eb621e0b20fef8"

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
