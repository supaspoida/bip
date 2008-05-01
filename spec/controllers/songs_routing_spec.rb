require File.dirname(__FILE__) + '/../spec_helper'

describe SongsController do
  describe "route generation" do

    it "should map { :controller => 'songs', :action => 'index' } to /songs" do
      route_for(:controller => "songs", :action => "index").should == "/songs"
    end
  
    it "should map { :controller => 'songs', :action => 'new' } to /songs/new" do
      route_for(:controller => "songs", :action => "new").should == "/songs/new"
    end
  
    it "should map { :controller => 'songs', :action => 'show', :id => 1 } to /songs/1" do
      route_for(:controller => "songs", :action => "show", :id => 1).should == "/songs/1"
    end
  
    it "should map { :controller => 'songs', :action => 'edit', :id => 1 } to /songs/1/edit" do
      route_for(:controller => "songs", :action => "edit", :id => 1).should == "/songs/1/edit"
    end
  
    it "should map { :controller => 'songs', :action => 'update', :id => 1} to /songs/1" do
      route_for(:controller => "songs", :action => "update", :id => 1).should == "/songs/1"
    end
  
    it "should map { :controller => 'songs', :action => 'destroy', :id => 1} to /songs/1" do
      route_for(:controller => "songs", :action => "destroy", :id => 1).should == "/songs/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'songs', action => 'index' } from GET /songs" do
      params_from(:get, "/songs").should == {:controller => "songs", :action => "index"}
    end
  
    it "should generate params { :controller => 'songs', action => 'new' } from GET /songs/new" do
      params_from(:get, "/songs/new").should == {:controller => "songs", :action => "new"}
    end
  
    it "should generate params { :controller => 'songs', action => 'create' } from POST /songs" do
      params_from(:post, "/songs").should == {:controller => "songs", :action => "create"}
    end
  
    it "should generate params { :controller => 'songs', action => 'show', id => '1' } from GET /songs/1" do
      params_from(:get, "/songs/1").should == {:controller => "songs", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'songs', action => 'edit', id => '1' } from GET /songs/1;edit" do
      params_from(:get, "/songs/1/edit").should == {:controller => "songs", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'songs', action => 'update', id => '1' } from PUT /songs/1" do
      params_from(:put, "/songs/1").should == {:controller => "songs", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'songs', action => 'destroy', id => '1' } from DELETE /songs/1" do
      params_from(:delete, "/songs/1").should == {:controller => "songs", :action => "destroy", :id => "1"}
    end
  end
end