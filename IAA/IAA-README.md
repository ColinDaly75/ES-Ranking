# IAA for Enterprise Search
Inter-Annotator Agreement (IAA) in Enterprise Search

# Abstract
Inter Annotator Agreement (IAA) examines agreement among independent observers who
rate, code, or assess the same phenomenon. If consensus in the ratings of a target is low, then
the mean rating may be a misleading or inappropriate summary of the underlying ratings.

IAA uses various metrics to quantify the degree of consensus between two or more coders
who make independent ratings about the features of a set of subjects

In this notebook, I calculate the following Agreement coefficients

    Percentage Agreement
    Cohen's Kappa (three variants)
    Krippendorff's Alpha (thee variants)
    
 
# Methodology
The dataset (attached MS Excel Speadsheet file) used to test the quality of the annotations includes 565 judgements for QD pairs, using two independent expert annotators (judges from within the organisation). The columns are presented with a Likert-scale as follows:-
![fig-proforma](https://github.com/ColinDaly75/IAA/assets/51714656/e8d14914-fc20-4ca8-9a94-59586e2f272c)


# Hypothesis
When building the ENTRP-SRCH dataset, a large portion of annotated documents were
judged by a single rater for a given query. For the 20 query topics in the dataset, the 2544
documents were rated by just 15 raters in total. To verify that this approach was valid,
an experiment was conducted to test the agreement between two independent raters. The
experiment was designed to answer the question whether the annotations in the ENTRP-
SRCH dataset are reliable, given that a large portion of the QD pairs were judged by a single
rater for a given query.


# Results

![image](https://github.com/ColinDaly75/IAA/assets/51714656/7ec7ed2d-3627-48bd-bcb3-4c0dfe7d4074)

Given the variety of metrics, measurement levels and thresholds used to determine accept-
able agreement, the results of any IAA experiment should be interpreted in the context of the
experiment’s design and purpose. The PA score of 84.25% is very high and suggests a high
level of agreement, even if we discount chance agreement. The large number of documents
in our experiment (565 docs) works to minimise the contribution of chance agreement. The
high score may reflect that raters are expert in the field and little guessing is applied to anno-
tations. There is a long-standing debate in the statistics community about whether a Likert
survey represents an ordinal or an interval scale. In our case, the debate is irrelevant, 
as the scores in both cases indicate a positive concordance.

# Conclusion
Regardless of how we interpret the spacing of measurement levels, the calculated ordinal and
interval α scores (0.703 and 0.730 respectively) are both greater than Krippendorff’s mini-
mum requirement of 0.67, above which ‘tentative conclusions’ can be drawn [86]. Similarly,
the ordinal and interval κ scores (0.626 and 0.707 respectively) both fit the interpretation of
‘substantial agreement’ [85]. In conclusion, this IAA experiment shows that the single rater
approach did not adversely impact the integrity of the ENTRP-SRCH datase
