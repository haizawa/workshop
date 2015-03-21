#!/bin/sh

ODENOS_HOME_DIR=~/odenos
RUN_DIR=`pwd`
LOG_CONF=../../etc/log_java.conf
LOG_FILE=$ODENOS_HOME_DIR/var/log/example.log

build() {
  cd $ODENOS_HOME_DIR
  mvn install -DskipTests=true
  cd $RUN_DIR
  #mvn clean
  #mvn compile jar:jar
}

start_odenos() {
  cd $ODENOS_HOME_DIR
  ./odenos stop
  ./odenos start
  cd $RUN_DIR
}
stop_odenos() {
  cd $ODENOS_HOME_DIR
  ./odenos stop
  cd $RUN_DIR
}

case "$1" in
-c)
    build
    ;;
-s)
    start_odenos
    ;;
-q)
    stop_odenos
    ;;
*)
    echo "usage: $0 {-s|-q|-c}"
    echo "-s : start ODENOS"
    echo "-q : stop ODENOS"
    echo "-c : build ODENOS"
    ;;
esac

exit
