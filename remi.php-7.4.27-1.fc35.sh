#!/bin/sh

DEFINE_RPM_DIST="`rpm --eval %{?dist}`.remi"
DEFINE_ARCHITECTURE=`uname -m`

SOURCE_SHORT_VERSION_PHP="7.4"
SOURCE_VERSION_PHP="7.4.27-1"
SOURCE_VERSION_IMAP="2007f-30"
SOURCE_VERSION_ZIP="1.20.0-2"
SOURCE_VERSION_PEAR="1.10.13-1"
SOURCE_VERSION_PHP_REDIS5="5.3.5-1"
SOURCE_VERSION_REDIS5="5.0.14-1"
SOURCE_VERSION_REDIS6="6.2.6-1"
SOURCE_VERSION_IGBINARY="3.2.6-2"
SOURCE_VERSION_MSGPACK="2.1.2-3"
SOURCE_VERSION_APCU="5.1.21-1"
SOURCE_VERSION_YAML="2.2.2-1"

SOURCE_IMAP="https://rpms.remirepo.net/SRPMS/uw-imap-${SOURCE_VERSION_IMAP}.remi.src.rpm"
SOURCE_PHP="https://rpms.remirepo.net/SRPMS/php-${SOURCE_VERSION_PHP}.remi.src.rpm"
SOURCE_ZIP="https://rpms.remirepo.net/SRPMS/php-pecl-zip-${SOURCE_VERSION_ZIP}.remi.src.rpm"
SOURCE_PEAR="https://rpms.remirepo.net/SRPMS/php-pear-${SOURCE_VERSION_PEAR}.remi.src.rpm"
SOURCE_PHP_REDIS5="https://rpms.remirepo.net/SRPMS/php-pecl-redis5-${SOURCE_VERSION_PHP_REDIS5}.remi.src.rpm"
SOURCE_REDIS5="https://rpms.remirepo.net/SRPMS/redis-${SOURCE_VERSION_REDIS5}.remi.src.rpm"
SOURCE_REDIS6="https://rpms.remirepo.net/SRPMS/redis-${SOURCE_VERSION_REDIS6}.remi.src.rpm"
SOURCE_IGBINARY="https://rpms.remirepo.net/SRPMS/php-pecl-igbinary-${SOURCE_VERSION_IGBINARY}.remi.src.rpm"
SOURCE_MSGPACK="https://rpms.remirepo.net/SRPMS/php-pecl-msgpack-${SOURCE_VERSION_MSGPACK}.remi.src.rpm"
SOURCE_APCU="https://rpms.remirepo.net/SRPMS/php-pecl-apcu-${SOURCE_VERSION_APCU}.remi.src.rpm"
SOURCE_YAML="https://rpms.remirepo.net/SRPMS/php-pecl-yaml-${SOURCE_VERSION_YAML}.remi.src.rpm"

RPM_IMAP_DEVEL="uw-imap-devel-${SOURCE_VERSION_IMAP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_LIBC_CLIENT="libc-client-${SOURCE_VERSION_IMAP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP="php-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP_CLI="php-cli-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP_DEVEL="php-devel-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP_XML="php-xml-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP_COMMON="php-common-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP_PROCESS="php-process-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP_JSON="php-json-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PEAR="php-pear-${SOURCE_VERSION_PEAR}${DEFINE_RPM_DIST}.noarch.rpm"
RPM_ZIP="php-pecl-zip-${SOURCE_VERSION_ZIP}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_APCU="php-pecl-apcu-${SOURCE_VERSION_APCU}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_APCU_DEVEL="php-pecl-apcu-devel-${SOURCE_VERSION_APCU}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_MSGPACK="php-pecl-msgpack-${SOURCE_VERSION_MSGPACK}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_MSGPACK_DEVEL="php-pecl-msgpack-devel-${SOURCE_VERSION_MSGPACK}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_IGBINARY="php-pecl-igbinary-${SOURCE_VERSION_IGBINARY}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_IGBINARY_DEVEL="php-pecl-igbinary-devel-${SOURCE_VERSION_IGBINARY}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_REDIS5="redis-${SOURCE_VERSION_REDIS5}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_REDIS6="redis-${SOURCE_VERSION_REDIS6}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_PHP_REDIS5="php-pecl-redis5-${SOURCE_VERSION_PHP_REDIS5}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"
RPM_YAML="php-pecl-yaml-${SOURCE_VERSION_YAML}${DEFINE_RPM_DIST}.${SOURCE_SHORT_VERSION_PHP}.${DEFINE_ARCHITECTURE}.rpm"

DIR_HOME=`echo ~`
DIR_BUILD_RPMS_ARCHITECTURE="${DIR_HOME}/rpmbuild/RPMS/$DEFINE_ARCHITECTURE"
DIR_BUILD_RPMS_NOARCH="${DIR_HOME}/rpmbuild/RPMS/noarch"
DIR_DEST="${DIR_HOME}/remi/php-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}"

# Delete all existing builds
rm -rf $DIR_HOME/rpmbuild
rm -rf $DIR_DEST

yum -y install rpm-build aspell-devel autoconf automake bzip2-devel firebird-devel freetds-devel gcc gcc-c++ gdbm-devel gmp-devel httpd-devel httpd-filesystem krb5-devel libacl-devel libdb-devel libstdc++-devel libtidy-devel libtool libtool-ltdl-devel lmdb-devel net-snmp-devel nginx-filesystem oniguruma-devel openssl-devel pam-devel perl pkgconfig postgresql-devel smtpdaemon systemtap-sdt-devel tokyocabinet-devel unixODBC-devel enchant-devel gd-devel libcurl-devel libedit-devel libxslt-devel libsodium-devel systemd-devel sqlite-devel libzip-devel php-fedora-autoloader-devel lz4-devel liblzf-devel libyaml-devel

################################################################################
# Download and build the University of Washington IMAP
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_IMAP
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_IMAP_DEVEL ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_IMAP_DEVEL}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_LIBC_CLIENT ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_LIBC_CLIENT}"
        exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_IMAP_DEVEL $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_LIBC_CLIENT

################################################################################
# Download and build the PHP
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_PHP
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_CLI ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP_CLI}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_DEVEL ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP_DEVEL}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_XML ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP_XML}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_COMMON ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP_COMMON}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_PROCESS ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP_PROCESS}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_JSON ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP_JSON}"
        exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_CLI $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_DEVEL $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_XML $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_COMMON $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_PROCESS $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_JSON

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_PEAR
if [ ! -f $DIR_BUILD_RPMS_NOARCH/$RPM_PEAR ]; then
       echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_NOARCH}/${RPM_PEAR}"
       exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_NOARCH/$RPM_PEAR

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_ZIP
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_ZIP ]; then
       echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_ZIP}"
       exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_ZIP

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_APCU
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_APCU ]; then
      echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_APCU}"
      exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_APCU_DEVEL ]; then
      echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_APCU_DEVEL}"
      exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_APCU $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_APCU_DEVEL

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_MSGPACK
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_MSGPACK ]; then
     echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_MSGPACK}"
     exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_MSGPACK_DEVEL ]; then
     echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_MSGPACK_DEVEL}"
     exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_MSGPACK $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_MSGPACK_DEVEL

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_IGBINARY
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_IGBINARY ]; then
    echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_IGBINARY}"
    exit 1
fi
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_IGBINARY_DEVEL ]; then
    echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_IGBINARY_DEVEL}"
    exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_IGBINARY $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_IGBINARY_DEVEL

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_REDIS5
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_REDIS5 ]; then
    echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_REDIS5}"
    exit 1
fi
# does not install redis5 because php-pecl-redis5 requires redis6
#yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_REDIS5

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_REDIS6
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_REDIS6 ]; then
    echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_REDIS6}"
    exit 1
fi
yum -y localinstall $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_REDIS6

################################################################################
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_PHP_REDIS5
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_PHP_REDIS5 ]; then
    echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_PHP_REDIS5}"
    exit 1
fi

rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_YAML
if [ ! -f $DIR_BUILD_RPMS_ARCHITECTURE/$RPM_YAML ]; then
    echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS_ARCHITECTURE}/${RPM_YAML}"
    exit 1
fi

yum -y remove rpm-build aspell-devel autoconf automake bzip2-devel firebird-devel freetds-devel gcc gcc-c++ gdbm-devel gmp-devel httpd-devel httpd-filesystem krb5-devel libacl-devel libdb-devel libstdc++-devel libtidy-devel libtool libtool-ltdl-devel lmdb-devel net-snmp-devel nginx-filesystem oniguruma-devel openssl-devel pam-devel perl pkgconfig postgresql-devel smtpdaemon systemtap-sdt-devel tokyocabinet-devel unixODBC-devel enchant-devel gd-devel libcurl-devel libedit-devel libxslt-devel libsodium-devel systemd-devel sqlite-devel libc-client uw-imap-devel recode recode-devel libargon2-devel libzip-devel php-fedora-autoloader-devel libzip php-cli php-common php-fedora-autoloader php-process php-theseer-autoload php-theseer-directoryscanner php-xml php-zetacomponents-base php-zetacomponents-console-tools lz4-devel liblzf-devel liblzf php php-pear php-pecl-apcu php-pecl-apcu-devel php-pecl-msgpack php-pecl-msgpack-devel php-pecl-igbinary php-pecl-igbinary-devel redis php-pecl-redis5 php-json libyaml-devel

if [ ! -d $DIR_DEST ]; then
       mkdir -p $DIR_DEST
fi

mv $DIR_BUILD_RPMS_ARCHITECTURE/* $DIR_DEST
mv $DIR_BUILD_RPMS_NOARCH/* $DIR_DEST
rm -rf $DIR_HOME/rpmbuild
