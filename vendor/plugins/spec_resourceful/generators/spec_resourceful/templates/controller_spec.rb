require File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../spec_helper'

describe <%= controller_class_name %>Controller do
  include SpecResourceful::SpecHelpers::Controllers
  
  before(:each) do
    @<%= singular_name %>, @<%= plural_name %> = mock_resourceful!(<%= class_name %>)
  end
  
  describe "GET :index" do
    it "should assign @<%= plural_name %>" do
      get :index, params
      assigns[:<%= plural_name %>].should == @<%= plural_name %>
    end
    
    it "should render the index template" do
      get :index, params
      response.should render_template(:index)
    end
  end
  
  describe "GET :show" do
    it "should assign @<%= singular_name %>" do
      get :show, params.merge(:id => @<%= singular_name %>.id)
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
    
    it "should render the show template" do
      get :show, params.merge(:id => @<%= singular_name %>.id)
      response.should render_template(:show)
    end
  end
  
  describe "GET :new" do
    it "should assign @<%= singular_name %>" do
      get :new, params
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
    
    it "should render the form template" do
      get :new, params
      response.should render_template(:form)
    end
  end
  
  describe "POST :create" do
    describe "when successful" do
      before(:each) do
        @<%= singular_name %>.stub!(:save).and_return(true)
      end
      
      it "should save the <%= singular_name %>" do
        @<%= singular_name %>.should_receive(:save).and_return(true)
        post :create, params
      end
    
      it "should redirect to the show action" do
        post :create, params
        response.should redirect_to(<%= singular_name %>_url(@<%= singular_name %>))
      end
    end
    
    describe "when unsuccessful" do
      before(:each) do
        @<%= singular_name %>.stub!(:save).and_return(false)
      end
      
      it "should assign @<%= singular_name %>" do
        post :create, params
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
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
      
      it "should not save the <%= singular_name %>" do
        @<%= singular_name %>.should_not_receive(:save)
        post :create, params
      end
      
      it "should redirect to index action" do
        post :create, params
        response.should redirect_to(<%= plural_name %>_url)
      end
    end
  end
  
  describe "GET :edit" do
    before(:each) do
      params[:id] = @<%= singular_name %>.id
    end

    it "should assign @<%= singular_name %>" do
      get :edit, params
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
    
    it "should render the form template" do
      get :edit, params
      response.should render_template(:form)
    end
  end
  
  describe "PUT :update" do
    before(:each) do
      params[:id] = @<%= singular_name %>.id
    end

    describe "when successful" do
      before(:each) do
        @<%= singular_name %>.stub!(:update_attributes).and_return(true)
      end
      
      it "should update the <%= singular_name %>'s attributes" do
        @<%= singular_name %>.should_receive(:update_attributes).and_return(true)
        put :update, params
      end
      
      it "should redirect to the show action" do
        put :update, params
        response.should redirect_to(<%= singular_name %>_url(@<%= singular_name %>))
      end
    end
    
    describe "when unsuccessful" do
      before(:each) do
        @<%= singular_name %>.stub!(:update_attributes).and_return(false)
      end
      
      it "should assign @<%= singular_name %>" do
        put :update, params
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
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
      
      it "should not update the <%= singular_name %>" do
        @<%= singular_name %>.should_not_receive(:update_attributes)
        put :update, params
      end
      
      it "should redirect to index action" do
        put :update, params
        response.should redirect_to(<%= plural_name %>_url)
      end
    end
  end
  
  describe "DELETE :destroy" do
    before(:each) do
      params[:id] = @<%= singular_name %>.id
    end

    describe "when successful" do
      before(:each) do
        @<%= singular_name %>.stub!(:destroy).and_return(true)
      end
    
      it "should destroy the @<%= singular_name %>" do
        @<%= singular_name %>.should_receive(:destroy).and_return(true)
        delete :destroy, params
      end
    
      it "should redirect to index action" do
        delete :destroy, params
        response.should redirect_to(<%= plural_name %>_url)
      end
    end
    
    describe "when unsuccessful" do
      before(:each) do
        @<%= singular_name %>.stub!(:destroy).and_return(false)
        @request.env["HTTP_REFERER"] = "http://test.host/<%= singular_name %>/referer"
      end
      
      it "should assign @<%= singular_name %>" do
        delete :destroy, params
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
      end
      
      it "should redirect to its referer" do
        delete :destroy, params
        response.should redirect_to("http://test.host/<%= singular_name %>/referer")
      end
    end
  end
end