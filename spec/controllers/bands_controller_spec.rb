require File.dirname(__FILE__) + '/../spec_helper'

describe BandsController do
  describe "handling GET /bands" do

    before(:each) do
      @band = mock_model(Band)
      Band.stub!(:find).and_return([@band])
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
  
    it "should find all bands" do
      Band.should_receive(:find).with(:all).and_return([@band])
      do_get
    end
  
    it "should assign the found bands for the view" do
      do_get
      assigns[:bands].should == [@band]
    end
  end

  describe "handling GET /bands.xml" do

    before(:each) do
      @bands = mock("Array of Bands", :to_xml => "XML")
      Band.stub!(:find).and_return(@bands)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all bands" do
      Band.should_receive(:find).with(:all).and_return(@bands)
      do_get
    end
  
    it "should render the found bands as xml" do
      @bands.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /bands/1" do

    before(:each) do
      @band = mock_model(Band)
      Band.stub!(:find).and_return(@band)
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
  
    it "should find the band requested" do
      Band.should_receive(:find).with("1").and_return(@band)
      do_get
    end
  
    it "should assign the found band for the view" do
      do_get
      assigns[:band].should equal(@band)
    end
  end

  describe "handling GET /bands/1.xml" do

    before(:each) do
      @band = mock_model(Band, :to_xml => "XML")
      Band.stub!(:find).and_return(@band)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the band requested" do
      Band.should_receive(:find).with("1").and_return(@band)
      do_get
    end
  
    it "should render the found band as xml" do
      @band.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /bands/new" do

    before(:each) do
      @band = mock_model(Band)
      Band.stub!(:new).and_return(@band)
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
  
    it "should create an new band" do
      Band.should_receive(:new).and_return(@band)
      do_get
    end
  
    it "should not save the new band" do
      @band.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new band for the view" do
      do_get
      assigns[:band].should equal(@band)
    end
  end

  describe "handling GET /bands/1/edit" do

    before(:each) do
      @band = mock_model(Band)
      Band.stub!(:find).and_return(@band)
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
  
    it "should find the band requested" do
      Band.should_receive(:find).and_return(@band)
      do_get
    end
  
    it "should assign the found Band for the view" do
      do_get
      assigns[:band].should equal(@band)
    end
  end

  describe "handling POST /bands" do

    before(:each) do
      @band = mock_model(Band, :to_param => "1")
      Band.stub!(:new).and_return(@band)
    end
    
    describe "with successful save" do
  
      def do_post
        @band.should_receive(:save).and_return(true)
        post :create, :band => {}
      end
  
      it "should create a new band" do
        Band.should_receive(:new).with({}).and_return(@band)
        do_post
      end

      it "should redirect to the new band" do
        do_post
        response.should redirect_to(band_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @band.should_receive(:save).and_return(false)
        post :create, :band => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /bands/1" do

    before(:each) do
      @band = mock_model(Band, :to_param => "1")
      Band.stub!(:find).and_return(@band)
    end
    
    describe "with successful update" do

      def do_put
        @band.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the band requested" do
        Band.should_receive(:find).with("1").and_return(@band)
        do_put
      end

      it "should update the found band" do
        do_put
        assigns(:band).should equal(@band)
      end

      it "should assign the found band for the view" do
        do_put
        assigns(:band).should equal(@band)
      end

      it "should redirect to the band" do
        do_put
        response.should redirect_to(band_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @band.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /bands/1" do

    before(:each) do
      @band = mock_model(Band, :destroy => true)
      Band.stub!(:find).and_return(@band)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the band requested" do
      Band.should_receive(:find).with("1").and_return(@band)
      do_delete
    end
  
    it "should call destroy on the found band" do
      @band.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the bands list" do
      do_delete
      response.should redirect_to(bands_url)
    end
  end
end