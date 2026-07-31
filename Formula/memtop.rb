class Memtop < Formula
  desc "Per-app memory usage for macOS, with helper processes folded into their parent"
  homepage "https://github.com/cliveportman/memtop"
  url "https://github.com/cliveportman/memtop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5e04eaee9e03a2bf4257cb44c798b67c1902d4d1c96a41e9fde9d7aa741bc31f"
  license "MIT"
  head "https://github.com/cliveportman/memtop.git", branch: "main"

  # Strictly this is only needed by --usage and for resolving WezTerm pane
  # titles, so the tool is useful without it. Made a hard dependency anyway:
  # "installed it and one of the views silently does nothing" is a bad first
  # impression, and jq is small.
  depends_on "jq"

  # vm_stat, sysctl and top -stats mem are macOS-only. Failing here is a clear
  # message; failing at runtime is a confusing one.
  depends_on :macos

  def install
    bin.install "memtop"
  end

  test do
    assert_match "per-app memory usage for macOS", shell_output("#{bin}/memtop --help")
    # --status is the cheap path and touches vm_stat and sysctl, so it exercises
    # the real work without waiting on a full top scan. Four tab-separated
    # fields: percent, pressure, top app, swap.
    assert_match(/^\d+\t\w+/, shell_output("#{bin}/memtop --status"))
  end
end
