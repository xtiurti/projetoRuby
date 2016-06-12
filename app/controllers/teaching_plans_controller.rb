class TeachingPlansController < ApplicationController
  before_action :set_teaching_plan, only: [:show, :edit, :update, :destroy]
  
  def index
    @teaching_plans = TeachingPlan.all
  end

  def show

  end

  def new 
    @teaching_plan = TeachingPlan.new
    @discipline = Discipline.first(params[:format])
  end

  def destroy
  end

  def create  
    @teaching_plan = TeachingPlan.new(teaching_plan_params)

    respond_to do |format|
      if @teaching_plan.save
        format.html { redirect_to teaching_plan_path(@teaching_plan), notice: 'Plano de Ensino criado com sucesso' }
        #format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        #format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end 

  def edit
  end

  def update
    respond_to do |format|
      if @teaching_plan.update(teaching_plan_params)
        format.html { redirect_to teaching_plan_path(@teaching_plan), notice: 'O plano de ensino foi atualizado com sucesso!.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @teaching_plan.errors, status: :unprocessable_entity }
      end
    end
  end

    def destroy
    @teaching_plan.destroy
    respond_to do |format|
      format.html {redirect_to teaching_plans_path}
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_teaching_plan
    @teaching_plan = TeachingPlan.find(params[:id])
  end


  def teaching_plan_params
    params.require(:teaching_plan).permit(:teacher,:team,:semester,:evaluation,:references,:guidelines)
  end

end
