class HomeController < ApplicationController

  def index
    @dis = params.permit(:distribution)
    render :text => @dis.inspect
    # @exceptional_dates = ExceptionalDate.new    


    # feriados = [Date.new(2016,4,25), Date.new(2016,3,28), Date.new(2016,6,6), Date.new(2016,3,7)]


    # disciplinas = Discipline.all

    # disciplinas.each do |disciplina|
    #   # render :text => disciplina.name.inspect # render :text => tuesday.inspect  
    #   render :text => disciplina.created_at.to_date.inspect # render :text => tuesday.inspect  
    # end
    
    # mondays=[] 
    # tuesday=[]

    # inicio = Date.new(2016,3,1) 
    # fim = Date.new(2016,7,7) 
    # datas = []
    
    # (inicio..fim).each do |date| 
    #   mondays.push date if date.monday? 
    #   tuesday.push date if date.tuesday? 
    # end 

    # datas = mondays.to_a - feriados.to_a

    # render :text => datas.inspect # render :text => tuesday.inspect  
  end


end
