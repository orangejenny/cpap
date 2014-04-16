class DaysController < ApplicationController
  # GET /days
  def index
    @days = Day.all( :order => "day desc" )

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /days/1
  def show
    @day = Day.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /days/new
  def new
    @day = Day.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /days/1/edit
  def edit
    @day = Day.find(params[:id])
  end

  # POST /days
  def create
    @day = Day.new(params[:day])

    respond_to do |format|
      if @day.save
        format.html { redirect_to(days_path, :notice => 'Data was successfully added.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /days/1
  def update
    @day = Day.find(params[:id])

    respond_to do |format|
      if @day.update_attributes(params[:day])
        format.html { redirect_to(days_path, :notice => 'Data was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /days/1
  def destroy
    @day = Day.find(params[:id])
    @day.destroy

    respond_to do |format|
      format.html { redirect_to(days_url, :notice => 'Data has been deleted.') }
    end
  end
end
