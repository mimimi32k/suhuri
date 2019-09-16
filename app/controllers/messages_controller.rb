class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    # binding.pry
    if @message.save
      redirect_to messages_path, notice: 'メッセージが送信されました'
    else
      @messages = Message.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
