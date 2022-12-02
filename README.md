# ES-Ranking

-----------------------------------------------------------------------------------

Contact: Obscured  dalyc24@tcd.ie

-----------------------------------------------------------------------------------

# Keywords: Enterprise Search Ranking, Corpus, Datasets and Code

This repository was cited in the paper **"LEARNING TO RANK: PERFORMANCE AND PRACTICAL BARRIERS TO DEPLOYMENT IN ENTERPRISE SEARCH"** in the 12TH International Conference on Industrial Technology and Management (Cambridge, ICITM 2023)

# Dataset
We generate and publish a small manually annotated LTR dataset (ENTRP-SRCH.txt) that includes both kinds of feedback as well as a number of features used for learning to rank.  The LTR dataset is formatted as follows: -
![LETOR_format_diagram-with-clickthroughrate](https://user-images.githubusercontent.com/51714656/184387570-87e33de2-a985-4d8f-8a71-4cd7f43bb87a.png)The dataset is named ENTRP-SRCH and is in LETOR format.  



# How to Run
The XGBoost script used to train, test and validate the LambdaMart Learning-to-Rank model is also attached.  The attached dataset and code were used to perform correlation and ranking performance tests.  To reproduce, simply download the code (python ipynb file) and LTR dataset (txt file).  It was compliled using python 3.


# Acknowledgements
This research was conducted with the financial support of Science Foundation Ireland under Grant Agreement No. 13/RC/2106_P2 at the ADAPT SFI Research Centre at Trinity College Dublin.  ADAPT, the SFI Research Centre for AI-Driven Digital Content Technology, is funded by Science Foundation Ireland through the SFI Research Centres Programme.
