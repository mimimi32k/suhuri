class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.includes(:user)
  end

  def create
    # Message.create(message_params)
    @message = @messages.new(message_params)
    # Message.create(name: message_params[:name], image: message_params[:image], content: message_params[:content], user_id: current_user.id)
    if @message.save
      redirect_to messages_path, notice: 'メッセージが送信されました'
    else
      @messages = @messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
