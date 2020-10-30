#
# config/initializers/scheduler.rb
require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton

# Awesome recurrent task...
#
s.every '7d' do
#   Request.where(['created_at' < '?', 7.days.ago]).destroy_all
    puts "RRR:     #{Request.all}"
    Rails.logger.info "hello, it's #{Time.now}"
end
