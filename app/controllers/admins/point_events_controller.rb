class Admins::PointEventsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @point_event = PointEvent.new
    @point_events = PointEvent.all
  end

  def create
    point_event = PointEvent.new(
      name: params[:point_event]['name'],
      bonus: params[:point_event]['bonus'],
      status: params[:point_event]['status'],
      start_date: params['start_date'],
      finish_date: params['finish_date']
      )
    if point_event.save
      flash[:notice] = "「#{point_event.name}」ジャンル作成しました"
      redirect_to admins_point_events_path
    else
      render 'index'
    end
  end

  def edit
    @point_event = PointEvent.find(params[:id])
  end

  def update
    point_event = PointEvent.find(params[:id])
    if point_event.update(
      name: params[:point_event]['name'],
      bonus: params[:point_event]['bonus'],
      status: params[:point_event]['status'],
      start_date: params['start_date'],
      finish_date: params['finish_date']
      )
      flash[:notice] = 'ポイントイベント編集完了しました'
      redirect_to admins_point_events_path
    else
      render 'edit'
    end
  end

  def destroy
    point_event = PointEvent.find(params[:id])
    point_event.destroy
    flash[:notice] = "「#{point_event.name}」ポイントイベント削除完了しました"
    redirect_to admins_point_events_path
  end

  private

  def point_event_params
    params.require(:point_event).permit(:name,:bonus,:status,:start_date,:finish_date)
  end
end
