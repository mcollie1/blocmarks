class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    sender = params['sender']
    subject = params['subject']
    body_plain = params["body-plain"]
    user = User.find_by_email(sender)
    id = user.id
    email = user.email

    entry = Bookmark.create_with!(title: subject, url: body_plain).find_or_create_by!(user_id: id)
    user_bookmarks = user.bookmarks
    titles = user.bookmarks.map { |b| b["title"] }
    urls = user.urls.map { |u| u["url"] }

    if titles.include?(subject) && urls.exclude?(body_plain)
      user_bookmark = user_bookmarks.find_by_title(subject)
      user_bookmark.urls.create!(url: body_plain, user_id: id)
    elsif titles.include?(subject) && urls.include?(body_plain)
      nil
    else
      entry.urls.create!(url: body_plain) 
    end
    
    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    # head 200
  end
end