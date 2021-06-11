class SlackNotifier

  class << self

    def deliver(username: nil, channel: nil, webhook: nil, attachments: nil)
      notifier = Slack::Notifier.new(
        webhook,
        channel: channel,
        username: username
        )
        notifier.post attachments: attachments
    end

    def notifier_job_offer(url: nil, job_header: nil, company_name: nil, host:nil, site_name: nil)
      username = "最新の求人情報"
      channel = ENV['CHANNEL']
      webhook = ENV['WEBHOOK']
      
      attachments = create_attachments(url: url, job_header: job_header, company_name: company_name, host: host, site_name: site_name)
      deliver(username: username, channel: channel, webhook: webhook, attachments: attachments)
    end

    def create_attachments(url: nil, job_header: nil, company_name: nil, host: nil, site_name: nil)
      {
        author_name: site_name,
        author_link: host,
        title: company_name,
        text: "<#{url}|#{job_header}>"
      }
    end

  end
end