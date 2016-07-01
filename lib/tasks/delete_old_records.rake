#Author: Zachary McPherson
# The purpose of this file is to define a task which auto deletes
# old events after they are at least one day old.


namespace :delete do
    desc 'Delete old events'
    task :old_records => :environment do
        Event.where('date < ?', Time.now.to_date).each do |event|
            event.destroy
        end
    end
end