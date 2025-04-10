class MotivationController < ApplicationController
  unloadable
  before_action :require_admin

  def index
    @message = Setting.plugin_motivation_center['message']
  end

  def update
    Setting.plugin_motivation_center = { 'message' => params[:message] }
    flash[:notice] = 'Motivational message updated.'
    redirect_to action: 'index'
  end
end
