# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/xdvipdfmx/xdvipdfmx-0.4.ebuild,v 1.10 2008/05/12 20:18:09 nixnut Exp $

inherit eutils subversion

DESCRIPTION="Extended xdvi for use with XeTeX and other unicode TeXs."
HOMEPAGE="http://scripts.sil.org/svn-view/xdvipdfmx/"
ESVN_REPO_URI="http://scripts.sil.org/svn-public/${PN}/TRUNK"
LICENSE="GPL-2-with-linking-exception"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=media-libs/freetype-2.0
	virtual/latex-base
	"

src_compile() {
	econf \
		--with-ft2lib=/usr/lib/libfreetype.so \
		--with-ft2include=/usr/include/freetype2 || die "econf failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc README doc/tug2003.pdf doc/CJK-CID.txt doc/images/dvipdfm-cjk.png doc/images/dvipdfmx-logo.png doc/images/rightarrow.png doc/images/right_triangle.png doc/images/dvipdfmx.png TODO BUGS AUTHORS
}
