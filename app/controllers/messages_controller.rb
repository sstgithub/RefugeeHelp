class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    render json: @messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    #this assumes only one message from user
    if @message.user_type == "giver"
      requester = User.where(category: @message.category, current: true, user_type: "requester")
      if !requester.empty
        distance = Geocoder::Calculations.distance_between([@message.lat, @message.long], [requester.first.lat, requester.first.long])
        if distance
          render json: {"complete": true, "requester_number": requester.phone_num, "giver_number": giver.phone_num, "distance": distance}
        end
        User.create(lat: @message.lat, long: @message.long, category_name: @message.category_name, user_type: @message.user_type, phone_num: @message.phone_num, current: true)
      end
    else
      User.create(lat: @message.lat, long: @message.long, category_name: @message.category_name, user_type: @message.user_type, phone_num: @message.phone_num, current: true)
    end

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:lat, :long, :user_type, :category_name)
    end
end