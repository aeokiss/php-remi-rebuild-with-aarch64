#!/bin/sh

DEFINE_RPM_DIST="`rpm --eval %{?dist}`.remi"
DEFINE_ARCHITECTURE=`uname -m`

SOURCE_VERSION_PHP="7.4.27-1"
SOURCE_VERSION_IMAP="2007f-30"

SOURCE_IMAP="https://rpms.remirepo.net/SRPMS/uw-imap-${SOURCE_VERSION_IMAP}.remi.src.rpm"
SOURCE_PHP="https://rpms.remirepo.net/SRPMS/php-${SOURCE_VERSION_PHP}.remi.src.rpm"

RPM_IMAP_DEVEL="uw-imap-devel-${SOURCE_VERSION_IMAP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"
RPM_LIBC_CLIENT="libc-client-${SOURCE_VERSION_IMAP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}.rpm"

DIR_HOME=`echo ~`
DIR_BUILD_RPMS="${DIR_HOME}/rpmbuild/RPMS/$DEFINE_ARCHITECTURE"
DIR_DEST="${DIR_HOME}/remi/php-${SOURCE_VERSION_PHP}${DEFINE_RPM_DIST}.${DEFINE_ARCHITECTURE}"

# Delete all existing builds
rm -rf $DIR_HOME/rpmbuild

yum -y install rpm-build aspell-devel autoconf automake bzip2-devel firebird-devel freetds-devel gcc gcc-c++ gdbm-devel gmp-devel httpd-devel httpd-filesystem krb5-devel libacl-devel libdb-devel libstdc++-devel libtidy-devel libtool libtool-ltdl-devel lmdb-devel net-snmp-devel nginx-filesystem oniguruma-devel openssl-devel pam-devel perl pkgconfig postgresql-devel smtpdaemon systemtap-sdt-devel tokyocabinet-devel unixODBC-devel enchant-devel gd-devel libcurl-devel libedit-devel libxslt-devel libsodium-devel systemd-devel sqlite-devel

# Download and build the University of Washington IMAP
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_IMAP

if [ ! -f $DIR_BUILD_RPMS/$RPM_IMAP_DEVEL ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS}/${RPM_IMAP_DEVEL}"
        exit 1
fi
if [ ! -f $DIR_BUILD_RPMS/$RPM_LIBC_CLIENT ]; then
        echo "[ERROR] Can not found file : ${DIR_BUILD_RPMS}/${RPM_LIBC_CLIENT}"
        exit 1
fi

yum -y localinstall $DIR_BUILD_RPMS/$RPM_IMAP_DEVEL $DIR_BUILD_RPMS/$RPM_LIBC_CLIENT

# Download and build the PHP
rpmbuild --define "dist ${DEFINE_RPM_DIST}" --rebuild $SOURCE_PHP

if [ ! -d $DIR_DEST ]; then
       mkdir -p $DIR_DEST
fi

mv $DIR_BUILD_RPMS/* $DIR_DEST
rm -rf $DIR_HOME/rpmbuild
