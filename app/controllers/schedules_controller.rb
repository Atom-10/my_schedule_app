class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start, :end, :allday, :details))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      flash[:notice] = "スケジュール登録できませんでした"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    if @schedule = Schedule.find(params[:id])
      flash[:notice] = "スケジュールを更新に失敗しました"
      render "edit"
    else
      @schedule.save
      flash[:notice] = "ID #{@schedule.id} のスケジュールが更新されました"
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start, :end, :allday, :details))
      flash[:notice] = "ID #{@schedule.id} のスケジュールが更新されました"
      redirect_to :schedules
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "ID #{@schedule.id} のスケジュールを削除しました"
    redirect_to :schedules
  end
end
