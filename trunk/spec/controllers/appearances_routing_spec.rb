require File.dirname(__FILE__) + '/../spec_helper'

describe AppearancesController do
  describe "route generation" do

    it "should map { :controller => 'appearances', :action => 'index' } to /appearances" do
      route_for(:controller => "appearances", :action => "index").should == "/appearances"
    end
  
    it "should map { :controller => 'appearances', :action => 'new' } to /appearances/new" do
      route_for(:controller => "appearances", :action => "new").should == "/appearances/new"
    end
  
    it "should map { :controller => 'appearances', :action => 'show', :id => 1 } to /appearances/1" do
      route_for(:controller => "appearances", :action => "show", :id => 1).should == "/appearances/1"
    end
  
    it "should map { :controller => 'appearances', :action => 'edit', :id => 1 } to /appearances/1/edit" do
      route_for(:controller => "appearances", :action => "edit", :id => 1).should == "/appearances/1/edit"
    end
  
    it "should map { :controller => 'appearances', :action => 'update', :id => 1} to /appearances/1" do
      route_for(:controller => "appearances", :action => "update", :id => 1).should == "/appearances/1"
    end
  
    it "should map { :controller => 'appearances', :action => 'destroy', :id => 1} to /appearances/1" do
      route_for(:controller => "appearances", :action => "destroy", :id => 1).should == "/appearances/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'appearances', action => 'index' } from GET /appearances" do
      params_from(:get, "/appearances").should == {:controller => "appearances", :action => "index"}
    end
  
    it "should generate params { :controller => 'appearances', action => 'new' } from GET /appearances/new" do
      params_from(:get, "/appearances/new").should == {:controller => "appearances", :action => "new"}
    end
  
    it "should generate params { :controller => 'appearances', action => 'create' } from POST /appearances" do
      params_from(:post, "/appearances").should == {:controller => "appearances", :action => "create"}
    end
  
    it "should generate params { :controller => 'appearances', action => 'show', id => '1' } from GET /appearances/1" do
      params_from(:get, "/appearances/1").should == {:controller => "appearances", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'appearances', action => 'edit', id => '1' } from GET /appearances/1;edit" do
      params_from(:get, "/appearances/1/edit").should == {:controller => "appearances", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'appearances', action => 'update', id => '1' } from PUT /appearances/1" do
      params_from(:put, "/appearances/1").should == {:controller => "appearances", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'appearances', action => 'destroy', id => '1' } from DELETE /appearances/1" do
      params_from(:delete, "/appearances/1").should == {:controller => "appearances", :action => "destroy", :id => "1"}
    end
  end
end