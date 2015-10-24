#!/usr/bin/env ruby

require 'rubygems'
require 'gmail-britta'

fs = GmailBritta.filterset(:me => ['Mike.Pountney@gmail.com']) do
  filter {
    has %w{from:asf@boinkor.net}
    label 'from-the-author-of-gmail-britta'
    never_spam
  }
end
puts fs.generate
