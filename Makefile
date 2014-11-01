LN = ln -sf

INSTALL_DIR = /usr/local/bin/

PHPTAGS = scripts/phptags
G = scripts/g
MEMORY_USAGE = scripts/memory_usage

.PHONY: phptags g memory_usage

phptags:
	${LN} ${PHPTAGS} ${INSTALL_DIR}

g:
	${LN} ${G} ${INSTALL_DIR}

memory_usage:
	${LN} ${MEMORY_USAGE} ${INSTALL_DIR}
