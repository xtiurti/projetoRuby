class Disciplines::TeachingPlansController < ApplicationController
  before_action :set_discipline, only: [:create, :show, :edit, :update, :destroy, :new, :newDate, :index]
  before_action :set_teaching_plan, only: [:show, :edit, :update, :destroy]

  def index
    @teaching_plans = @discipline.teaching_plans.all
  end

  def show
  end

  def newDate
    data = params.require(:teaching_plan).permit(:start, :end)
    inicio = data[:start].to_date
    fim = data[:end].to_date
    monday = params[:seg]
    tuesday = params[:ter]
    wednesday = params[:qua]
    thursday = params[:qui]
    friday = params[:sex]

    @teaching_plan = @discipline.teaching_plans.new(teaching_plan_params)
    @semestre = Array.new
    @distribution = []


    days = [["monday", monday],["tuesday", tuesday] ,["wednesday", wednesday],["thursday", thursday],["friday", friday]]

    days.each do |day|
      if day[1] != "0"
        @distribution.push day
      end
    end

    #Vira somente o que o professor definiu, adiciona na Hash
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
        @datasEspeciais.push date.date_exception
    end

    # Retirar todos as datas excepcionais do periodo letivo
    period = @period.to_a - @datasEspeciais.to_a

    # Separar somente as datas dos dias da semana definidos pelo professor
    period.each do |date| 
      @distribution.each do |d|
        if date.method("#{d[0]}?").call
          num_aulas = d[1]
          @response[date] = num_aulas
          @totalAulas += num_aulas.to_i
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
    @teaching_plan.teaching_procedures.build
    @teaching_plan.programmings.build
    render 'new'
    #  Fazer 
    # redirect_to new_discipline_teaching_plan_path(@discipline, @distribution)
  end


  def new
    @teaching_plan = @discipline.teaching_plans.new
    @teaching_plan.teaching_procedures.build
  end

  def create
    @total_aulas = 0
    programmings = params[:teaching_plan][:programmings_attributes]
    data, con, dae = ''
    @classes = Array.new
    programmings.each do |key, programming|
      @classes.push programming
      @total_aulas += programming['number_classes'].to_i
    end
   

    @teaching_plan = @discipline.teaching_plans.new(teaching_plan_params)
    # render :text => programmings.inspect
    render 'show'

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

    def set_teaching_plan
      @teaching_plan = @discipline.teaching_plans.find(params[:id])
    end
    
    def set_discipline
      @discipline = Discipline.find(params[:discipline_id])
    end

    def teaching_plan_params
      params.require(:teaching_plan).permit(:teacher,:team,:semester,:evaluation,:references,:guidelines, :start, :end, programmings_attributes: [:id, :day_month_week, :content_classes, :number_classes, :_destroy], teaching_procedures_attributes: [:id, :theoretical_classes, :practical_classes, :aps, :activies_distance, :apcc, :_destroy])
    end
end
