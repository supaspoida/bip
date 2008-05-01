require File.dirname(__FILE__) + '/../spec_helper'

describe SetlistsController do
  include SpecResourceful::SpecHelpers::Controllers
  
  before(:each) do
    @setlist, @setlists = mock_resourceful!(Setlist)
  end
  
  describe "GET :index" do
  
    def do_get
      get :index, params
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
  
    it "should assign the found setlists for the view" do
      do_get
      assigns[:setlists].should == @setlists
    end
  end

  describe "GET :show" do
  
    def do_get
      get :show, params.merge(:id => @setlist.id)
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end

  
    it "should assign the found setlist for the view" do
      do_get
      assigns[:setlist].should equal(@setlist)
    end
  end

  describe "GET :new" do
    
    before(:each) do
      login
      @user.setlists.stub!(:new).and_return(@setlist)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render the form template" do
      do_get
      response.should render_template(:form)
    end
  
    it "should assign the new setlist for the view" do
      do_get
      assigns[:setlist].should == @setlist
    end
  end

  describe "GET :edit" do

    before(:each) do
      login
      params[:id] = @setlist.id
    end
  
    def do_get
      get :edit, params
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template(:form)
    end
  
    it "should assign the found Setlist for the view" do
      do_get
      assigns[:setlist].should equal(@setlist)
    end
  end

  describe "handling POST /setlists" do

    before(:each) do
      login
      @user.setlists.stub!(:new).and_return(@setlist)
      @setlist.stub!(:save).and_return(true)
    end
    
    describe "with successful save" do
  
      def do_post
        @setlist.should_receive(:save).and_return(true)
        post :create, params
      end
  
      it "should create a new setlist" do
        lambda do
          @setlist.should_receive(:save).and_return(true)
          post :create, :setlist => {}
        end.should change(Setlist, :count).by(1)
      end

      it "should redirect to the new setlist" do
        do_post
        response.should redirect_to(setlist_path(@setlist))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @setlist.should_receive(:save).and_return(false)
        post :create, :setlist => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template(:form)
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
  
  def create_setlist(options = {})
    post :create, :setlist => { :appearance_id => 1, :user_id => 1, :performances_count => 0, :approved => 1}.merge(options)
  end
end