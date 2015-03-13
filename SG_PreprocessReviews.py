import re
from SG_Utilities import *
from SG_ExtractReviews import *

#start process_tweet
def processReview (review):
    # process the tweets
 
    #Convert to lower case
    review = review.lower()
    #Convert www.* or https?://* to URL
    review = re.sub('((www\.[\s]+)|(https?://[^\s]+))','URL', review)
    #Convert @username to AT_USER
    review = re.sub('@[^\s]+','AT_USER', review)
    #Remove additional white spaces
    review = re.sub('[\s]+', ' ', review)
    #Replace #word with word
    review = re.sub(r'#([^\s]+)', r'\1', review)
    #trim
    review = review.strip('\'"')
    return review
 
#Read the tweets one by one and process it



def getPreprocessedReviews() :
    reviews = getReviews()

    processedReviews = []
    for review in reviews:
        processedReview = processReview(review)
        processedReviews.append(processedReview)

    writeListToFile('Output/preprocessedReviews.txt', processedReviews)
    return processedReviews



#getPreprocessedReviews()