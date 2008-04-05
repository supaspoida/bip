require File.dirname(__FILE__) + '/../spec_helper'

describe PerformancesController do
  describe "handling GET /performances" do

    before(:each) do
      @performance = mock_model(Performance)
      Performance.stub!(:find).and_return([@performance])
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
  
    it "should find all performances" do
      Performance.should_receive(:find).with(:all).and_return([@performance])
      do_get
    end
  
    it "should assign the found performances for the view" do
      do_get
      assigns[:performances].should == [@performance]
    end
  end

  describe "handling GET /performances.xml" do

    before(:each) do
      @performances = mock("Array of Performances", :to_xml => "XML")
      Performance.stub!(:find).and_return(@performances)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all performances" do
      Performance.should_receive(:find).with(:all).and_return(@performances)
      do_get
    end
  
    it "should render the found performances as xml" do
      @performances.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /performances/1" do

    before(:each) do
      @performance = mock_model(Performance)
      Performance.stub!(:find).and_return(@performance)
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
  
    it "should find the performance requested" do
      Performance.should_receive(:find).with("1").and_return(@performance)
      do_get
    end
  
    it "should assign the found performance for the view" do
      do_get
      assigns[:performance].should equal(@performance)
    end
  end

  describe "handling GET /performances/1.xml" do

    before(:each) do
      @performance = mock_model(Performance, :to_xml => "XML")
      Performance.stub!(:find).and_return(@performance)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the performance requested" do
      Performance.should_receive(:find).with("1").and_return(@performance)
      do_get
    end
  
    it "should render the found performance as xml" do
      @performance.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /performances/new" do

    before(:each) do
      @performance = mock_model(Performance)
      Performance.stub!(:new).and_return(@performance)
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
  
    it "should create an new performance" do
      Performance.should_receive(:new).and_return(@performance)
      do_get
    end
  
    it "should not save the new performance" do
      @performance.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new performance for the view" do
      do_get
      assigns[:performance].should equal(@performance)
    end
  end

  describe "handling GET /performances/1/edit" do

    before(:each) do
      @performance = mock_model(Performance)
      Performance.stub!(:find).and_return(@performance)
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
  
    it "should find the performance requested" do
      Performance.should_receive(:find).and_return(@performance)
      do_get
    end
  
    it "should assign the found Performance for the view" do
      do_get
      assigns[:performance].should equal(@performance)
    end
  end

  describe "handling POST /performances" do

    before(:each) do
      @performance = mock_model(Performance, :to_param => "1")
      Performance.stub!(:new).and_return(@performance)
    end
    
    describe "with successful save" do
  
      def do_post
        @performance.should_receive(:save).and_return(true)
        post :create, :performance => {}
      end
  
      it "should create a new performance" do
        Performance.should_receive(:new).with({}).and_return(@performance)
        do_post
      end

      it "should redirect to the new performance" do
        do_post
        response.should redirect_to(performance_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @performance.should_receive(:save).and_return(false)
        post :create, :performance => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /performances/1" do

    before(:each) do
      @performance = mock_model(Performance, :to_param => "1")
      Performance.stub!(:find).and_return(@performance)
    end
    
    describe "with successful update" do

      def do_put
        @performance.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the performance requested" do
        Performance.should_receive(:find).with("1").and_return(@performance)
        do_put
      end

      it "should update the found performance" do
        do_put
        assigns(:performance).should equal(@performance)
      end

      it "should assign the found performance for the view" do
        do_put
        assigns(:performance).should equal(@performance)
      end

      it "should redirect to the performance" do
        do_put
        response.should redirect_to(performance_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @performance.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /performances/1" do

    before(:each) do
      @performance = mock_model(Performance, :destroy => true)
      Performance.stub!(:find).and_return(@performance)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the performance requested" do
      Performance.should_receive(:find).with("1").and_return(@performance)
      do_delete
    end
  
    it "should call destroy on the found performance" do
      @performance.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the performances list" do
      do_delete
      response.should redirect_to(performances_url)
    end
  end
end