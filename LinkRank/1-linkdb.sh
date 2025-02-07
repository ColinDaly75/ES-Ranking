#!/bin/bash

set -x

# Description
# linkrank, like pagerank, is an algorithm that computes an 'importance' score for a web page, based on the number and importance of inlinks.
echo "This script takes the creates $LINKRANK_NUTCH_DUMPDIR and converts it to a format suitable for solr's 'linkrank' field"
echo "The linkrank file may be large, this may take a few minutes"

SOLRHOST="http://REDACTED"


# Variables
NUTCHDIR="/opt/nutch"
LINKRANK_NUTCHDIR="$NUTCHDIR/crawl/linkdb"
LINKRANK_NUTCH_DUMPDIR="$LINKRANK_NUTCHDIR/dump"
LINKRANK_NUTCH_DUMPFILE="$LINKRANK_NUTCH_DUMPDIR/part-r-00000"
WEBGRAPH_NUTCHDIR="$NUTCHDIR/crawl/webgraphdb"
HOME_DIR=/home/dalyc13/
SCRIPT_DIR="$HOME_DIR/linkrank/"
WEBGRAPH_DUMPDIR="$HOME_DIR/linkrank/"



# linkrank, like pagerank, takes a list of html text anchors that point to a particular URL and uses them as relevance pointer
echo "This script takes the contents of the nutch $LINKRANK_NUTCHDIR and converts it to a format suitable for solr's 'anchor' field"
echo "The linkrank file may be large, this may take a few minutes"

# cleanup previous
#rm -rf $LINKRANK_NUTCHDIR
#rm -rf $WEBGRAPH_NUTCHDIR

# requirements
# segments directory (/opt/nutch/crawl/segements) must exist


# 0. Prep
#cd /opt/nutch
cd $NUTCHDIR;
# cleanup previous
rm -rf $LINKRANK_NUTCHDIR  # (/opt/nutch/crawl/linkdb/)
rm -rf $WEBGRAPH_NUTCHDIR  # (/opt/nutch/crawl/webgraphdb)
rm -rf $SCRIPT_DIR/*.out



# 1. Generate webgraph
bin/nutch org.apache.nutch.scoring.webgraph.WebGraph -segmentDir crawl/segments/ -webgraphdb crawl/webgraphdb

# 2. Link Rank generation
bin/nutch org.apache.nutch.scoring.webgraph.LinkRank -webgraphdb crawl/webgraphdb/
 #The above command does 10 iterations


# 3. Score Updater
bin/nutch org.apache.nutch.scoring.webgraph.ScoreUpdater -crawldb crawl/crawldb/ -webgraphdb crawl/webgraphdb/

# 4. Dump the data in readable format
bin/nutch org.apache.nutch.scoring.webgraph.NodeDumper -scores -topn 100000 -webgraphdb crawl/webgraphdb/ -output crawl/webgraphdb/dump/scores

cp -p /opt/nutch/crawl/webgraphdb/dump/scores/part-r-00000 $SCRIPT_DIR/url-scores.out


# 5. create linkdb
bin/nutch invertlinks crawl/linkdb/ -dir crawl/segments/


# 6. dump linkdb to create anchors file
bin/nutch readlinkdb crawl/linkdb/ -dump $LINKRANK_NUTCH_DUMPDIR

cp -p $LINKRANK_NUTCH_DUMPFILE $SCRIPT_DIR/anchors.out

if [ -f $LINKRANK_NUTCH_DUMPFILE ]
        then
                echo "$LINKRANK_NUTCH_DUMPFILE file has been successfully created"
        else
                echo "$LINKRANK_NUTCH_DUMPFILE file not created, exiting"
                exit 1
fi


# 7. dump full list of solr urls into file
#/usr/bin/curl ''$SOLRHOST':8983/solr/$CORE/select?fl=url&q=url:*&rows=100000&wt=csv' | grep -i https  > $SCRIPT_DIR/all-solr-urls.out 2>/dev/null




# Cleanup
#/bin/rm -f all-solr-urls.out  2>/dev/null


