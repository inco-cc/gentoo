# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=DEXTER
DIST_VERSION=0.2501
DIST_EXAMPLES=("examples/*")
inherit perl-module

DESCRIPTION="Error handling with exception class"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-perl/Module-Build"
BDEPEND="
	dev-perl/Module-Build
	test? (
		>=dev-perl/Test-Unit-Lite-0.120.0
	)
"

PATCHES=(
	"${FILESDIR}"/Exception-Base-0.2501-perl-5.38.patch
)
