class AttendancesController < ApplicationController
  
  UPDATE_ERROE_MSG = "勤怠登録に失敗しました」。やり直してください。"
  
  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    
    #出勤時間が未登録であることを判定します
    if @attendance.started_at.nil?
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0))
                                                                #何時何分までを表示(秒数を0に変換)            
        flash[:info] = "おはようございます。"
      else
        flash[:denger] = UPDATE_ERROE_MSG 
      end
    elsif @attendance_finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れさまでした。"
      else
        flash[:denger] = UPDATE_ERROE_MSG
      end
    end
    redirect_to @user
  end
end
