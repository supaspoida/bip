require File.dirname(__FILE__) + '/../spec_helper'

describe AttendancesController do
  include SpecResourceful::SpecHelpers::Controllers
  
  before(:each) do
    @attendance, @attendances = mock_resourceful!(Attendance)
  end
  
  describe "GET :index" do
    it "should assign @attendances" do
      get :index, params
      assigns[:attendances].should == @attendances
    end
    
    it "should render the index template" do
      get :index, params
      response.should render_template(:index)
    end
  end

  describe "GET :show" do
    it "should assign @attendance" do
      get :show, params.merge(:id => @attendance.id)
      assigns[:attendance].should == @attendance
    end
    
    it "should render the show template" do
      get :show, params.merge(:id => @attendance.id)
      response.should render_template(:show)
    end
  end
 
  describe "GET :new" do
    it "should assign @attendance" do
      get :new, params
      assigns[:attendance].should == @attendance
    end
    
    it "should render the form template" do
      get :new, params
      response.should render_template(:form)
    end
  end
     
  describe "POST :create" do
    describe "when successful" do
      before(:each) do
        login
        controller.should_receive(:current_user).and_return(@user)
        @attendance.stub!(:save).and_return(true)
        params = { :show_id => "1" }
      end
      
      it "should build an attendance" do
        pending "what?"
        @user.attendances.should_receive(:build).with(:show_id => params[:show_id])
        post :create, params
      end
   
      it "should save the attendance" do
        @attendance.should_receive(:save).and_return(true)
        post :create, params
      end
  
      it "should redirect to the show action" do
        post :create, params
        response.should redirect_to(attendance_url(@attendance))
      end
    end
=begin    
    describe "when unsuccessful" do
      before(:each) do
        @attendance.stub!(:save).and_return(false)
      end
      
      it "should assign @attendance" do
        post :create, params
        assigns[:attendance].should == @attendance
      end
      
      it "should render the form template" do
        post :create, params
        response.should render_template(:form)
      end
    end

    describe "when cancelled" do
      before(:each) do
        params[:cancel] = "Cancel"
      end
      
      it "should not save the attendance" do
        @attendance.should_not_receive(:save)
        post :create, params
      end
      
      it "should redirect to index action" do
        post :create, params
        response.should redirect_to(attendances_url)
      end
    end
=end
  end
=begin
  describe "GET :edit" do
    before(:each) do
      params[:id] = @attendance.id
    end

    it "should assign @attendance" do
      get :edit, params
      assigns[:attendance].should == @attendance
    end
    
    it "should render the form template" do
      get :edit, params
      response.should render_template(:form)
    end
  end
  
  describe "PUT :update" do
    before(:each) do
      params[:id] = @attendance.id
    end

    describe "when successful" do
      before(:each) do
        @attendance.stub!(:update_attributes).and_return(true)
      end
      
      it "should update the attendance's attributes" do
        @attendance.should_receive(:update_attributes).and_return(true)
        put :update, params
      end
      
      it "should redirect to the show action" do
        put :update, params
        response.should redirect_to(attendance_url(@attendance))
      end
    end
    
    describe "when unsuccessful" do
      before(:each) do
        @attendance.stub!(:update_attributes).and_return(false)
      end
      
      it "should assign @attendance" do
        put :update, params
        assigns[:attendance].should == @attendance
      end
      
      it "should render the form template" do
        put :update, params
        response.should render_template(:form)
      end
    end

    describe "when cancelled" do
      before(:each) do
        params[:cancel] = "Cancel"
      end
      
      it "should not update the attendance" do
        @attendance.should_not_receive(:update_attributes)
        put :update, params
      end
      
      it "should redirect to index action" do
        put :update, params
        response.should redirect_to(attendances_url)
      end
    end
  end
  
  describe "DELETE :destroy" do
    before(:each) do
      params[:id] = @attendance.id
    end

    describe "when successful" do
      before(:each) do
        @attendance.stub!(:destroy).and_return(true)
      end
    
      it "should destroy the @attendance" do
        @attendance.should_receive(:destroy).and_return(true)
        delete :destroy, params
      end
    
      it "should redirect to index action" do
        delete :destroy, params
        response.should redirect_to(attendances_url)
      end
    end
    
    describe "when unsuccessful" do
      before(:each) do
        @attendance.stub!(:destroy).and_return(false)
        @request.env["HTTP_REFERER"] = "http://test.host/attendance/referer"
      end
      
      it "should assign @attendance" do
        delete :destroy, params
        assigns[:attendance].should == @attendance
      end
      
      it "should redirect to its referer" do
        delete :destroy, params
        response.should redirect_to("http://test.host/attendance/referer")
      end
    end
  end
=end
end