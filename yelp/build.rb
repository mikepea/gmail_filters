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
    has %w{from:operations+diskquota@}
    label 'Systems/other-folks-diskquota'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<inframan.yelp.com>) subject:"Review Request"}
    label '_INFRA/non-ops-reviewboards'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{from:sensu@ list:(<inframan.yelp.com>)}
    label 'Systems/inframan-alerts'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{from:root@ list:(<inframan.yelp.com>)}
    label 'Systems/inframan-rootspam'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:root@ subject:fcron}
    label 'Systems/cronjunk'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:systems@ subject:Cron}
    label 'Systems/cronjunk'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:root@ subject:Cron}
    label 'Systems/cronjunk'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{list:(<operations.yelp.com>) to:root@}
    label 'Systems/rootjunk'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:batch+sfo2@yelp.com}
    label 'Systems/tron/prod'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:batch+stage@yelp.com}
    label 'Systems/tron/stage'
    never_spam
  }.archive_unless_directed

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
