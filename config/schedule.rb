set :output, 'log/crontab.log'
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env

every 1.day, :at => '8:00 am' do
  runner "Crawling.new.run"
end

