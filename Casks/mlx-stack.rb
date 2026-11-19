cask "mlx-stack" do
  version "0.1.2"
  sha256 "0cd718238b707f633ee0a410650d66ecafd5e4c083039c72d2239c7b85d358fa"

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
