
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the (CommunityGrows )?home page$/ then
      '/'
    when /the (CommunityGrows )?dashboard page$/ then
      '/dashboard'
    when /the (CommunityGrows )?admin_dashboard page$/ then
      '/admin'
    when /the (CommunityGrows )?log_in page$/ then
      '/users/sign_in'
    when /the (CommunityGrows )?document repository page$/ then
      fail "Unimplemented"
    when /the (CommunityGrows )?internal affairs committee page$/ then
      '/internal_committee'
    when /the (CommunityGrows )?executive committee page$/ then
      '/executive_committee'
    when /the (CommunityGrows )?external affairs committee page$/ then
      '/external_committee'
    when /the edit user page for "([^"]*)"$/ then
      edit_user_path(User.find_by_email($1).id)

    # "Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
