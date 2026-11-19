cask "mlx-stack" do
  version "0.1.0"
  sha256 "436281ff50507d74693dda6bab813785707b5a1eacbf5a94977dd5c391042f26"

  url "https://raw.githubusercontent.com/mukhanov/mlx-stack/v#{version}/releases/MLXStack-v#{version}.zip"
  name "MLX Stack"
  desc "Native tray and desktop monitor for local MLX models"
  homepage "https://github.com/mukhanov/mlx-stack"

  depends_on arch: :arm
  depends_on macos: ">= :sonoma"
  depends_on formula: "mukhanov/local-llm/local-llm"

  app "MLX Stack.app"

  caveats <<~EOS
    Run local-llm once before loading models:
      local-llm
  EOS
end
