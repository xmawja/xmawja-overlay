# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="Cisco's packet tracer"
HOMEPAGE="https://www.netacad.com/portal/resources/packet-tracer"
SRC_URI="https://www.netacad.com/portal/resources/packet_tracer/${P}.deb"
#SRC_URI="https://www.netacad.com/portal/resources/file/f40aaa18-2b25-4337-81a3-8f989232abf6"

LICENSE="Cisco"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="fetch mirror strip"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/icu
	x11-libs/xcb-util
"
S="${WORKDIR}"
QA_PREBUILT="opt/pt/*"

pkg_nofetch(){
	ewarn "To fetch sources, you need a Cisco account which is"
	ewarn "available if you're a web-learning student, instructor"
	ewarn "or you sale Cisco hardware, etc."
	ewarn "after that, go to https://www.netacad.com and login with"
	ewarn "your account, and after that, you should download a file"
	ewarn "named \"${SRC_URI}\" then move it to"
	ewarn "your DISTDIR directory (default: /var/cache/distfiles)"
	ewarn "and then, you can proceed with the installation."
}

src_install(){
	cp -r . "${ED}"
	for icon in pka pkt pkz; do
		newicon -s 48x48 -c mimetypes opt/pt/art/${icon}.png application-x-${icon}.png
	done
	dobin opt/pt/packettracer
}
