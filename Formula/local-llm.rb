class LocalLlm < Formula
  desc "One command to run a local LLM on your Mac: picker, MLX or llama.cpp server, OpenAI and Anthropic APIs"
  homepage "https://github.com/mukhanov/local-llm"
  url "https://github.com/mukhanov/local-llm/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "e9453e39a01c8b00385b72cb3c95baa6d069122c81bbac2a00591c2f43354233"
  license "MIT"

  # MLX runs on Apple Silicon only; the app itself is macOS-only (curses stack)
  depends_on :macos
  depends_on arch: :arm
  # the launcher bootstraps ~/.ollmlx/venv on first run using uv
  depends_on "uv"

  def install
    # unpack the tarball ourselves: brew strips README/LICENSE from the
    # staging dir, and the editable install in libexec builds with
    # pyproject.toml's readme pointing at the real file
    mkdir_p libexec
    system "tar", "--strip-components=1", "-xf", cached_download, "-C", libexec
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
