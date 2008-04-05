require File.dirname(__FILE__) + '/../spec_helper'

describe PerformancesController do
  describe "route generation" do

    it "should map { :controller => 'performances', :action => 'index' } to /performances" do
      route_for(:controller => "performances", :action => "index").should == "/performances"
    end
  
    it "should map { :controller => 'performances', :action => 'new' } to /performances/new" do
      route_for(:controller => "performances", :action => "new").should == "/performances/new"
    end
  
    it "should map { :controller => 'performances', :action => 'show', :id => 1 } to /performances/1" do
      route_for(:controller => "performances", :action => "show", :id => 1).should == "/performances/1"
    end
  
    it "should map { :controller => 'performances', :action => 'edit', :id => 1 } to /performances/1/edit" do
      route_for(:controller => "performances", :action => "edit", :id => 1).should == "/performances/1/edit"
    end
  
    it "should map { :controller => 'performances', :action => 'update', :id => 1} to /performances/1" do
      route_for(:controller => "performances", :action => "update", :id => 1).should == "/performances/1"
    end
  
    it "should map { :controller => 'performances', :action => 'destroy', :id => 1} to /performances/1" do
      route_for(:controller => "performances", :action => "destroy", :id => 1).should == "/performances/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'performances', action => 'index' } from GET /performances" do
      params_from(:get, "/performances").should == {:controller => "performances", :action => "index"}
    end
  
    it "should generate params { :controller => 'performances', action => 'new' } from GET /performances/new" do
      params_from(:get, "/performances/new").should == {:controller => "performances", :action => "new"}
    end
  
    it "should generate params { :controller => 'performances', action => 'create' } from POST /performances" do
      params_from(:post, "/performances").should == {:controller => "performances", :action => "create"}
    end
  
    it "should generate params { :controller => 'performances', action => 'show', id => '1' } from GET /performances/1" do
      params_from(:get, "/performances/1").should == {:controller => "performances", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'performances', action => 'edit', id => '1' } from GET /performances/1;edit" do
      params_from(:get, "/performances/1/edit").should == {:controller => "performances", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'performances', action => 'update', id => '1' } from PUT /performances/1" do
      params_from(:put, "/performances/1").should == {:controller => "performances", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'performances', action => 'destroy', id => '1' } from DELETE /performances/1" do
      params_from(:delete, "/performances/1").should == {:controller => "performances", :action => "destroy", :id => "1"}
    end
  end
end