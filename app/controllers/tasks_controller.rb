class TasksController < ApplicationController
  # idからメッセージを取り出す操作は他でも必要となるので最初からまとめておきます
  before_action :set_task, only: %i[destroy edit update change]
  before_action :logged_in_user, only: %i[create edit destroy]

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクを追加しました'
      redirect_to index_url
    else
      # flash[:danger] = "投稿失敗"
    end
  end

  def destroy
    @task.destroy!
  end

  def edit
    state = @task.state
    if state == 'TODO'
      state = 'DOING'
    elsif state == 'DOING'
      state = 'DONE'
    elsif state == 'DONE'
      state = 'TODO'
    end
  end

  def update
    @task.update!(task_params)
    flash[:success] = 'タスクを編集しました'
    redirect_to root_url
  end

  # ステータスボタンが押下された場合にステータスを変更する処理;
  def change
    state = @task.state
    if state == 'TODO'
      state = 'DOING'
    elsif state == 'DOING'
      state = 'DONE'
    elsif state == 'DONE'
      state = 'TODO'
    end
    @task.update_attribute(:state, state)
  end

  private

    # Strong Parameters
    def task_params
      params.require(:task).permit(:state, :limit, :content, :user_id)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
