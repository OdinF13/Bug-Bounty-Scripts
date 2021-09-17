#!/bin/bash

if [ $# -eq 0 ]; then
        echo "usage: ${0##*/} [domain] <include subs:false>" >&2
        exit 2
fi

[ $2 ] && query="*.${1}" || query="$1"
URL='http://web.archive.org/cdx/search/cdx?url='${query}'/*&output=text&fl=original&collapse=urlkey'

curl -A 'Google-bot' -m 20 -s "$URL" \
  | sort | uniq | tee -a "${1}.txt"

exit $?
