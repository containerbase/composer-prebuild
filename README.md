# containerbase Composer releases

[![build](https://github.com/containerbase/composer-prebuild/actions/workflows/build.yml/badge.svg)](https://github.com/containerbase/composer-prebuild/actions/workflows/build.yml?query=branch%3Amain)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/containerbase/composer-prebuild)
![License: MIT](https://img.shields.io/github/license/containerbase/composer-prebuild)

Prebuild Composer releases used by [containerbase/base](https://github.com/containerbase/base).

## Development

`mise install` installs Node.js, pnpm, jactionlint, shellcheck, zizmor and the dependencies.

```bash
pnpm lint            # pnpm oxfmt-fix to fix the formatting
jactionlint          # the GitHub workflows
zizmor .github/      # security audit of the GitHub workflows
```

CI runs jactionlint and zizmor through mise in the `lint` job, and the commit hook runs them on staged workflow files.
