require File.dirname(__FILE__) + '/../spec_helper'

describe BandsController do
  describe "route generation" do

    it "should map { :controller => 'bands', :action => 'index' } to /bands" do
      route_for(:controller => "bands", :action => "index").should == "/bands"
    end
  
    it "should map { :controller => 'bands', :action => 'new' } to /bands/new" do
      route_for(:controller => "bands", :action => "new").should == "/bands/new"
    end
  
    it "should map { :controller => 'bands', :action => 'show', :id => 1 } to /bands/1" do
      route_for(:controller => "bands", :action => "show", :id => 1).should == "/bands/1"
    end
  
    it "should map { :controller => 'bands', :action => 'edit', :id => 1 } to /bands/1/edit" do
      route_for(:controller => "bands", :action => "edit", :id => 1).should == "/bands/1/edit"
    end
  
    it "should map { :controller => 'bands', :action => 'update', :id => 1} to /bands/1" do
      route_for(:controller => "bands", :action => "update", :id => 1).should == "/bands/1"
    end
  
    it "should map { :controller => 'bands', :action => 'destroy', :id => 1} to /bands/1" do
      route_for(:controller => "bands", :action => "destroy", :id => 1).should == "/bands/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'bands', action => 'index' } from GET /bands" do
      params_from(:get, "/bands").should == {:controller => "bands", :action => "index"}
    end
  
    it "should generate params { :controller => 'bands', action => 'new' } from GET /bands/new" do
      params_from(:get, "/bands/new").should == {:controller => "bands", :action => "new"}
    end
  
    it "should generate params { :controller => 'bands', action => 'create' } from POST /bands" do
      params_from(:post, "/bands").should == {:controller => "bands", :action => "create"}
    end
  
    it "should generate params { :controller => 'bands', action => 'show', id => '1' } from GET /bands/1" do
      params_from(:get, "/bands/1").should == {:controller => "bands", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'bands', action => 'edit', id => '1' } from GET /bands/1;edit" do
      params_from(:get, "/bands/1/edit").should == {:controller => "bands", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'bands', action => 'update', id => '1' } from PUT /bands/1" do
      params_from(:put, "/bands/1").should == {:controller => "bands", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'bands', action => 'destroy', id => '1' } from DELETE /bands/1" do
      params_from(:delete, "/bands/1").should == {:controller => "bands", :action => "destroy", :id => "1"}
    end
  end
end