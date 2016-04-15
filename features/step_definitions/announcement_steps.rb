# By Tony. Steps needed for user testing

Given /an announcement is made with "([^"]*)" as title and "([^"]*)" as url$/ do |title, url|
  fail "Unimplemented"
end


Given /the following announcements exist/ do |announcement_table|
    Announcement.delete_all
    announcement_table.hashes.each do |announcement|
        Announcement.create!(announcement)
    end
end