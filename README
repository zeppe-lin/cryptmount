OVERVIEW

	This directory contains cryptmount, a tiny utility that is a wrapper
	for cryptsetup which makes use of a crypttab file.

	This distribution is a fork of Sabotage-Linux' cryptmount as of commit
	8b7af97 (Thu Nov 19, 2020).  The Sabotage-Linux' version of cryptmount
	is a patched version of Matthew's Monaco cryptmount.

	This distribution have the following little differences:

		* add the LICENSE file (the license was obtained from git
		  history of Matthew's initial Arch Linux package)
		* the man pages have been rewritten in POD format and adjusted
		  for Zeppe-Lin
		* added CRYPTSETUP_BIN make variable to specify custom
		  cryptsetup(8) location (/sbin/cryptsetup.static for example)

	See git log for complete/further differences.

	The original sources can be downloaded from:
	1. https://github.com/sabotage-linux/cryptmount
	2. https://github.com/sabotage-linux/cryptmount/archive/8b7af97/cryptmount-8b7af97.zip

REQUIREMENTS

	Build time:

		* POSIX sh(1p), make(1p) and "mandatory utilities"
		* pod2man(1pm) to build man pages

	Runtime:

		* POSIX sh(1p) and "mandatory utilities"
		* cryptsetup(8)
		* blkid(8)
		* mkswap(8)

INSTALL

	The shell commands "make && make install" should build and install
	this package.

LICENSE

	cryptmount is licensed through the GNU General Public License v1
	<https://gnu.org/licenses/gpl.html>.
	Read the COPYING file for copying conditions.
	Read the COPYRIGHT file for copyright notices.

End of file.
