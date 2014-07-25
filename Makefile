CP = cp -f

INSTALL_DIR = /usr/local/bin/

PHPTAGS = scripts/phptags
G = scripts/g

.PHONY: phptags g

phptags:
	${CP} ${PHPTAGS} ${INSTALL_DIR}

g:
	${CP} ${G} ${INSTALL_DIR}
