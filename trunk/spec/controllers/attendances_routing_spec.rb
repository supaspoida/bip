require File.dirname(__FILE__) + '/../spec_helper'

describe AttendancesController do
  describe "route generation" do

    it "should map { :controller => 'attendances', :action => 'index' } to /attendances" do
      route_for(:controller => "attendances", :action => "index").should == "/attendances"
    end
  
    it "should map { :controller => 'attendances', :action => 'new' } to /attendances/new" do
      route_for(:controller => "attendances", :action => "new").should == "/attendances/new"
    end
  
    it "should map { :controller => 'attendances', :action => 'show', :id => 1 } to /attendances/1" do
      route_for(:controller => "attendances", :action => "show", :id => 1).should == "/attendances/1"
    end
  
    it "should map { :controller => 'attendances', :action => 'edit', :id => 1 } to /attendances/1/edit" do
      route_for(:controller => "attendances", :action => "edit", :id => 1).should == "/attendances/1/edit"
    end
  
    it "should map { :controller => 'attendances', :action => 'update', :id => 1} to /attendances/1" do
      route_for(:controller => "attendances", :action => "update", :id => 1).should == "/attendances/1"
    end
  
    it "should map { :controller => 'attendances', :action => 'destroy', :id => 1} to /attendances/1" do
      route_for(:controller => "attendances", :action => "destroy", :id => 1).should == "/attendances/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'attendances', action => 'index' } from GET /attendances" do
      params_from(:get, "/attendances").should == {:controller => "attendances", :action => "index"}
    end
  
    it "should generate params { :controller => 'attendances', action => 'new' } from GET /attendances/new" do
      params_from(:get, "/attendances/new").should == {:controller => "attendances", :action => "new"}
    end
  
    it "should generate params { :controller => 'attendances', action => 'create' } from POST /attendances" do
      params_from(:post, "/attendances").should == {:controller => "attendances", :action => "create"}
    end
  
    it "should generate params { :controller => 'attendances', action => 'show', id => '1' } from GET /attendances/1" do
      params_from(:get, "/attendances/1").should == {:controller => "attendances", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'attendances', action => 'edit', id => '1' } from GET /attendances/1;edit" do
      params_from(:get, "/attendances/1/edit").should == {:controller => "attendances", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'attendances', action => 'update', id => '1' } from PUT /attendances/1" do
      params_from(:put, "/attendances/1").should == {:controller => "attendances", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'attendances', action => 'destroy', id => '1' } from DELETE /attendances/1" do
      params_from(:delete, "/attendances/1").should == {:controller => "attendances", :action => "destroy", :id => "1"}
    end
  end
end