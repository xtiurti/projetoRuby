class Disciplines::TeachingPlansController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy, :new]
  before_action :set_teaching_plan, only: [:show, :edit, :update, :destroy]

  def index
    @teaching_plans = @discipline.teaching_plans
  end

  def show
  end

  def newDate
    #variaveis que vão vim do formulario
    inicio = Date.new(2016,6,1)
    fim = Date.new(2016,7,1)
    #aulas e seus numeros por semana
    @aulas = Hash.new
    @aulas['seg'] = 2
    @aulas['ter'] = 3
    @aulas['qua'] = 0
    @aulas['qui'] = 0
    @aulas['sex'] = 1
    #hash's para usar no push
    mondays = []
    tuesday = []
    wednesday = []
    thursday = []
    friday = []
    @periodo = []
    @datasEspeciais = []
    #pegando todos os feriados
    @feriados = ExceptionalDate.all
    #numero final de aulas
    @totalAulas = 0
    

    #pegar todas as datas do inicio ao fim do semestre
    (inicio..fim).each do |date|
      @periodo.push date.to_date
    end
    
     #pegar todos os feriados do periodo
    @feriados.each do |date|
      @datasEspeciais.push date.date_exception.to_date
    end

    #removendo todos os feriados
    @periodo = @periodo.to_a - @datasEspeciais.to_a

    
    #adicionando todos os dias as suas hash's
    @periodo.each do |data|
      mondays.push data if data.monday?
      tuesday.push data if data.tuesday?
      wednesday.push data if data.wednesday?
      thursday.push data if data.thursday?
      friday.push data if data.friday?
    end
render :text => mondays.inspect
    
end

  def new
    @teaching_plan = @discipline.teaching_plans.new
    @teaching_plan.teaching_procedures.build
  end

  def create
    @teaching_plan = @discipline.teaching_plans.new(teaching_plan_params)
    respond_to do |format|
      if @teaching_plan.save
        format.html { redirect_to discipline_teaching_plan_path(@discipline, @teaching_plan), notice: 'Plano de Ensino Criado com Sucesso!' }
        format.json { render :no_content }
        format.js 
      else
        format.html { render :new }
        format.json { render json: @teaching_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @teaching_plan.update(teaching_plan_params)
        format.html { redirect_to discipline_teaching_plan_path(@discipline, @teaching_plan), notice: 'O plano de ensino foi atualizado com sucesso!' }
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
      format.html {redirect_to discipline_teaching_plans_path(@discipline)}
      format.json { head :no_content }
      format.js
    end
  end

  private

    def set_discipline
      @discipline = Discipline.find(params[:discipline_id])
    end

    def set_teaching_plan
      @teaching_plan = @discipline.teaching_plans.find(params[:id])
    end

    def teaching_plan_params
      params.require(:teaching_plan).permit(:teacher,:team,:semester,:evaluation,:references,:guidelines, programmings_attributes: [:id, :day_month_week, :content_classes, :number_classes, :_destroy], teaching_procedures_attributes: [:id, :theoretical_classes, :practical_classes, :aps, :activies_distance, :apcc, :_destroy])
    end
end
