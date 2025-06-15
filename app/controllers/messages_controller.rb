class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to conversation_path(@message.conversation)
    else
      redirect_to conversation_path(@message.conversation), alert: "Erro ao enviar mensagem."
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :conversation_id)
  end
end
