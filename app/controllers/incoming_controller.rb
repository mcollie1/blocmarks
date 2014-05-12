class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    sender = params['sender']
    subject = params['subject']
    body_plain = params["body-plain"]
    user = User.find_by_email(sender)
    id = user.id

    entry = Bookmark.find_or_create_by!(user_id: id, title: subject)
    urls = entry.urls.map { |u| u["url"] }

    if urls.exclude?(body_plain)
      user_bookmark = user_bookmarks.find_by_title(subject)
      user_bookmark.urls.create!(url: body_plain, user_id: id)
    elsif !urls.include?(body_plain)
      entry.urls.create!(url: body_plain) 
    end
    
    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    # head 200
  end
end