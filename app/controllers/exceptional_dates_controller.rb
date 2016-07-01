class ExceptionalDatesController < ApplicationController
  before_action :set_exceptional_date, only: [:show, :edit, :update, :destroy]

  def index
    @exceptional_date = ExceptionalDate.new
    @exceptional_dates = ExceptionalDate.all
   # render :text => @exceptional_date.inspect
  end
  
  def new
    @exceptional_date = ExceptionalDate.new    
  end

  def show
  end

  def create  
    # ExceptionalDate.all.inspect
    @exceptional_date = ExceptionalDate.new(exceptional_date_params)  

    respond_to do |format|
      if @exceptional_date.save
        # @calendar.inspect7
        format.html { redirect_to exceptional_date_path(@exceptional_date), notice: 'Data Excepcional criada com sucesso!' }
        #format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        #format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  respond_to do |format|
    if @exceptional_date.update(exceptional_date_params)
      format.html { redirect_to exceptional_date_path(@exceptional_date), notice: 'A data foi atualizada com sucesso!.' }
      format.json { head :no_content }
      format.js
    else
      format.html { render :edit }
      format.json { render json: @exceptional_date.errors, status: :unprocessable_entity }
    end
  end
  end

  def destroy
    @exceptional_date.destroy
      respond_to do |format|
      format.html {redirect_to exceptional_dates_path}
      format.json { head :no_content }
      format.js
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exceptional_date
      @exceptional_date = ExceptionalDate.find(params[:id])
    end

    def exceptional_date_params
      params.require(:exceptional_date).permit(:event, :date_exception)
    end
end
