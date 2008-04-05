require File.dirname(__FILE__) + '/../spec_helper'

describe AppearancesController do
  describe "handling GET /appearances" do

    before(:each) do
      @appearance = mock_model(Appearance)
      Appearance.stub!(:find).and_return([@appearance])
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
  
    it "should find all appearances" do
      Appearance.should_receive(:find).with(:all).and_return([@appearance])
      do_get
    end
  
    it "should assign the found appearances for the view" do
      do_get
      assigns[:appearances].should == [@appearance]
    end
  end

  describe "handling GET /appearances.xml" do

    before(:each) do
      @appearances = mock("Array of Appearances", :to_xml => "XML")
      Appearance.stub!(:find).and_return(@appearances)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all appearances" do
      Appearance.should_receive(:find).with(:all).and_return(@appearances)
      do_get
    end
  
    it "should render the found appearances as xml" do
      @appearances.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /appearances/1" do

    before(:each) do
      @appearance = mock_model(Appearance)
      Appearance.stub!(:find).and_return(@appearance)
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
  
    it "should find the appearance requested" do
      Appearance.should_receive(:find).with("1").and_return(@appearance)
      do_get
    end
  
    it "should assign the found appearance for the view" do
      do_get
      assigns[:appearance].should equal(@appearance)
    end
  end

  describe "handling GET /appearances/1.xml" do

    before(:each) do
      @appearance = mock_model(Appearance, :to_xml => "XML")
      Appearance.stub!(:find).and_return(@appearance)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the appearance requested" do
      Appearance.should_receive(:find).with("1").and_return(@appearance)
      do_get
    end
  
    it "should render the found appearance as xml" do
      @appearance.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /appearances/new" do

    before(:each) do
      @appearance = mock_model(Appearance)
      Appearance.stub!(:new).and_return(@appearance)
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
  
    it "should create an new appearance" do
      Appearance.should_receive(:new).and_return(@appearance)
      do_get
    end
  
    it "should not save the new appearance" do
      @appearance.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new appearance for the view" do
      do_get
      assigns[:appearance].should equal(@appearance)
    end
  end

  describe "handling GET /appearances/1/edit" do

    before(:each) do
      @appearance = mock_model(Appearance)
      Appearance.stub!(:find).and_return(@appearance)
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
  
    it "should find the appearance requested" do
      Appearance.should_receive(:find).and_return(@appearance)
      do_get
    end
  
    it "should assign the found Appearance for the view" do
      do_get
      assigns[:appearance].should equal(@appearance)
    end
  end

  describe "handling POST /appearances" do

    before(:each) do
      @appearance = mock_model(Appearance, :to_param => "1")
      Appearance.stub!(:new).and_return(@appearance)
    end
    
    describe "with successful save" do
  
      def do_post
        @appearance.should_receive(:save).and_return(true)
        post :create, :appearance => {}
      end
  
      it "should create a new appearance" do
        Appearance.should_receive(:new).with({}).and_return(@appearance)
        do_post
      end

      it "should redirect to the new appearance" do
        do_post
        response.should redirect_to(appearance_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @appearance.should_receive(:save).and_return(false)
        post :create, :appearance => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /appearances/1" do

    before(:each) do
      @appearance = mock_model(Appearance, :to_param => "1")
      Appearance.stub!(:find).and_return(@appearance)
    end
    
    describe "with successful update" do

      def do_put
        @appearance.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the appearance requested" do
        Appearance.should_receive(:find).with("1").and_return(@appearance)
        do_put
      end

      it "should update the found appearance" do
        do_put
        assigns(:appearance).should equal(@appearance)
      end

      it "should assign the found appearance for the view" do
        do_put
        assigns(:appearance).should equal(@appearance)
      end

      it "should redirect to the appearance" do
        do_put
        response.should redirect_to(appearance_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @appearance.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /appearances/1" do

    before(:each) do
      @appearance = mock_model(Appearance, :destroy => true)
      Appearance.stub!(:find).and_return(@appearance)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the appearance requested" do
      Appearance.should_receive(:find).with("1").and_return(@appearance)
      do_delete
    end
  
    it "should call destroy on the found appearance" do
      @appearance.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the appearances list" do
      do_delete
      response.should redirect_to(appearances_url)
    end
  end
end