#Author: Zachary McPherson
# The purpose of this file is to define a task which auto deletes
# old events after they are at least one day old.
#
#
# To update cronjob after making changes
# execute the following command:
#
#  whenever --update-crontab
#
# To run the cronjob manually execute the following command
#
# bundle exec rake delete:old_records
#


namespace :delete do
    desc 'Delete old events'
    task :old_records => :environment do
        Event.where('date < ?', (Time.zone.now - 1.days)).each do |event|
            event.destroy
        end
    end
end