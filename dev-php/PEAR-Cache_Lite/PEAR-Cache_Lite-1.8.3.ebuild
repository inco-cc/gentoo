# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit php-pear-r2

KEYWORDS="amd64 ~hppa ppc64 sparc x86"
DESCRIPTION="Fast and safe little cache system"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-php/PEAR-PEAR-1.10.1"
DEPEND="test? ( ${RDEPEND} )"
DOCS=( README.md TODO docs/technical docs/examples )

src_test() {
	peardev run-tests -r || die
}
