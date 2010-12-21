class EntrancesController < ApplicationController
  before_filter :authenticate

  respond_to :html, :json, :xml

  use ClearanceHttpAuth::Middleware

  def current_user
    env['current_user'] || @_current_user || user_from_cookie
  end

  def index
    logger.debug current_user.inspect
    respond_to do |format|
      format.html { render :text => "Welcome!" }
      format.json { render :json => { :message => 'Welcome!' }.to_json }
      format.xml  { render :xml  => { :message => 'Welcome!' }.to_xml(:root => 'document') }
    end
    
  end
  
end
