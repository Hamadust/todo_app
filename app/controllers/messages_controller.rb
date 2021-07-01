class MessagesController < ApplicationController
  # idからメッセージを取り出す操作は他でも必要となるので最初からまとめておきます
  before_action :set_message, only: %i[destroy edit update]

  def index
    @messages = Message.all
  end

  # 新規投稿用のフォームに置き換えることだけに使用する
  def new
  end

  def create
    @message = Message.create!(message_params)
  end

  def destroy
    @message.destroy!
  end

  # 更新用のフォームに置き換えることだけに使用する
  def edit
  end

  def update
    @message.update!(message_params)
  end

  private

  # Strong Parameters はサボらずに使っておくこととします
  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
