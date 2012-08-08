#
#   goahead-solaris.sh -- Build It Shell Script to build Embedthis GoAhead
#

ARCH="x86"
ARCH="$(shell uname -m | sed 's/i.86/x86/;s/x86_64/x64/')"
OS="solaris"
PROFILE="debug"
CONFIG="${OS}-${ARCH}-${PROFILE}"
CC="/usr/bin/gcc"
LD="/usr/bin/ld"
CFLAGS="-Wall -fPIC -g -mtune=generic"
DFLAGS="-D_REENTRANT -DPIC -DBIT_DEBUG"
IFLAGS="-I${CONFIG}/inc"
LDFLAGS="-g"
LIBPATHS="-L${CONFIG}/bin"
LIBS="-llxnet -lrt -lsocket -lpthread -lm -ldl"

[ ! -x ${CONFIG}/inc ] && mkdir -p ${CONFIG}/inc ${CONFIG}/obj ${CONFIG}/lib ${CONFIG}/bin

[ ! -f ${CONFIG}/inc/bit.h ] && cp projects/goahead-${OS}-bit.h ${CONFIG}/inc/bit.h
if ! diff ${CONFIG}/inc/bit.h projects/goahead-${OS}-bit.h >/dev/null ; then
	cp projects/goahead-${OS}-bit.h ${CONFIG}/inc/bit.h
fi

rm -rf ${CONFIG}/inc/goahead.h
cp -r goahead.h ${CONFIG}/inc/goahead.h

rm -rf ${CONFIG}/inc/js.h
cp -r js.h ${CONFIG}/inc/js.h

${CC} -c -o ${CONFIG}/obj/balloc.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc balloc.c

${CC} -c -o ${CONFIG}/obj/cgi.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc cgi.c

${CC} -c -o ${CONFIG}/obj/crypt.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc crypt.c

${CC} -c -o ${CONFIG}/obj/db.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc db.c

${CC} -c -o ${CONFIG}/obj/default.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc default.c

${CC} -c -o ${CONFIG}/obj/form.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc form.c

${CC} -c -o ${CONFIG}/obj/goahead.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc goahead.c

${CC} -c -o ${CONFIG}/obj/handler.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc handler.c

${CC} -c -o ${CONFIG}/obj/http.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc http.c

${CC} -c -o ${CONFIG}/obj/js.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc js.c

${CC} -c -o ${CONFIG}/obj/matrixssl.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc matrixssl.c

${CC} -c -o ${CONFIG}/obj/openssl.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc openssl.c

${CC} -c -o ${CONFIG}/obj/rom-documents.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc rom-documents.c

${CC} -c -o ${CONFIG}/obj/rom.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc rom.c

${CC} -c -o ${CONFIG}/obj/runtime.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc runtime.c

${CC} -c -o ${CONFIG}/obj/security.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc security.c

${CC} -c -o ${CONFIG}/obj/socket.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc socket.c

${CC} -c -o ${CONFIG}/obj/ssl.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc ssl.c

${CC} -c -o ${CONFIG}/obj/template.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc template.c

${CC} -c -o ${CONFIG}/obj/um.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc um.c

${CC} -o ${CONFIG}/bin/goahead ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/balloc.o ${CONFIG}/obj/cgi.o ${CONFIG}/obj/crypt.o ${CONFIG}/obj/db.o ${CONFIG}/obj/default.o ${CONFIG}/obj/form.o ${CONFIG}/obj/goahead.o ${CONFIG}/obj/handler.o ${CONFIG}/obj/http.o ${CONFIG}/obj/js.o ${CONFIG}/obj/matrixssl.o ${CONFIG}/obj/openssl.o ${CONFIG}/obj/rom-documents.o ${CONFIG}/obj/rom.o ${CONFIG}/obj/runtime.o ${CONFIG}/obj/security.o ${CONFIG}/obj/socket.o ${CONFIG}/obj/ssl.o ${CONFIG}/obj/template.o ${CONFIG}/obj/um.o ${LIBS} ${LDFLAGS}

${CC} -c -o ${CONFIG}/obj/test.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc test.c

${CC} -o ${CONFIG}/bin/goahead-test ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/balloc.o ${CONFIG}/obj/cgi.o ${CONFIG}/obj/crypt.o ${CONFIG}/obj/db.o ${CONFIG}/obj/default.o ${CONFIG}/obj/form.o ${CONFIG}/obj/handler.o ${CONFIG}/obj/http.o ${CONFIG}/obj/js.o ${CONFIG}/obj/matrixssl.o ${CONFIG}/obj/openssl.o ${CONFIG}/obj/rom-documents.o ${CONFIG}/obj/rom.o ${CONFIG}/obj/runtime.o ${CONFIG}/obj/security.o ${CONFIG}/obj/socket.o ${CONFIG}/obj/ssl.o ${CONFIG}/obj/template.o ${CONFIG}/obj/test.o ${CONFIG}/obj/um.o ${LIBS} ${LDFLAGS}

${CC} -c -o ${CONFIG}/obj/webcomp.o -Wall -fPIC ${LDFLAGS} -mtune=generic ${DFLAGS} -I${CONFIG}/inc webcomp.c

${CC} -o ${CONFIG}/bin/webcomp ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/webcomp.o ${LIBS} ${LDFLAGS}
