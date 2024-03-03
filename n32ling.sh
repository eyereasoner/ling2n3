#!/bin/bash

FILE=$1 
QUERY=$2 

if [[ "${FILE}" == "" || "${QUERY}" == "" ]]; then
    echo "$0 file query"
    exit 1
fi

eye --nope --quiet --pass-only-new \
    n3/n32ling.n3 <( \
        cat ${FILE} | sed -e 's/=>/<urn:log:implies>/g' \
                    | sed -e 's/\?\([a-zA-Z0-9_][a-zA-Z0-9_]*\)/<http:\/\/www.w3.org\/2000\/10\/swap\/var#\1>/g'
        ) > temp/t1.n3

eye --nope --quiet --pass \
    n3/data.n3 <(cat ${FILE} | sed -e 's/=>/<urn:log:implies>/g') > temp/t2.n3

eye --nope --quiet --pass-only-new \
    n3/n32ling_question.n3 <( \
        cat ${QUERY} | sed -e 's/=>/<urn:log:implies>/g' \
                    | sed -e 's/\?\([a-zA-Z0-9_][a-zA-Z0-9_]*\)/<http:\/\/www.w3.org\/2000\/10\/swap\/var#\1>/g'
        ) > temp/t3.n3

echo "> ${FILE}.trig"

eye --nope --quiet --pass-merged temp/t1.n3 temp/t2.n3 temp/t3.n3 |\
        sed -e 's/<http:\/\/www.w3.org\/2002\/07\/owl#sameAs> {/{/' |\
        sed -e 's/<urn:lingua:>/<http:\/\/www.w3.org\/2000\/10\/swap\/lingua#>/' |\
        sed -e 's/^}\./}/g' > ${FILE}.trig

rm temp/t1.n3 temp/t2.n3 temp/t3.n3

cat > ${FILE}.sh <<EOF
#!/bin/bash
eye --nope --quiet ${FILE}.trig
EOF

chmod 755 ${FILE}.sh

echo "> ${FILE}.sh"