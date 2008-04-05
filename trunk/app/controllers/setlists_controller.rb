class SetlistsController < ApplicationController
  # GET /setlists
  # GET /setlists.xml
  def index
    @setlists = Setlist.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @setlists }
    end
  end

  # GET /setlists/1
  # GET /setlists/1.xml
  def show
    @setlist = Setlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @setlist }
    end
  end

  # GET /setlists/new
  # GET /setlists/new.xml
  def new
    @setlist = Setlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @setlist }
    end
  end

  # GET /setlists/1/edit
  def edit
    @setlist = Setlist.find(params[:id])
  end

  # POST /setlists
  # POST /setlists.xml
  def create
    @setlist = Setlist.new(params[:setlist])

    respond_to do |format|
      if @setlist.save
        flash[:notice] = 'Setlist was successfully created.'
        format.html { redirect_to(@setlist) }
        format.xml  { render :xml => @setlist, :status => :created, :location => @setlist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @setlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /setlists/1
  # PUT /setlists/1.xml
  def update
    @setlist = Setlist.find(params[:id])

    respond_to do |format|
      if @setlist.update_attributes(params[:setlist])
        flash[:notice] = 'Setlist was successfully updated.'
        format.html { redirect_to(@setlist) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @setlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /setlists/1
  # DELETE /setlists/1.xml
  def destroy
    @setlist = Setlist.find(params[:id])
    @setlist.destroy

    respond_to do |format|
      format.html { redirect_to(setlists_url) }
      format.xml  { head :ok }
    end
  end
end
