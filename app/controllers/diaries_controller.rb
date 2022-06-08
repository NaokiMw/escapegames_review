class DiariesController < ApplicationController
  def index
    @published_diaries = Diary.published.order(created_at: :desc)
    @draft_diaries = Diary.draft.order(created_at: :desc)
    followings = current_user.followings
    @follow_diaries = Diary.published.where(user: followings).order(:created_time).limit(10)
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      flash[:notice] = "日記を新規作成しました"
      redirect_to :diaries
    else
      render"new"
    end
  end
  
  def show
    @diary = Diary.where(id: params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    binding.pry
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      flash[:notice] = "タイトル「#{@diary.title}」の日記を更新しました"
      redirect_to :diaries
    else
        render "edit"
    end
  end

  def destroy
    @diary = Diary.find_by(params[:id],user_id: current_user.id)
    @diary.destroy
    flash[:notice] = "日記を削除しました"
    redirect_to :diaries
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :play_day, :start_time, :result, :description, :status, :user_id)
  end
end
