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
    @user = User.find_by_email(sender)

    #if @user.exists?
    @user.bookmarks.create!({ title: subject, url: body_plain })
    #else
      #nil
    #end

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    # head 200
  end
end