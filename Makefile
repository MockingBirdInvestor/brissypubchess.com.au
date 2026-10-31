# Installs the website into a web server's folder.
#
#   make install
#
# Installs into WEBROOT, the host's folder for the site, unless another
# folder is given with make install WEBROOT=/path/to/web/folder.
#
# Only the files the site serves are copied, so .git, README.md, CLAUDE.md
# and this Makefile never end up on the web server. Files removed from the
# site are removed from WEBROOT too. DESTDIR is honoured for staged
# installs, as in the GNU coding standards.

WEBROOT ?= /home/brissypubchess/htdocs/www.brissypubchess.com.au
FILES = index.html 404.html robots.txt sitemap.xml
DIRS = the-pony css fonts images

.PHONY: install
install:
	@test -n "$(WEBROOT)" || { echo "Usage: make install WEBROOT=/path/to/web/folder" >&2; exit 1; }
	@test "$(DESTDIR)$(WEBROOT)" != "/" || { echo "Refusing to install into /: --delete would empty it." >&2; exit 1; }
	mkdir -p "$(DESTDIR)$(WEBROOT)"
	rsync -a --delete --delete-excluded \
		$(foreach f,$(FILES),--include=/$(f)) \
		$(foreach d,$(DIRS),--include=/$(d)/ --include=/$(d)/**) \
		--exclude='*' \
		./ "$(DESTDIR)$(WEBROOT)/"
