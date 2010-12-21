class EntranceController < ApplicationController
  before_filter :authenticate

  respond_to :html, :json, :xml
  

  def index
    render :text => "Welcome!"
  end
  
end
