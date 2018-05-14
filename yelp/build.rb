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
    has %w{to:mikepea@yelp.com}
    label '__TO_ME'
    never_spam
  }

  filter {
    has [{:or => %w{
      to:opsman@yelp.com
      cc:opsman@yelp.com
    }}]
    label '__opsman'
    never_spam
  }

  filter {
    has [{:or => %w{
      to:engineering-social-ldn@yelp.com
      cc:engineering-social-ldn@yelp.com
    }}]
    label '_EngSocial'
    never_spam
  }

  filter {
    has [{:and => %w{
      from:operations@yelp.com
      replyto:support@cloudflare.com
      subject:Cloudflare
    }}]
    label 'Cloudflare'
    never_spam
  }

  filter {
    has [{:or => %w{
      to:goats@yelp.com
      cc:goats@yelp.com
    }}]
    label 'Goats'
    never_spam
  }.archive

  filter {
    has [{:and => %w{
      from:docs.google.com
    }}]
    label 'gdocs'
    never_spam
  }

  filter {
    has [{:and => %w{
      from:splunk@yelp.com
    }}]
    label 'Splunk'
    never_spam
  }.archive_unless_directed

  filter {
    has [{:and => %w{
      from:no-reply@ripe.net
    }}]
    label 'RIPE'
    never_spam
  }.archive_unless_directed

  filter {
    has [{:and => %w{
      from:no-reply@ns1.com
    }}]
    label 'NS1'
    never_spam
  }.archive_unless_directed

  filter {
    has [{:and => %w{
      from:no-reply@pagerduty.com
    }}]
    label 'Pagerduty'
    never_spam
  }

  filter {
    has [{:and => %w{
      to:neteng+aaisp@yelp.com
    }}]
    label 'neteng'
    never_spam
  }.archive_unless_directed

  filter {
    has [{:and => %w{
      to:ubuntu-security-announce@lists.ubuntu.com
    }}]
    label 'Vendors/USN'
    never_spam
  }.archive

  filter {
    has [{:or => %w{
      to:engineering-social@yelp.com
      cc:engineering-social@yelp.com
      to:engineering-social-sf@yelp.com
      cc:engineering-social-sf@yelp.com
      to:engineering-social-ham@yelp.com
      cc:engineering-social-ham@yelp.com
    }}]
    label '_EngSocial'
    never_spam
  }.archive_unless_directed

  filter {
    has [{:or => %w{
      from:no-reply+jenkins@yelp.com
    }}]
    label 'Jenkins'
    never_spam
  }.archive_unless_directed

  filter {
    has [{:or => %w{
      to:metrics-standup@yelp.com
      to:distsys-standup@yelp.com
      to:perf-standup@yelp.com
      to:team-releng@yelp.com cc:team-releng@yelp.com
    }}]
    label '_INFRA/_TeamStandups'
    never_spam
  }.archive

  filter {
    has %w{to:operations+s3complete@}
    label 'Systems/s3complete'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{from:operations+diskquota@}
    label 'Systems/other-folks-diskquota'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{from:batch@ list(<operations.yelp.com>)}
    label 'Systems/batch-spam'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{from:batch@ list(<team-operations.yelp.com>)}
    label 'Systems/batch-spam'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{from:batch@ list(<infra.yelp.com>)}
    label 'Systems/batch-spam'
    never_spam
  }.archive_unless_directed

  filter {
    has %w{to:no-reply+jenkins@ list(<inframan.yelp.com>)}
    label 'Systems/jenkins-spam'
    never_spam
  }.archive_unless_directed

  filter {
    has [{:and => %w{
      subject:"Review Request"
    }}]
    label '_reviewboard'
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
    has %w{from:batch@ list:(<inframan.yelp.com>)}
    label 'Systems/inframan-batchspam'
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
    has %w{to:systems+cron@ list:(<operations.yelp.com>)}
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
    has %w{list:(<inframan.yelp.com>) subject:"Your aggregated cProfiles are ready"}
    label 'Inframan/perf-spam'
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
