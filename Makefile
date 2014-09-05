CP = cp -f

INSTALL_DIR = /usr/local/bin/

PHPTAGS = scripts/phptags
G = scripts/g
MEMORY_USAGE = scripts/memory_usage

.PHONY: phptags g memory_usage

phptags:
	${CP} ${PHPTAGS} ${INSTALL_DIR}

g:
	${CP} ${G} ${INSTALL_DIR}

memory_usage:
	${CP} ${MEMORY_USAGE} ${INSTALL_DIR}
