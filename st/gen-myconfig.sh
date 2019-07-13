#! /bin/sh

# Generates my preferences patch. Customizations are done on `config.h` and
# then the diff file is generated comparing to config.def.h

OFILE="patches/st-myconfig.diff"

rm -f "$OFILE"
diff -u st/config.def.h st/config.h \
    | sed -e 's/config.def.h/config.h/' \
    > "$OFILE"

true
