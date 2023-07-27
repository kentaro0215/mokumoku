# frozen_string_literal: true

class Events::AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    
    if @event.only_woman? && current_user.woman?
      flash[:danger] = '女性限定のイベントです'
      redirect_back(fallback_location: root_path)
    else
      current_user.attend_event(@event)
      redirect_back(fallback_location: root_path, success: '参加の申込をしました')
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    current_user.cancel_attend(@event)
    redirect_back(fallback_location: root_path, success: '申込をキャンセルしました')
  end
end
