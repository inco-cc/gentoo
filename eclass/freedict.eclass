# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: freedict.eclass
# @MAINTAINER:
# maintainer-needed@gentoo.org
# @AUTHOR:
# Original author: Seemant Kulleen <seemant@gentoo.org>
# @SUPPORTED_EAPIS: 7 8
# @BLURB: Ease the installation of freedict translation dictionaries
# @DESCRIPTION:
# This eclass exists to ease the installation of freedict translation
# dictionaries.

case ${EAPI} in
	7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_FREEDICT_ECLASS} ]]; then
_FREEDICT_ECLASS=1

# @ECLASS_VARIABLE: FREEDICT_P
# @DESCRIPTION:
# Strips PN of 'freedict' prefix, to be used in SRC_URI and doins
FREEDICT_P="${PN/freedict-/}"

[[ ${FORLANG} ]] && die "FORLANG is banned, set DESCRIPTION instead"
[[ ${TOLANG} ]] && die "TOLANG is banned, set DESCRIPTION instead"

HOMEPAGE="
	https://freedict.sourceforge.net/en/
	https://github.com/freedict/fd-dictionaries"
SRC_URI="https://freedict.sourceforge.net/download/linux/${FREEDICT_P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="app-text/dictd"

S="${WORKDIR}"

# @FUNCTION: freedict_src_install
# @DESCRIPTION:
# Installs translation-specific dict.dz and index files.
freedict_src_install() {
	insinto /usr/$(get_libdir)/dict
	doins ${FREEDICT_P}.dict.dz
	doins ${FREEDICT_P}.index
}

fi

EXPORT_FUNCTIONS src_install
