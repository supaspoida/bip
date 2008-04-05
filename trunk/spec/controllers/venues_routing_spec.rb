require File.dirname(__FILE__) + '/../spec_helper'

describe VenuesController do
  describe "route generation" do

    it "should map { :controller => 'venues', :action => 'index' } to /venues" do
      route_for(:controller => "venues", :action => "index").should == "/venues"
    end
  
    it "should map { :controller => 'venues', :action => 'new' } to /venues/new" do
      route_for(:controller => "venues", :action => "new").should == "/venues/new"
    end
  
    it "should map { :controller => 'venues', :action => 'show', :id => 1 } to /venues/1" do
      route_for(:controller => "venues", :action => "show", :id => 1).should == "/venues/1"
    end
  
    it "should map { :controller => 'venues', :action => 'edit', :id => 1 } to /venues/1/edit" do
      route_for(:controller => "venues", :action => "edit", :id => 1).should == "/venues/1/edit"
    end
  
    it "should map { :controller => 'venues', :action => 'update', :id => 1} to /venues/1" do
      route_for(:controller => "venues", :action => "update", :id => 1).should == "/venues/1"
    end
  
    it "should map { :controller => 'venues', :action => 'destroy', :id => 1} to /venues/1" do
      route_for(:controller => "venues", :action => "destroy", :id => 1).should == "/venues/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'venues', action => 'index' } from GET /venues" do
      params_from(:get, "/venues").should == {:controller => "venues", :action => "index"}
    end
  
    it "should generate params { :controller => 'venues', action => 'new' } from GET /venues/new" do
      params_from(:get, "/venues/new").should == {:controller => "venues", :action => "new"}
    end
  
    it "should generate params { :controller => 'venues', action => 'create' } from POST /venues" do
      params_from(:post, "/venues").should == {:controller => "venues", :action => "create"}
    end
  
    it "should generate params { :controller => 'venues', action => 'show', id => '1' } from GET /venues/1" do
      params_from(:get, "/venues/1").should == {:controller => "venues", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'venues', action => 'edit', id => '1' } from GET /venues/1;edit" do
      params_from(:get, "/venues/1/edit").should == {:controller => "venues", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'venues', action => 'update', id => '1' } from PUT /venues/1" do
      params_from(:put, "/venues/1").should == {:controller => "venues", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'venues', action => 'destroy', id => '1' } from DELETE /venues/1" do
      params_from(:delete, "/venues/1").should == {:controller => "venues", :action => "destroy", :id => "1"}
    end
  end
end