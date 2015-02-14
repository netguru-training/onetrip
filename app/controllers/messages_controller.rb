class MessagesController < ApplicationController
  expose(:messages)
  expose(:message, attributes: :message_params)
  
  def my_messages
  end
  
  def create
    message.sender_id = current_user.id
    message.receiver_id = params[:receiver]
    if message.save
      redirect_to message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def update
    if message.save
      redirect_to message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
  
  def message_params
    params.require(:message).permit(:content)
  end
end