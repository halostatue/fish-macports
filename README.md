# halostatue/fish-macports

[![Version][]](https://github.com/halostatue/fish-macports/releases)

Configuration for [MacPorts][] in the [fish shell][].

## Installation

Install with [Fisher][]:

```fish
fisher install halostatue/fish-bsrew@v1
```

### System Requirements

- [fish][] 3.2+
- [MacPorts][]

## Startup Configuration

Adds MacPorts paths to `$PATH`. This uses the `fish_add_path` function
included with Fish 3.2. This is not set in `$fish_user_paths` because the
correct order for MacPorts paths is:

- `/opt/local/bin`
- `/usr/local/bin`
- `/usr/bin`
- `/bin`
- `/opt/local/sbin`
- `/usr/local/sbin`
- `/usr/sbin`
- `/sbin`

If `/opt/local/bin` and `/opt/local/sbin` are placed in `$fish_user_paths`,
then `/opt/local/sbin` would end up being placed _before_ `/usr/bin`, which
might result in odd behaviours.

As a special case, `/opt/homebrew/bin` and `/opt/homebrew/sbin` will be added
if they exist, after `/opt/local` and before `/usr/local`.

## Licence

[MIT](./LICENCE.md)

## Change Log

[CHANGELOG](./CHANGELOG.md)

## Contributing

- [Contributing](./CONTRIBUTING.md)
- [Contributors](./CONTRIBUTORS.md)
- [Code of Conduct](./CODE_OF_CONDUCT.md)

[macports]: https://macports.org
[fish shell]: https://fishshell.com 'friendly interactive shell'
[version]: https://img.shields.io/github/tag/halostatue/fish-brew.svg?label=Version
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
