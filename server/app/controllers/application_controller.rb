class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :allow_cors

  def allow_cors
  	headers['Access-Control-Allow-Origin'] = '*'
  end
end
