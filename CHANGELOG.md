# fish-macports Changelog

## 1.1.1 / 2025-01-20

- Fixed metadata that referred to the sibling repo,
  [halostatue/fish-brew][fish-brew].

- Fixed an interaction issue with fisher by no longer having `fish_add_path` at
  the bottom of the `conf.d` file.

## 1.1.0 / 2025-01-05

- Added version information to comment tags.
- Added a configuration variable for MacPorts vs Homebrew order and implemented
  the reordering. The logic is more complex and the directories are built in
  reverse.
- Updated documentation.
- Added tooling to the Justfile for easier release management.

## 1.0.0 / 2025-01-02

- Initial version.

[fish-brew]: https://github.com/halostatue/fish-brew
