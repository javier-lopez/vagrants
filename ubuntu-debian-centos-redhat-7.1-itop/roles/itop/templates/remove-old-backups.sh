#!/bin/sh

_remove_old_backups() {
    [ -z "${1}" ] && return 1
    [ -z "${2}" ] && return 1

    _robackups__target="$(find "$(dirname ${1})" -maxdepth 1 -iname "*$(basename "${1}")*" | wc -l)"
    _robackups__extra="$(($_robackups__target - $2))"

    if [ "${_robackups__target}" -gt "${2}" ]; then
        rm -rf $(find "$(dirname ${1})" -maxdepth 1 -iname "*$(basename "${1}")*" -printf '%T+ %p\n' | sort | head -"${_robackups__extra}" | awk '{print $2}')
    fi
}

[ -z "${1}" ] && exit 1 || file="${1}"
[ -z "${2}" ] && limit="5" || limit="${2}"

_remove_old_backups "${file}" "${limit}"
