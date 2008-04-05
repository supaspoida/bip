require File.dirname(__FILE__) + '/../spec_helper'

describe SetlistsController do
  describe "handling GET /setlists" do

    before(:each) do
      @setlist = mock_model(Setlist)
      Setlist.stub!(:find).and_return([@setlist])
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
  
    it "should find all setlists" do
      Setlist.should_receive(:find).with(:all).and_return([@setlist])
      do_get
    end
  
    it "should assign the found setlists for the view" do
      do_get
      assigns[:setlists].should == [@setlist]
    end
  end

  describe "handling GET /setlists.xml" do

    before(:each) do
      @setlists = mock("Array of Setlists", :to_xml => "XML")
      Setlist.stub!(:find).and_return(@setlists)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all setlists" do
      Setlist.should_receive(:find).with(:all).and_return(@setlists)
      do_get
    end
  
    it "should render the found setlists as xml" do
      @setlists.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /setlists/1" do

    before(:each) do
      @setlist = mock_model(Setlist)
      Setlist.stub!(:find).and_return(@setlist)
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
  
    it "should find the setlist requested" do
      Setlist.should_receive(:find).with("1").and_return(@setlist)
      do_get
    end
  
    it "should assign the found setlist for the view" do
      do_get
      assigns[:setlist].should equal(@setlist)
    end
  end

  describe "handling GET /setlists/1.xml" do

    before(:each) do
      @setlist = mock_model(Setlist, :to_xml => "XML")
      Setlist.stub!(:find).and_return(@setlist)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the setlist requested" do
      Setlist.should_receive(:find).with("1").and_return(@setlist)
      do_get
    end
  
    it "should render the found setlist as xml" do
      @setlist.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /setlists/new" do

    before(:each) do
      @setlist = mock_model(Setlist)
      Setlist.stub!(:new).and_return(@setlist)
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
  
    it "should create an new setlist" do
      Setlist.should_receive(:new).and_return(@setlist)
      do_get
    end
  
    it "should not save the new setlist" do
      @setlist.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new setlist for the view" do
      do_get
      assigns[:setlist].should equal(@setlist)
    end
  end

  describe "handling GET /setlists/1/edit" do

    before(:each) do
      @setlist = mock_model(Setlist)
      Setlist.stub!(:find).and_return(@setlist)
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
  
    it "should find the setlist requested" do
      Setlist.should_receive(:find).and_return(@setlist)
      do_get
    end
  
    it "should assign the found Setlist for the view" do
      do_get
      assigns[:setlist].should equal(@setlist)
    end
  end

  describe "handling POST /setlists" do

    before(:each) do
      @setlist = mock_model(Setlist, :to_param => "1")
      Setlist.stub!(:new).and_return(@setlist)
    end
    
    describe "with successful save" do
  
      def do_post
        @setlist.should_receive(:save).and_return(true)
        post :create, :setlist => {}
      end
  
      it "should create a new setlist" do
        Setlist.should_receive(:new).with({}).and_return(@setlist)
        do_post
      end

      it "should redirect to the new setlist" do
        do_post
        response.should redirect_to(setlist_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @setlist.should_receive(:save).and_return(false)
        post :create, :setlist => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /setlists/1" do

    before(:each) do
      @setlist = mock_model(Setlist, :to_param => "1")
      Setlist.stub!(:find).and_return(@setlist)
    end
    
    describe "with successful update" do

      def do_put
        @setlist.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the setlist requested" do
        Setlist.should_receive(:find).with("1").and_return(@setlist)
        do_put
      end

      it "should update the found setlist" do
        do_put
        assigns(:setlist).should equal(@setlist)
      end

      it "should assign the found setlist for the view" do
        do_put
        assigns(:setlist).should equal(@setlist)
      end

      it "should redirect to the setlist" do
        do_put
        response.should redirect_to(setlist_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @setlist.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /setlists/1" do

    before(:each) do
      @setlist = mock_model(Setlist, :destroy => true)
      Setlist.stub!(:find).and_return(@setlist)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the setlist requested" do
      Setlist.should_receive(:find).with("1").and_return(@setlist)
      do_delete
    end
  
    it "should call destroy on the found setlist" do
      @setlist.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the setlists list" do
      do_delete
      response.should redirect_to(setlists_url)
    end
  end
end