#!/bin/bash

FILE=$1 

if [ "${FILE}" == "" ]; then
    echo "$0 file"
    exit 1
fi

eye --nope --quiet --quantify http://www.w3.org/2000/10/swap/var# --pass-only-new \
    n3/aux.n3 n3/ling2n3.n3 ${FILE} > temp/t1.n3

eye --nope --quiet --quantify http://www.w3.org/2000/10/swap/var#  \
    --query n3/trigdata.n3 ${FILE} > temp/t2.n3

eye --nope --quiet --pass-merged temp/t1.n3 temp/t2.n3 | sed -e 's/:____query/=^/g' > ${FILE}.n3

rm temp/t1.n3 temp/t2.n3

echo "> ${FILE}.n3"

eye --nope --quiet --quantify http://www.w3.org/2000/10/swap/var# --pass-only-new \
    n3/aux.n3 n3/question.n3 ${FILE} > ${FILE}.query

echo "> ${FILE}.query" 

cat > ${FILE}.sh <<EOF
#!/bin/bash
eye --nope --quiet ${FILE}.n3 --query ${FILE}.query
EOF

chmod 755 ${FILE}.sh

echo "> ${FILE}.sh"