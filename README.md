OVERVIEW
========

`cryptmount` is a small utility that wraps `cryptsetup(8)` and
operates using a `/etc/crypttab` file.

This distribution is a fork of Sabotage‑Linux `cryptmount` at commit
8b7af97 (Thu Nov 19, 2020).  The Sabotage‑Linux version itself is a
patched variant of Matthew Monaco's original `cryptmount`.

The following differences are introduced:
  * Added LICENSE file (from Matthew's initial Arch package)
  * GNU-style help and usage (`-[hV]` options)
  * Removed `awk(1)` dependency
  * Mandatory use of `findmnt(8)`
  * Work directory taken from `TMPDIR`, falling back to `/tmp` if
    unset
  * POSIX-compliant Makefile
  * Vim syntax highlighting for `/etc/crypttab`
  * Various minor changes and cleanups (refactoring still in progress)

See the git log for full history.

The original sources can be downloaded from:
  1. https://github.com/sabotage-linux/cryptmount
  2. https://github.com/sabotage-linux/cryptmount/archive/8b7af97/cryptmount-8b7af97.zip

---

REQUIREMENTS
============

Build time
----------
  * POSIX `sh(1p)`, `make(1p)`, and "mandatory utilities"
  * `scdoc(1)` to generate manual pages

Runtime
-------
  * POSIX `sh(1p)` and "mandatory utilities"
  * `findmnt(8)` from `coreutils`
  * `cryptsetup(8)`
  * `blkid(8)`
  * `mkswap(8)`

---

INSTALLATION
============

To install:

```sh
# as root
make install
```

Configuration parameters are defined in `config.mk`.

---

DOCUMENTATION
=============

Manual pages are provided in `/man` and installed under the system
manual hierarchy.

---

CREDITS
=======

Original developer:
  * Matthew Monaco <matthew.monaco@0x01b.net>

Resurrection and patches:
  * rofl0r <retnyg@gmx.net>

---

LICENSE
=======

`cryptmount` is licensed under the
[GNU General Public License v1](https://gnu.org/licenses/gpl.html).

See `COPYING` for license terms and `COPYRIGHT` for notices.
