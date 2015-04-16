import re
import itertools
from SG_Utilities import *
from SG_PreprocessReviews import *

def replaceTwoOrMore(word):
	#look for 2 or more repetitions of character and replace with the character itself
	pattern = re.compile(r"(.)\1{1,}", re.DOTALL)
	return pattern.sub(r"\1\1", word)

def getStopWordList(filename):
	#read the stopWords file and build a list
	stopWords = readFileInList(filename, '\n')
	stopWords.append('AT_USER')
	stopWords.append('URL')
	return stopWords

def getFeatures (review, stopWords):
	features = []
	#split tweet into words
	words = review.split()
	for w in words:
		#replace two or more with two occurrences
		w = replaceTwoOrMore(w)
		#strip punctuation
		w = w.strip('\'\"?,\.-!:')
		#strip numbers at the end
		w = w.strip('0123456789')
		#check if the word starts with an alphabet
		val = re.search(r"^[a-zA-Z][a-zA-Z0-9]*$", w)
		#ignore if it is a stop word
		if(w in stopWords or val is None):
			continue
		else:
			features.append(w.lower())
	return features

def getReviewsFeatures(reviews) :
	reviewsFeatures = []
	stopWords = getStopWordList('Input/stopwords.txt')
	for review in reviews:
		features = getFeatures(review, stopWords)
		reviewsFeatures.append(features)

	return reviewsFeatures



def buildFeatureVector() :
	validWords = getWordDict()
	validWordsList = validWords.keys()
	#featureVector = list(set(reviewsWordList) & set(validWordsList))
	featureVector = validWordsList
	
	return featureVector


def getFeatureMatrix(reviewsFeatures, featureVector) :
	featureMatrix = []
	for reviewFeature in reviewsFeatures :
		reviewVector = [] 
		for word in featureVector :
			#reviewVector.append(reviewFeature.count(word))
			if word in reviewFeature :
				reviewVector.append(1)
			else : 
				reviewVector.append(0)
		featureMatrix.append(reviewVector)

	return featureMatrix


def featureMatrixFromReviews() :
	#Read the reviews one by one and process it
	reviews = getPreprocessedReviews()

	reviewsFeatures = getReviewsFeatures(reviews)
	writeListToFile('Output/ReviewsFeatures.txt', reviewsFeatures)

	featureVector = buildFeatureVector()
	writeListToFile('Output/FeatureVector.txt', featureVector)

	featureMatrix = getFeatureMatrix(reviewsFeatures, featureVector)
	writeListToFile('Output/FeatureMatrix.txt', featureMatrix)

	return featureMatrix
