cask "mlx-stack" do
  version "0.1.3"
  sha256 "fecb480ad8e88aab4cca33bbb5a0b0a329ec7f014b41ac375681e6e7eb629a9f"

  url "https://raw.githubusercontent.com/mukhanov/mlx-stack/v#{version}/releases/MLXStack-v#{version}.zip"
  name "MLX Stack"
  desc "Native tray and desktop monitor for local MLX models"
  homepage "https://github.com/mukhanov/mlx-stack"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MLX Stack.app"
end
