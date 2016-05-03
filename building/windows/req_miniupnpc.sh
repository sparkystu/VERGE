#!/bin/bash

# miniupnpc 
echo "=== Building MINIUPNPC now..."
cd /tmp
wget 'http://miniupnp.tuxfamily.org/files/download.php?file=miniupnpc-1.6.tar.gz' -O /tmp/miniupnpc-1.6.tar.gz
tar xzf miniupnpc-1.6.tar.gz
cd /tmp/miniupnpc-1.6
sed -i 's/CC = gcc/CC = i686-w64-mingw32.static-gcc/' Makefile.mingw
sed -i 's/wingenminiupnpcstrings \$/wine \.\/wingenminiupnpcstrings \$/' Makefile.mingw
sed -i 's/dllwrap/i686-w64-mingw32.static-dllwrap/' Makefile.mingw
sed -i 's/wine /.\/updateminiupnpcstrings.sh #/' Makefile.mingw
sed -i 's/-enable-stdcall-fixup/-Wl,-enable-stdcall-fixup/' Makefile.mingw
sed -i 's/driver-name gcc/driver-name i686-w64-mingw32.static-gcc/' Makefile.mingw
sed -i 's/; miniupnpc library/miniupnpc/' miniupnpc.def
PATH=/usr/lib/mxe/usr/bin/:/usr/bin:$PATH make -f Makefile.mingw 
echo "=== done building MINIUPNPC =="