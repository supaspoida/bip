class <%= controller_class_name %>Controller < ApplicationController
  make_resourceful do
    actions :all
  end
  
  before_filter :cancel_to_index, :only => [:create, :update]

private
  def cancel_to_index
    redirect_to :action => :index if params[:cancel]
  end
end
