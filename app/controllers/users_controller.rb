class UsersController < ApplicationController

  def new
    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :page => "signup" }
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end

end