class ApplicationController < ActionController::Base

  include Hogar

  protect_from_forgery with: :exception, prepend: true

  before_action :authenticate_user!



end
