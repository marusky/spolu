class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[ show edit update destroy ]

  # GET /chatrooms or /chatrooms.json
  def index
    @chatrooms = Chatroom.includes(:users, :team).all
    @chatroom = Chatroom.new
    @chattable = Team.find(current_user.home_team).chattable(current_user)
  end

  # GET /chatrooms/1 or /chatrooms/1.json
  def show
    @message = Message.new
  end

  # GET /chatrooms/new
  def new
    @chatroom = Chatroom.new
  end

  # GET /chatrooms/1/edit
  def edit
  end

  # POST /chatrooms or /chatrooms.json
  def create
    @chatroom = Chatroom.new

    data = chatroom_params[:send_to].split(', ')

    if data[0] == 'Team'
      @chatroom.team_id = data[1]
    else
      @chatroom.users << [current_user, User.find(data[1])]
    end

    # FIXME n+1 queries?
    existing_chatroom = Chatroom.joins(:users).find_by(users: [User.first, User.second])

    if existing_chatroom
      respond_to do |format|
        format.html { redirect_to existing_chatroom }
      end
    else
      respond_to do |format|
        if @chatroom.save
          format.html { redirect_to @chatroom, notice: "Chatroom was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /chatrooms/1 or /chatrooms/1.json
  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html { redirect_to @chatroom, notice: "Chatroom was successfully updated." }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1 or /chatrooms/1.json
  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html { redirect_to chatrooms_url, notice: "Chatroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chatroom_params
      params.require(:chatroom).permit(:send_to)
    end
end
