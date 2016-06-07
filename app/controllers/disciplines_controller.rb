class DisciplinesController < ApplicationController
  
  def index
    @disciplines = Discipline.all
  end

  def new
    @discipline = Discipline.new
    3.times {@discipline.program_contents.build}
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
