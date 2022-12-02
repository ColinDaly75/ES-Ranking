# Enterprise Search: Ranking Performance in Practice

-----------------------------------------------------------------------------------

Contact:  dalyc24@tcd.ie

-----------------------------------------------------------------------------------

## Keywords: Enterprise Search, Ranking, Datasets, LambdaMart

This repository was cited in the paper **"LEARNING TO RANK: PERFORMANCE AND PRACTICAL BARRIERS TO DEPLOYMENT IN ENTERPRISE SEARCH"**, which is published in the 12TH International Conference on Industrial Technology and Management (Cambridge, ICITM 2023)

## Dataset
We use the small, manually annotated LTR dataset called ENTRP-SRCH.txt (attached) which includes a number of features used for learning to rank. Feature include: -
+ BM25 (applied to title, body and URL)
+ documentRecency (last modification date). 
+ isContact (url contains the word 'contact'). 
+ isAbout (url contains keyword 'about').
+ rawHits (a measure of document popularity). 
+ urlLength (number of terms in url path hierarchy).
+ LinkRank (similar to PageRank algorithm). 
+ clickThru (A score of the number of document click through rate by end-users, for the given qid).



## How to Run
The XGBoost script used to train, test and validate the LambdaMart Learning-to-Rank model is also attached.  The attached dataset and code were used to perform correlation and ranking performance tests.  To reproduce, simply download the code (python ipynb file) and LTR dataset (txt file).  It was compliled using python 3.


## Acknowledgements
This research was conducted with the financial support of Science Foundation Ireland under Grant Agreement No. 13/RC/2106_P2 at the ADAPT SFI Research Centre at Trinity College Dublin.  ADAPT, the SFI Research Centre for AI-Driven Digital Content Technology, is funded by Science Foundation Ireland through the SFI Research Centres Programme.
