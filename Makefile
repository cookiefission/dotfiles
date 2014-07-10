CP = cp -f

INSTALL_DIR = /usr/local/bin/

PHPTAGS = scripts/phptags

phptags:
	${CP} ${PHPTAGS} ${INSTALL_DIR}
