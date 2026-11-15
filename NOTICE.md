# NOTICE

This repository packages and redistributes upstream software published by the
[starpls](https://github.com/withered-magic/starpls) project. The Apache-2.0
license in [`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It
does **not** cover any upstream-derived asset — the redistributed bytes carry
their own license, recorded below.

The logo in this repository is an original placeholder drawn for this mirror;
upstream publishes no logo. It is not an upstream mark and implies no
endorsement or affiliation.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `starpls` | `ghcr.io/ocx-contrib/starpls/starpls` | `Apache-2.0` |

---

## `starpls`

Upstream: <https://github.com/withered-magic/starpls>
Published to `ghcr.io/ocx-contrib/starpls/starpls`.

| Component | SPDX | Holder |
|---|---|---|
| starpls (`starpls`) | **Apache-2.0** | Copyright the starpls authors |

Verified with `gh api repos/withered-magic/starpls/license --jq .license.spdx_id`,
which answers `Apache-2.0`. The upstream repository root also carries a
`LICENSE-MIT` file beside `LICENSE-APACHE`; both are permissive, so the
redistribution right is unaffected either way, and the Apache-2.0 id is the one
recorded here.

The Apache License 2.0 grants redistribution of the work in source and object
form, on the conditions that recipients receive a copy of the license, that
modified files are marked, and that any `NOTICE` text is carried forward. No
modifications are made: the binary is republished byte-for-byte inside an OCX
bundle, and the license texts are those in upstream's repository at the tagged
release. Upstream's archives contain the executable only; the
license is available at the repository link above.
