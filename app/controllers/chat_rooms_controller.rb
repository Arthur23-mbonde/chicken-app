class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chat_room = ChatRoom.new
    @chat_rooms = ChatRoom.public_chat_rooms

    @users = User.all_except(current_user)
  end

  def show
    @single_chat_room = ChatRoom.find(params[:id])

    @chat_room = ChatRoom.new
    @chat_rooms = ChatRoom.public_chat_rooms

    @message = Message.new
    @messages = @single_chat_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)
    render 'index'
  end

  def create
    @chat_room = ChatRoom.create(name: params["chat_room"]["name"])
  end

end
