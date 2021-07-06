class TasksController < ApplicationController
  # idからメッセージを取り出す操作は他でも必要となるので最初からまとめておきます
  before_action :set_task, only: %i[destroy edit update]

  def index
    @tasks = Task.all
  end

  # 新規投稿用のフォームに置き換えることだけに使用する
  def new
  end

  def create
    @task = Task.create!(task_params)
  end

  def destroy
    @task.destroy!
  end

  # 更新用のフォームに置き換えることだけに使用する
  def edit
  end

  def update
    @task.update!(task_params)
  end

  private

  # Strong Parameters はサボらずに使っておくこととします
  def task_params
    params.require(:task).permit(:content)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
