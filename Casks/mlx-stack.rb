cask "mlx-stack" do
  version "0.1.4"
  sha256 "6bd10602e274d057439eca6a32b84beacc857eb12165390e01c7464fc3f007a9"

  url "https://raw.githubusercontent.com/mukhanov/mlx-stack/v#{version}/releases/MLXStack-v#{version}.zip"
  name "MLX Stack"
  desc "Native tray and desktop monitor for local MLX models"
  homepage "https://github.com/mukhanov/mlx-stack"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MLX Stack.app"
end
