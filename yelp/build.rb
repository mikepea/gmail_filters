#!/usr/bin/env ruby

require 'rubygems'
require 'gmail-britta'

fs = GmailBritta.filterset(:me => ['mikepea@yelp.com']) do

  filter {
    has %w{from:asf@boinkor.net}
    label 'from-the-author-of-gmail-britta'
    never_spam
  }

  filter {
    has %w{list:(<engineering.yelp.com>)}
    label 'Eng'
    never_spam
  }

  filter {
    has %w{list:(<engineering.yelp.com>)}
    label 'Lists/engineering'
    never_spam
  }

  filter {
    has %w{list:(<engineering.yelp.com>)}
    label '__TeamInbox'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<caskforce.yelp.com>)}
    label '_Social'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<boardgames.yelp.com>)}
    label '_Social'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:systems+awsspam@yelp.com}
    label 'Systems/awsspam'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:infra-changes@yelp.com}
    label 'infra-changes'
    never_spam
  }

end
puts fs.generate
