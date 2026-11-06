class LocalLlm < Formula
  desc "One command to run a local LLM on your Mac: picker, MLX or llama.cpp server, OpenAI and Anthropic APIs"
  homepage "https://github.com/mukhanov/local-llm"
  url "https://github.com/mukhanov/local-llm/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "6565c7b6b5ef606d403142bb956bc460648f52cf86101ffacc934c7f434472c2"
  license "MIT"

  # MLX runs on Apple Silicon only; the app itself is macOS-only (curses stack)
  depends_on :macos
  depends_on arch: :arm
  # the launcher bootstraps ~/.ollmlx/venv on first run using uv
  depends_on "uv"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"local-llm"
  end

  def caveats
    <<~EOS
      First run creates ~/.ollmlx/venv and installs dependencies (~2GB) via uv.
      Models and logs also live outside the prefix: ~/.ollmlx, ~/.cache/huggingface.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/local-llm --help")
  end
end
