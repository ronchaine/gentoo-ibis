#
#

EAPI=6

inherit epatch

DESCRIPTION="A quick-n-dirty BSD licenced clone of the GNU libc backtrace facility."
HOMEPAGE="https://www.freshports.org/devel/libexecinfo"
SRC_URI="http://distcache.freebsd.org/local-distfiles/itetcu/${P}.tar.bz2"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="!!sys-libs/glibc"

PATCHES=(
)

src_prepare() {
	default

	epatch 	"${FILESDIR}"/10-execinfo.patch\
			"${FILESDIR}"/20-define-gnu-source.patch\
			"${FILESDIR}"/30-linux-makefile.patch
}

src_install() {
	emake DESTDIR="${D}" install
}
