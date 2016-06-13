class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  
  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
  end

  def show
  end

  def create  
    @discipline = Discipline.new(discipline_params)

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to discipline_path(@discipline), notice: 'Discipline was successfully created.' }
        #format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        #format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html {redirect_to disciplines_path}
      format.json { head :no_content }
      format.js
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to discipline_path(@discipline), notice: 'A disciplina foi atualizada com sucesso!.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def discipline_params
      params.require(:discipline).permit(:name, :cod, :period, :matrix, :course, :substantiation, :goals, :ement, :at, :ap, :aps, :ad, :apcc, :total, program_contents_attributes: [:id, :item, :ement, :content, :_destroy])
    end
end
