class AttendancesController < ApplicationController
  before_filter :login_required, :only => :create
  
  make_resourceful do
    actions :all
    belongs_to :show, :user
  end
  
  def build_object
    @current_object ||= current_user.attendances.build(:show_id => params[:show_id])
  end
  
end
