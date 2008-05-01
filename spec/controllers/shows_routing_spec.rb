require File.dirname(__FILE__) + '/../spec_helper'

describe ShowsController do
  describe "route generation" do

    it "should map { :controller => 'shows', :action => 'index' } to /shows" do
      route_for(:controller => "shows", :action => "index").should == "/shows"
    end
  
    it "should map { :controller => 'shows', :action => 'new' } to /shows/new" do
      route_for(:controller => "shows", :action => "new").should == "/shows/new"
    end
  
    it "should map { :controller => 'shows', :action => 'show', :id => 1 } to /shows/1" do
      route_for(:controller => "shows", :action => "show", :id => 1).should == "/shows/1"
    end
  
    it "should map { :controller => 'shows', :action => 'edit', :id => 1 } to /shows/1/edit" do
      route_for(:controller => "shows", :action => "edit", :id => 1).should == "/shows/1/edit"
    end
  
    it "should map { :controller => 'shows', :action => 'update', :id => 1} to /shows/1" do
      route_for(:controller => "shows", :action => "update", :id => 1).should == "/shows/1"
    end
  
    it "should map { :controller => 'shows', :action => 'destroy', :id => 1} to /shows/1" do
      route_for(:controller => "shows", :action => "destroy", :id => 1).should == "/shows/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'shows', action => 'index' } from GET /shows" do
      params_from(:get, "/shows").should == {:controller => "shows", :action => "index"}
    end
  
    it "should generate params { :controller => 'shows', action => 'new' } from GET /shows/new" do
      params_from(:get, "/shows/new").should == {:controller => "shows", :action => "new"}
    end
  
    it "should generate params { :controller => 'shows', action => 'create' } from POST /shows" do
      params_from(:post, "/shows").should == {:controller => "shows", :action => "create"}
    end
  
    it "should generate params { :controller => 'shows', action => 'show', id => '1' } from GET /shows/1" do
      params_from(:get, "/shows/1").should == {:controller => "shows", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'shows', action => 'edit', id => '1' } from GET /shows/1;edit" do
      params_from(:get, "/shows/1/edit").should == {:controller => "shows", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'shows', action => 'update', id => '1' } from PUT /shows/1" do
      params_from(:put, "/shows/1").should == {:controller => "shows", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'shows', action => 'destroy', id => '1' } from DELETE /shows/1" do
      params_from(:delete, "/shows/1").should == {:controller => "shows", :action => "destroy", :id => "1"}
    end
  end
end