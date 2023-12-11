OVERVIEW
--------
This directory contains cryptmount, a tiny utility that is a wrapper
for cryptsetup which makes use of a crypttab file.

This distribution is a fork of Sabotage-Linux' cryptmount as of commit
8b7af97 (Thu Nov 19, 2020).  The Sabotage-Linux' version of cryptmount
is a patched version of Matthew's Monaco cryptmount.

This distribution have the following little differences:
- add LICENSE file (obtained from Matthew's initial Arch package)
- manual pages in mdoc(7) format
- GNU-style help/usage (-[hV] options)
- no awk(1) dependency
- findmnt(8) is mandatory
- use `TMPDIR` as work dir and fallback to `/tmp` if unset
- POSIX Makefile
- various minor changes and cleanups (the code refactoring is still WIP)

See git log for complete/further differences.

The original sources can be downloaded from:
1. https://github.com/sabotage-linux/cryptmount
2. https://github.com/sabotage-linux/cryptmount/archive/8b7af97/cryptmount-8b7af97.zip


REQUIREMENTS
------------
**Build time**:
- POSIX sh(1p), make(1p) and "mandatory utilities"

**Runtime**:
- POSIX sh(1p) and "mandatory utilities"
- findmnt(8)
- cryptsetup(8)
- blkid(8)
- mkswap(8)


INSTALL
-------
The shell command `make install` should install this package.

See `config.mk` file for configuration parameters.


LICENSE
-------
cryptmount is licensed through the GNU General Public License v1
<https://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
