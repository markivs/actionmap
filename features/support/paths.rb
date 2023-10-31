# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the representatives\s?page$/
      '/representatives/'
    
    when /^the login\s?page$/
      '/login/'

    when /^the news\s?page$/
      '/representatives/1/news_items/' 
    
    when /^the newnews\s?page$/
      'representatives/1/representatives/1/my_news_item/new/' 
      
    when /^the logout\s?page$/
      '/logout/'

    when /^the profile\s?page$/
      '/user/profile/'

    when /^the events\s?page$/
      '/events/'

    when /^the state\s?page$/
      '/state/AL/'
    
    when /^the add events page$/
      '/my_events/new/'

    when /^the ajax page$/
      '/ajax/state/CA/'
    when /^the news\s?page\s?of\s?(.+)$/
      rep_name = page_name[17..-1]
      rep = Representative.find_by(name: rep_name)
      "/representatives/#{rep.id}/news_items"
    
    when /^the add news page of\s?(.+)$/
      rep_name = page_name[21..-1]
      rep = Representative.find_by(name: rep_name)
      "/representatives/#{rep.id}/representatives/#{rep.id}/my_news_item/new"
    # Add more mappings here.
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
