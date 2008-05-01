require File.dirname(__FILE__) + '/../spec_helper'

describe SetlistsController do
  describe "route generation" do

    it "should map { :controller => 'setlists', :action => 'index' } to /setlists" do
      route_for(:controller => "setlists", :action => "index").should == "/setlists"
    end
  
    it "should map { :controller => 'setlists', :action => 'new' } to /setlists/new" do
      route_for(:controller => "setlists", :action => "new").should == "/setlists/new"
    end
  
    it "should map { :controller => 'setlists', :action => 'show', :id => 1 } to /setlists/1" do
      route_for(:controller => "setlists", :action => "show", :id => 1).should == "/setlists/1"
    end
  
    it "should map { :controller => 'setlists', :action => 'edit', :id => 1 } to /setlists/1/edit" do
      route_for(:controller => "setlists", :action => "edit", :id => 1).should == "/setlists/1/edit"
    end
  
    it "should map { :controller => 'setlists', :action => 'update', :id => 1} to /setlists/1" do
      route_for(:controller => "setlists", :action => "update", :id => 1).should == "/setlists/1"
    end
  
    it "should map { :controller => 'setlists', :action => 'destroy', :id => 1} to /setlists/1" do
      route_for(:controller => "setlists", :action => "destroy", :id => 1).should == "/setlists/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'setlists', action => 'index' } from GET /setlists" do
      params_from(:get, "/setlists").should == {:controller => "setlists", :action => "index"}
    end
  
    it "should generate params { :controller => 'setlists', action => 'new' } from GET /setlists/new" do
      params_from(:get, "/setlists/new").should == {:controller => "setlists", :action => "new"}
    end
  
    it "should generate params { :controller => 'setlists', action => 'create' } from POST /setlists" do
      params_from(:post, "/setlists").should == {:controller => "setlists", :action => "create"}
    end
  
    it "should generate params { :controller => 'setlists', action => 'show', id => '1' } from GET /setlists/1" do
      params_from(:get, "/setlists/1").should == {:controller => "setlists", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'setlists', action => 'edit', id => '1' } from GET /setlists/1;edit" do
      params_from(:get, "/setlists/1/edit").should == {:controller => "setlists", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'setlists', action => 'update', id => '1' } from PUT /setlists/1" do
      params_from(:put, "/setlists/1").should == {:controller => "setlists", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'setlists', action => 'destroy', id => '1' } from DELETE /setlists/1" do
      params_from(:delete, "/setlists/1").should == {:controller => "setlists", :action => "destroy", :id => "1"}
    end
  end
end