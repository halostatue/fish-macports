# halostatue/fish-macports

[![Version][version]](https://github.com/halostatue/fish-macports/releases)

Configuration for [MacPorts][macports] in the [fish shell][shell].

## Installation

Install with [Fisher][fisher]:

```fish
fisher install halostatue/fish-macports@v1
```

### System Requirements

- [fish][fish] 3.4+
- [MacPorts][macports]

## Startup Configuration (`conf.d`)

The configuration file for fish-macports will detect the presence of the `port`
executable (at `/opt/local/bin/port`) and place the MacPorts binary paths in
`$PATH`.

### `$PATH` Configuration

If `/opt/local/bin` is found in `$fish_user_paths`, `$PATH` configuration will
be skipped. Note that putting MacPorts paths in `$fish_user_paths` is not
recommended, as `/opt/local/sbin` may be placed before `/usr/bin`, potentially
resulting in odd behaviours.

The correct ordering of MacPorts paths with default paths is:

- `/opt/local/bin`
- `/usr/local/bin`
- `/usr/bin`
- `/bin`
- `/opt/local/sbin`
- `/usr/local/sbin`
- `/usr/sbin`
- `/sbin`

#### Interaction with Homebrew

If the Homebrew `brew` binary is present and `(brew --prefix)/{,s}bin` are in
`$PATH` (but not in `$fish_user_paths`), this plugin will order the paths
according to the configuration value `__halostatue_macports_homebrew_order`,
which should be set as a universal variable.

If unset or `macports`, the paths will be ordered as:

- `/opt/local/bin`
- `(brew --prefix)/bin`
- `/usr/local/bin`
- `/usr/bin`
- `/bin`
- `/opt/local/sbin`
- `(brew --prefix)/sbin`
- `/usr/local/sbin`
- `/usr/sbin`
- `/sbin`

If set to `homebrew`, the paths will be ordered as:

- `(brew --prefix)/bin`
- `/opt/local/bin`
- `/usr/local/bin`
- `/usr/bin`
- `/bin`
- `(brew --prefix)/sbin`
- `/opt/local/sbin`
- `/usr/local/sbin`
- `/usr/sbin`
- `/sbin`

## Licence

[MIT](./LICENCE.md)

## Change Log

[CHANGELOG](./CHANGELOG.md)

## Contributing

- [Contributing](./CONTRIBUTING.md)
- [Contributors](./CONTRIBUTORS.md)
- [Code of Conduct](./CODE_OF_CONDUCT.md)

[macports]: https://macports.org
[shell]: https://fishshell.com 'friendly interactive shell'
[version]: https://img.shields.io/github/tag/halostatue/fish-brew.svg?label=Version
[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
