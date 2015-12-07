#!/usr/bin/env ruby

require 'rubygems'
require 'gmail-britta'

fs = GmailBritta.filterset(:me => ['Mike.Pountney@gmail.com']) do

  filter {
    has %w{from:asf@boinkor.net}
    label 'from-the-author-of-gmail-britta'
    never_spam
  }

  filter {
    has %w{list:(<brightonhackerspace.googlegroups.com>)}
    label 'Lists/brightonhackerspace'
    never_spam
  }

  filter {
    has %w{list:(<outages.outages.org>)}
    label 'Lists/outages'
    never_spam
  }

  filter {
    has %w{list:(<nanog.nanog.org>)}
    label 'Lists/NANOG'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<london-hack-space.googlegroups.com>)}
    label 'Lists/london-hack-space'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<makerspaceca.googlegroups.com>)}
    label 'Lists/makerspaceca'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<power-racing-series.googlegroups.com>)}
    label 'Lists/power-racing-series'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<notifs.direct.ilovefreegle.org>)}
    label 'Lists/GreenCycleSussex'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<nottinghack.googlegroups.com>)}
    label 'Lists/nottinghack'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<myfordlathes.yahoogroups.com>)}
    label 'Lists/myfordlathes'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<hackspacebristol.lists.aktivix.org>)}
    label 'Lists/hackspacebristol'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<derby-makers.googlegroups.com>)}
    label 'Lists/derby-makers'
    never_spam
  }.archive_unless_directed

end
puts fs.generate
