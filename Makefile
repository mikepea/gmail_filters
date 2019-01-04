.PHONY: yelp

env:
	bundle install

yelp:
	yelp/build.rb > yelp/yelp.xml
