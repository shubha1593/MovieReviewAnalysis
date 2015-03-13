## Build feature vector

import re
from SG_Utilities import *
import os
import fnmatch

## Returns a list of all reviews each as a separate string 
def getReviews() :
	reviews = []
	for dirpath, subdirs, files in os.walk('Data') :
		for filename in fnmatch.filter(files, '*.txt') :
			filenamePath = os.path.join(dirpath, filename)
			with open(filenamePath, 'r') as f :
				fileContent = readFileInString(filenamePath)
				reviews.append(fileContent)

	writeListToFile('Output/reviewsList.txt', reviews)
	return reviews

#getReviews()
#fileContents = readFileInString('Data/Tweets.txt')

# Extract tweets using regex.
#tweets = re.findall('\+0000 2014\t(.*)\t.*\t.*\t<a href', fileContents)
#writeListToFile('Data/extractedTweets.txt', tweets)

# Remove duplicate tweets. 
#uniqueTweets = list(set(tweets))
#writeListToFile('Data/uniqueTweets.txt', uniqueTweets)
