#!/bin/sh
cd "`dirname $0`/.."

# FUNCTIONS
log_in_colors(){
	awk '{
		if ( $0 ~ /INFO/ ) {print "\033[32m" $0 "\033[39m"}
		else if ( $0 ~ /(SEVERE|WARNING|ERROR)/ ) {print "\033[31m" $0 "\033[39m"}
		else { print $0 }
	}'
}

# CONFIGURABLE VARIABLES
LIBDIR="./lib"
LOG_CONF=./conf/logging.conf

# RUNTIME VARIABLES
JAVA=java
JAVA_OPTS="-Djava.util.logging.config.file=${LOG_CONF}"
#JAVA_OPTS=""
MAIN_CLASS=ibratan.ttm.bridge.Mainloop

# READ CUSTOM CONFIGURATIONS
if [ -e bin/ttm-server.conf ]; then
	. bin/ttm-server.conf
fi

# MAIN
LIB_CLASSPATH=`ls ${LIBDIR}/*.jar | tr '\n' ' ' | sed 's/  */ /g' | tr ' ' ':'`
CLASSPATH=${LIB_CLASSPATH}:.

${JAVA} ${JAVA_OPTS} -classpath "${CLASSPATH}" ${MAIN_CLASS} $@ 2>&1 | log_in_colors

