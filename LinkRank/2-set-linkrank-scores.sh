#!/bin/bash
#
# update linkrank field in solr
# with numerical score from nutc


set -x


SERVER=http://REDACTED

# get list of docs that have no linkrank set
/usr/bin/curl ''$SERVER':8983/solr/$CORE/select?q=-linkrank:\[0%20TO%20*\]&fl=url&rows=100000&wt=csv'  | grep -i https > nolinkrank-pass1.out



for URL in `/bin/cat nolinkrank-pass1.out | grep -i https | awk '{print $1}'`
do
        #echo $URL
        for SCORE in `/bin/cat url-scores.out | grep -i -w $URL | awk '{print $2}'`
        do
                curl ''$SERVER':8983/solr/$CORE/update?commit=true' \
                -H 'Content-type:application/json' \
                -d '[{"id":"'$URL'","linkrank":{"set":'$SCORE'}}]'
        done
done

# get list of docs that have no linkrank score in solr
/usr/bin/curl ''$SERVER':8983/solr/$CORE/select?q=-linkrank:\[0%20TO%20*\]&fl=url&rows=100000&wt=csv'  | grep -i https > nolinkrank-pass2.out
echo "finished updating solr"


for URL in `/bin/cat nolinkrank-pass2.out | grep -i https | awk '{print $1}' | grep \,`
do
        echo $URL
        URL2=`echo $URL | sed 's|\\\||g' | sed 's|"||g'`
        for SCORE in `/bin/cat url-scores.out | grep -i -w  $URL2 | awk '{print $2}'`
        do
        #echo "grepped URL2 is $URL2"
                curl ''$SERVER':8983/solr/$CORE/update?commit=true' \
                -H 'Content-type:application/json' \
                -d '[{"id":"'$URL2'","linkrank":{"set":'$SCORE'}}]'
        done
done





#cleanup
#rm -f *.out
