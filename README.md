OVERVIEW
========

This repository contains `cryptmount`, a tiny utility that is a
wrapper for `cryptsetup` which makes use of a `crypttab` file.

This distribution is a fork of Sabotage-Linux' `cryptmount` as of
commit 8b7af97 (Thu Nov 19, 2020).  The Sabotage-Linux' version of
`cryptmount` is a patched version of Matthew's Monaco `cryptmount`.

This distribution have the following little differences:
  * add LICENSE file (taken from Matthew's initial Arch package)
  * GNU-style help/usage (`-[hV]` options)
  * no `awk(1)` dependency
  * `findmnt(8)` is mandatory
  * use `TMPDIR` as work directory and fallback to `/tmp` if unset
  * POSIX Makefile
  * various minor changes and cleanups (however, refactoring is still
    WIP)

See git log for complete/further differences.

The original sources can be downloaded from:
  1. https://github.com/sabotage-linux/cryptmount
  2. https://github.com/sabotage-linux/cryptmount/archive/8b7af97/cryptmount-8b7af97.zip


REQUIREMENTS
============

Build time
----------
  * POSIX `sh(1p)`, `make(1p)` and "mandatory utilities"
  * `scdoc(1)` to build manual pages

Runtime
-------
  * POSIX `sh(1p)` and "mandatory utilities"
  * `findmnt(8)` from `coreutils` package
  * `cryptsetup(8)`
  * `blkid(8)`
  * `mkswap(8)`


INSTALL
=======

To install this package, run:

    make install

See `config.mk` file for configuration parameters.


DOCUMENTATION
=============

See `/man` directory for manual pages.


CREDITS
=======

Original developer:
  * Matthew Monaco <matthew.monaco@0x01b.net>

Resurrection & patches:
  * rofl0r <retnyg@gmx.net>


LICENSE
=======

`cryptmount` is licensed through the
[GNU General Public License v1](https://gnu.org/licenses/gpl.html).

See `COPYING` for license terms and `COPYRIGHT` for notices.
