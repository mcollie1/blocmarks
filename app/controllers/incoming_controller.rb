class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def index
  end

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    #@sender = Incoming.new(params["from"])
    #@sender.save
    #@body = Incoming.new(params["body-plain"])
    #@body.save

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 

    #@subject = JSON.parse(params["subject"])
    #@sender = JSON.parse(params["from"])
    #@body = JSON.parse(params["body_plain"])
    # head 200
  end
end