#!/bin/sh
set -xe

_last_apt_get_update() {
    [ -z "${1}" ] && cache_seconds="3600" || cache_seconds="${1}"
    cache_file="/var/cache/apt/pkgcache.bin"
    if [ -f "${cache_file}" ]; then
        last="$(stat -c %Y "${cache_file}")"
        now="$(date +'%s')"
        diff="$(($now - $last))"
        if [ "${diff}" -lt "${cache_seconds}" ]; then
            return 1
        else
            return 0
        fi
    else
        return 0
    fi
}

if ! command -v "java" >/dev/null 2>&1; then
    if ! command -v "add-apt-repository"  >/dev/null 2>&1; then
        sudo apt-get install software-properties-common
    fi
    sudo add-apt-repository ppa:webupd8team/java -y
    printf "%s\\n" 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | \
        sudo /usr/bin/debconf-set-selections
    _require_apt_get_update="1"
fi

if [ X"${_require_apt_get_update}" = X"1" ] || _last_apt_get_update 86400; then
    sudo apt-get update
fi

sudo apt-get install --no-install-recommends -y oracle-java8-installer
