require File.dirname(__FILE__) + '/../spec_helper'

describe AttendancesController do
  describe "handling GET /attendances" do

    before(:each) do
      @attendance = mock_model(Attendance)
      Attendance.stub!(:find).and_return([@attendance])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all attendances" do
      Attendance.should_receive(:find).with(:all).and_return([@attendance])
      do_get
    end
  
    it "should assign the found attendances for the view" do
      do_get
      assigns[:attendances].should == [@attendance]
    end
  end

  describe "handling GET /attendances.xml" do

    before(:each) do
      @attendances = mock("Array of Attendances", :to_xml => "XML")
      Attendance.stub!(:find).and_return(@attendances)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all attendances" do
      Attendance.should_receive(:find).with(:all).and_return(@attendances)
      do_get
    end
  
    it "should render the found attendances as xml" do
      @attendances.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /attendances/1" do

    before(:each) do
      @attendance = mock_model(Attendance)
      Attendance.stub!(:find).and_return(@attendance)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the attendance requested" do
      Attendance.should_receive(:find).with("1").and_return(@attendance)
      do_get
    end
  
    it "should assign the found attendance for the view" do
      do_get
      assigns[:attendance].should equal(@attendance)
    end
  end

  describe "handling GET /attendances/1.xml" do

    before(:each) do
      @attendance = mock_model(Attendance, :to_xml => "XML")
      Attendance.stub!(:find).and_return(@attendance)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the attendance requested" do
      Attendance.should_receive(:find).with("1").and_return(@attendance)
      do_get
    end
  
    it "should render the found attendance as xml" do
      @attendance.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /attendances/new" do

    before(:each) do
      @attendance = mock_model(Attendance)
      Attendance.stub!(:new).and_return(@attendance)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new attendance" do
      Attendance.should_receive(:new).and_return(@attendance)
      do_get
    end
  
    it "should not save the new attendance" do
      @attendance.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new attendance for the view" do
      do_get
      assigns[:attendance].should equal(@attendance)
    end
  end

  describe "handling GET /attendances/1/edit" do

    before(:each) do
      @attendance = mock_model(Attendance)
      Attendance.stub!(:find).and_return(@attendance)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the attendance requested" do
      Attendance.should_receive(:find).and_return(@attendance)
      do_get
    end
  
    it "should assign the found Attendance for the view" do
      do_get
      assigns[:attendance].should equal(@attendance)
    end
  end

  describe "handling POST /attendances" do

    before(:each) do
      @attendance = mock_model(Attendance, :to_param => "1")
      Attendance.stub!(:new).and_return(@attendance)
    end
    
    describe "with successful save" do
  
      def do_post
        @attendance.should_receive(:save).and_return(true)
        post :create, :attendance => {}
      end
  
      it "should create a new attendance" do
        Attendance.should_receive(:new).with({}).and_return(@attendance)
        do_post
      end

      it "should redirect to the new attendance" do
        do_post
        response.should redirect_to(attendance_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @attendance.should_receive(:save).and_return(false)
        post :create, :attendance => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /attendances/1" do

    before(:each) do
      @attendance = mock_model(Attendance, :to_param => "1")
      Attendance.stub!(:find).and_return(@attendance)
    end
    
    describe "with successful update" do

      def do_put
        @attendance.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the attendance requested" do
        Attendance.should_receive(:find).with("1").and_return(@attendance)
        do_put
      end

      it "should update the found attendance" do
        do_put
        assigns(:attendance).should equal(@attendance)
      end

      it "should assign the found attendance for the view" do
        do_put
        assigns(:attendance).should equal(@attendance)
      end

      it "should redirect to the attendance" do
        do_put
        response.should redirect_to(attendance_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @attendance.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /attendances/1" do

    before(:each) do
      @attendance = mock_model(Attendance, :destroy => true)
      Attendance.stub!(:find).and_return(@attendance)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the attendance requested" do
      Attendance.should_receive(:find).with("1").and_return(@attendance)
      do_delete
    end
  
    it "should call destroy on the found attendance" do
      @attendance.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the attendances list" do
      do_delete
      response.should redirect_to(attendances_url)
    end
  end
end