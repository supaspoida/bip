require File.dirname(__FILE__) + '/../spec_helper'

describe SongsController do
  describe "handling GET /songs" do

    before(:each) do
      @song = mock_model(Song)
      Song.stub!(:find).and_return([@song])
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
  
    it "should find all songs" do
      Song.should_receive(:find).with(:all).and_return([@song])
      do_get
    end
  
    it "should assign the found songs for the view" do
      do_get
      assigns[:songs].should == [@song]
    end
  end

  describe "handling GET /songs.xml" do

    before(:each) do
      @songs = mock("Array of Songs", :to_xml => "XML")
      Song.stub!(:find).and_return(@songs)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all songs" do
      Song.should_receive(:find).with(:all).and_return(@songs)
      do_get
    end
  
    it "should render the found songs as xml" do
      @songs.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /songs/1" do

    before(:each) do
      @song = mock_model(Song)
      Song.stub!(:find).and_return(@song)
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
  
    it "should find the song requested" do
      Song.should_receive(:find).with("1").and_return(@song)
      do_get
    end
  
    it "should assign the found song for the view" do
      do_get
      assigns[:song].should equal(@song)
    end
  end

  describe "handling GET /songs/1.xml" do

    before(:each) do
      @song = mock_model(Song, :to_xml => "XML")
      Song.stub!(:find).and_return(@song)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the song requested" do
      Song.should_receive(:find).with("1").and_return(@song)
      do_get
    end
  
    it "should render the found song as xml" do
      @song.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /songs/new" do

    before(:each) do
      @song = mock_model(Song)
      Song.stub!(:new).and_return(@song)
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
  
    it "should create an new song" do
      Song.should_receive(:new).and_return(@song)
      do_get
    end
  
    it "should not save the new song" do
      @song.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new song for the view" do
      do_get
      assigns[:song].should equal(@song)
    end
  end

  describe "handling GET /songs/1/edit" do

    before(:each) do
      @song = mock_model(Song)
      Song.stub!(:find).and_return(@song)
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
  
    it "should find the song requested" do
      Song.should_receive(:find).and_return(@song)
      do_get
    end
  
    it "should assign the found Song for the view" do
      do_get
      assigns[:song].should equal(@song)
    end
  end

  describe "handling POST /songs" do

    before(:each) do
      @song = mock_model(Song, :to_param => "1")
      Song.stub!(:new).and_return(@song)
    end
    
    describe "with successful save" do
  
      def do_post
        @song.should_receive(:save).and_return(true)
        post :create, :song => {}
      end
  
      it "should create a new song" do
        Song.should_receive(:new).with({}).and_return(@song)
        do_post
      end

      it "should redirect to the new song" do
        do_post
        response.should redirect_to(song_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @song.should_receive(:save).and_return(false)
        post :create, :song => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /songs/1" do

    before(:each) do
      @song = mock_model(Song, :to_param => "1")
      Song.stub!(:find).and_return(@song)
    end
    
    describe "with successful update" do

      def do_put
        @song.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the song requested" do
        Song.should_receive(:find).with("1").and_return(@song)
        do_put
      end

      it "should update the found song" do
        do_put
        assigns(:song).should equal(@song)
      end

      it "should assign the found song for the view" do
        do_put
        assigns(:song).should equal(@song)
      end

      it "should redirect to the song" do
        do_put
        response.should redirect_to(song_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @song.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /songs/1" do

    before(:each) do
      @song = mock_model(Song, :destroy => true)
      Song.stub!(:find).and_return(@song)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the song requested" do
      Song.should_receive(:find).with("1").and_return(@song)
      do_delete
    end
  
    it "should call destroy on the found song" do
      @song.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the songs list" do
      do_delete
      response.should redirect_to(songs_url)
    end
  end
end