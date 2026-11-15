# starpls/tests/smoke.star — asserts the contract, never help/version prose.
#
# `starpls check` needs a Bazel workspace (it shells out to `bazel info`), so
# it is not hermetic. The hermetic functional check is instead a minimal LSP
# handshake over stdin: `initialize` must answer with a JSON-RPC result that
# advertises hover/definition providers, and `shutdown` must answer `result:null`.
# The server writes `Content-Length`-framed JSON-RPC to stdout.
#
# stdin is an explicit pipe the server prefers (it has no file argument), so
# feeding it through `stdin=` is the right channel.

STARPLS = "starpls.exe" if ocx.target_platform.os == ocx.os.Windows else "starpls"

# ── Tier 1 + 2: liveness + version SHAPE (`version` subcommand, >= v0.1.15) ──
r_version = ocx.run(STARPLS, "version", stdin = "")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# ── Tier 3: LSP initialize / shutdown round trip ─────────────────────────────
def frame(body):
    return "Content-Length: %d\r\n\r\n%s" % (len(body), body)

INIT = '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":null,"capabilities":{}}}'
INITIALIZED = '{"jsonrpc":"2.0","method":"initialized","params":{}}'
SHUTDOWN = '{"jsonrpc":"2.0","id":2,"method":"shutdown"}'
EXIT = '{"jsonrpc":"2.0","method":"exit"}'

r_lsp = ocx.run(
    STARPLS,
    "server",
    stdin = frame(INIT) + frame(INITIALIZED) + frame(SHUTDOWN) + frame(EXIT),
    env = {"HOME": ocx.scratch_root, "USERPROFILE": ocx.scratch_root},
)
expect.ok(r_lsp)
expect.contains(r_lsp.stdout, '"id":1,"result":{"capabilities"')
expect.contains(r_lsp.stdout, '"hoverProvider":true')
expect.contains(r_lsp.stdout, '"definitionProvider":true')
expect.contains(r_lsp.stdout, '"id":2,"result":null')
