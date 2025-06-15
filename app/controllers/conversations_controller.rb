class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
    @conversations = current_user.conversations
  end

  def create
    @conversation = Conversation.between(current_user.id, params[:recipient_id]).first

    unless @conversation
      @conversation = Conversation.create(sender_id: current_user.id, recipient_id: params[:recipient_id])
    end

    redirect_to conversation_path(@conversation)
  end


  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @message = Message.new
  end

end
