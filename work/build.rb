#!/usr/bin/env ruby

require 'rubygems'
require 'gmail-britta'

fs = GmailBritta.filterset(:me => ['mpountney@hashicorp.com']) do

  filter {
    has %w{from:asf@boinkor.net}
    label 'from-the-author-of-gmail-britta'
    never_spam
  }

  filter {
    has %w{from:(<notifications@github.com>)}
    label 'github/notifications'
    never_spam
  }

  filter {
    has [{:and => %w{
      from:(<notifications@github.com>)
      subject:[hashicorp/cloud-
    }}]
    label 'github/cloud'
    never_spam
  }

end
puts fs.generate
