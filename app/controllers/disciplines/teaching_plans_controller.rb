class Disciplines::TeachingPlansController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy, :new, :newDate]
  before_action :set_teaching_plan, only: [:show, :edit, :update, :destroy]

  def index
    @teaching_plans = @discipline.teaching_plans
  end

  def show
  end

  def newDate
    @teaching_plan = @discipline.teaching_plans.new(teaching_plan_params)
    @semestre = Array.new

    inicio = @teaching_plan.start
    fim = @teaching_plan.end


    #Vira somente o que o professor definiu, adiciona na Hash

    @distribution = [['thursday', 2], ['wednesday', 3]]
    @response =Hash.new

    @period = [] 
    @datasEspeciais = [] 

    @feriados = ExceptionalDate.all 
    @totalAulas = 0 

    # Pegar todas as datas do inicio ao fim do semestre 
    (inicio..fim).each do |date| 
      @period.push date.to_date
    end

    # Adicionar todos os feriados definidos em formato compativel
    @feriados.each do |date| 
        @datasEspeciais.push date.date_exception.to_date
    end

    # Retirar todos as datas excepcionais do periodo letivo
    period = @period.to_a - @datasEspeciais.to_a

    # Separar somente as datas dos dias da semana definidos pelo professor
    period.each do |date| 
      @distribution.each do |d|
        if date.method("#{d[0]}?").call
          num_aulas = d[1]
          @response[date] = num_aulas
        end
      end  
    end

    

    # if (!@response.empty?) 
    #   # render :new, distribution: @response
    #   redirect_to disciplines_path
    # else
    #   render :new
    # end
    #  render :text => @response.inspect
    render 'new'
     # Fazer 
    #redirect_to new_discipline_teaching_plan_path(@discipline)
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
      params.require(:teaching_plan).permit(:teacher,:team,:semester,:evaluation,:references,:guidelines, :start, :end, programmings_attributes: [:id, :day_month_week, :content_classes, :number_classes, :_destroy], teaching_procedures_attributes: [:id, :theoretical_classes, :practical_classes, :aps, :activies_distance, :apcc, :_destroy])
    end
end
