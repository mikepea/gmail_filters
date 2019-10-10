.PHONY: work

all: home work

env:
	bundle install

home:
	home/build.rb > home.xml

work:
	work/build.rb > work.xml
