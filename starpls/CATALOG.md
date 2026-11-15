---
title: starpls
description: Language server for Starlark, the configuration language of Bazel and Buck2 — hover, go-to-definition, completion and type-aware diagnostics for .star, .bzl, BUILD and MODULE files
keywords: starlark,lsp,language-server,bazel,buck2,bzl,build,typechecker,editor,rust
---

# starpls

[starpls](https://github.com/withered-magic/starpls) is a language server for
Starlark, the Python-like configuration language used by Bazel and Buck2. It
brings editor intelligence to `BUILD`, `.bzl`, `.star`, `WORKSPACE` and
`MODULE.bazel` files: hover documentation, go-to-definition, completion,
signature help and type-aware diagnostics, with Bazel's built-in rule and
function definitions loaded from the Bazel installation in the workspace.

It is a single self-contained binary (Rust) with no runtime dependencies beyond
the platform C library. Editors start it as `starpls server`; any LSP client can
drive it, and a VS Code extension is available from upstream.

## What's included

- **starpls** — the binary. `starpls server` starts the language server over
  stdio, `starpls check <paths>` type-checks Starlark files from the command
  line, and `starpls version` prints the version.

## Using it

Point your editor's LSP client at the executable:

```json
{ "command": "starpls", "args": ["server"] }
```

Type-checking and go-to-definition across `load()` statements need Bazel on
`PATH` inside a Bazel workspace — starpls asks Bazel for the workspace root,
output base and builtin definitions. Without Bazel the server still starts and
answers, with reduced features.

## Links

- [starpls on GitHub](https://github.com/withered-magic/starpls)
- [Releases](https://github.com/withered-magic/starpls/releases)
- [Starlark language specification](https://github.com/bazelbuild/starlark/blob/master/spec.md)
