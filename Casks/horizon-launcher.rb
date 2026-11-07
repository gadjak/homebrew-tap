cask "horizon-launcher" do
  arch arm: "arm64", intel: "x64"

  version "0.2.49"
  sha256 arm:   "2d93ea2ed0a095c88bfa5272968f102d899db3448c596e0be7356ae33ac64eb8",
         intel: "b5c750c42db673f7475b8e0f341923a4889326e6e040025bd29efea586d56766"

  url "https://github.com/horizon-rust/horizon/releases/download/launcher%40#{version}/horizon-launcher-macos-#{arch}.zip"
  name "Horizon"
  desc "Launcher for Minecraft: Java Edition rewritten in Rust"
  homepage "https://playhorizon.dev/"

  livecheck do
    url :url
    regex(/^launcher@v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :monterey

  app "Horizon.app"

  zap trash: [
    "~/Library/Application Support/horizon",
    "~/Library/Application Support/horizon-launcher",
  ]
end
