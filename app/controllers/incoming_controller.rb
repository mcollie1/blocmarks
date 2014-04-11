class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def index
  end

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    sender = params['sender']
    subject = params['subject']
    body_plain = params["body-plain"]
    user = User.find_by_email(sender)
    id = user.id
    email = user.email

    if user.bookmarks.count > 0 # if user has bookmarks?
      user_bookmarks = user.bookmarks
      titles = user.bookmarks.map { |b| b["title"] }

      if titles.include?(subject)
        user_bookmark = user_bookmarks.find_by_title(subject)
        user_bookmark.urls.create!(url: body_plain, user_id: id)
      else
        new_user_entry = user.bookmarks.create!({ title: subject, url: body_plain })
        new_user_entry.urls.create!(url: body_plain, user_id: id) 
      end 
    else #if bookmarks don't exist yet
      new_entry = user.bookmarks.create!({ title: subject, url: body_plain })
      new_entry.urls.create!(url: body_plain, user_id: id)
    end
    
 
    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    # head 200
  end
end