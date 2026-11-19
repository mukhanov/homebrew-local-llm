cask "mlx-stack" do
  version "0.1.1"
  sha256 "e2843e8cc3c99b97dbad6b9d338072388c9ba4397759f4a9dc51ea3c1fa3d933"

  url "https://raw.githubusercontent.com/mukhanov/mlx-stack/v#{version}/releases/MLXStack-v#{version}.zip"
  name "MLX Stack"
  desc "Native tray and desktop monitor for local MLX models"
  homepage "https://github.com/mukhanov/mlx-stack"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on formula: "mukhanov/local-llm/local-llm"

  app "MLX Stack.app"

  caveats <<~EOS
    Run local-llm once before loading models:
      local-llm
  EOS
end
