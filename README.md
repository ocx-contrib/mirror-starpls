# mirror-starpls

OCX mirror for [starpls](https://github.com/withered-magic/starpls), the
Starlark language server for Bazel and Buck2. One repository, one spec
directory per package.

| Package | Spec | Publishes to | Announced as | Upstream SPDX |
|---|---|---|---|---|
| [starpls](https://github.com/withered-magic/starpls) | [`starpls/mirror.yml`](starpls/mirror.yml) | `ghcr.io/ocx-contrib/starpls/starpls` | [`ocx.sh/starpls/starpls`](https://index.ocx.sh/starpls/starpls) | `Apache-2.0` |

Each upstream release is discovered, re-bundled, smoke-tested per
`(version, platform)` and only then pushed with cascade tags, after which the
result is announced into the OCX index.

Starpls is a solo tool under a personal handle, so the tool names itself:
`starpls/starpls`.

## Layout

```
starpls/
├── mirror.yml          the spec — never at the repo root
├── metadata.json       bundle interface
├── CATALOG.md          → ocx package describe
├── logo.svg / logo.png describe assets, 512px PNG
└── tests/smoke.star    Starlark smoke test
```

`LICENSE` and `NOTICE.md` are shared at the root. There is deliberately no
`mirror-base.yml`: one package, every key package-owned.

## Platforms

`linux/amd64` and `linux/arm64` (dynamically linked against glibc only, so
`+libc.glibc`, tested on ubuntu and fedora), `darwin/amd64` (from v0.1.17),
`darwin/arm64`, `windows/amd64`. Upstream ships no musl and no `windows/arm64`
build. The flat `.tar.gz` / `.zip` archives are mirrored, not the raw binaries.

## Smoke test

`starpls check` needs Bazel, so the hermetic functional check is an LSP
`initialize` / `shutdown` handshake over stdin, plus the `version` shape.

## Editing

```bash
direnv allow
ocx-mirror package validate starpls/mirror.yml
ocx-mirror package pipeline generate ci --spec starpls/mirror.yml
```

Never hand-edit `.github/workflows/`; the `verify-generated` guard exits 65 on
drift.
