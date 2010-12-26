class EntrancesController < ApplicationController
  before_filter :authenticate

  respond_to :html, :json, :xml

  def index
    logger.debug current_user.inspect

    respond_to do |format|
      message = "Welcome!"
      format.html { render :text => message }
      format.json { render :json => { :message => message }.to_json }
      format.xml  { render :xml  => { :message => message }.to_xml(:root => 'document') }
      format.csv  { render :text => message }
    end
  end

  def create

    respond_to do |format|
      message = "Created!"
      format.html { render :text => message, :status => :created }
      format.json { render :json => { :message => message }.to_json, :status => :created }
      format.xml  { render :xml  => { :message => message }.to_xml(:root => 'document'), :status => :created }
      format.csv  { render :text => message, :status => :created }
    end
  end
  
end
