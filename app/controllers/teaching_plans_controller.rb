
class TeachingPlansController < ApplicationController
  before_action :set_teaching_plan, only: [:show, :edit, :update, :destroy]
  
  def index
    @teachingPlans = TeachingPlan.all
  end

  def show
  end

  def new 
    @teaching_plan = TeachingPlan.new 
    @disciplines = Discipline.all

  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  
  def set_teaching_plan
    @teachingPlan = TeachingPlan.find(params[:id])
  end

  def teaching_plan_params
    params.require(:teachingPlan).permit(:teacher,:team,:semester,:evaluation,:references,:guidelines)
  end

end
