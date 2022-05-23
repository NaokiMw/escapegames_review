class DiarysController < ApplicationController
  def index
    @diarys = Diary.all
  end
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      flash[:notice] = "日記を新規作成しました"
      redirect_to :diarys
    else
      render"new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:diary).permit(:title, :play_day, :start_time, :result, :discription, :status, :user_id)
  end
end
