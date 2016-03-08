class PregamesController < ApplicationController
  before_action :set_pregame, only: [:show, :edit, :update, :destroy, :join, :unjoin]

  # GET /pregames
  # GET /pregames.json
  def index
    @pregames = Pregame.all
  end

  # GET /pregames/1
  # GET /pregames/1.json
  def show
  end
  
  def join
    @pregame.pregame_to_users.create(user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to @pregame }
    end
  end
  
  def unjoin
    @pregame.pregame_to_users.find_by(user_id: current_user.id).delete
    if @pregame.users.count == 0
      @pregame.destroy
    end
    respond_to do |format|
      format.html { redirect_to @pregame }
    end
  end

  # GET /pregames/new
  def new
    @event = Event.find params[:event_id]
    @pregame = Pregame.new
    # @pregame.event_id = params[:event_id]
  end

  # GET /pregames/1/edit
  def edit
  end

  # POST /pregames
  # POST /pregames.json
  def create
    @event = Event.find params[:event_id]
    @pregame = @event.pregames.build(pregame_params)
    # @pregame = Pregame.new(pregame_params)
    # @pregame.event_id = params[:event_id]

    respond_to do |format|
      if @pregame.save
        format.html { redirect_to @pregame }
        format.json { render :show, status: :created, location: @pregame }
        @pregame.pregame_to_users.create(user_id: current_user.id)
      else
        format.html { render :new }
        format.json { render json: @pregame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pregames/1
  # PATCH/PUT /pregames/1.json
  def update
    respond_to do |format|
      if @pregame.update(pregame_params)
        format.html { redirect_to @pregame, notice: 'Pregame was successfully updated.' }
        format.json { render :show, status: :ok, location: @pregame }
      else
        format.html { render :edit }
        format.json { render json: @pregame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pregames/1
  # DELETE /pregames/1.json
  def destroy
    @pregame.destroy
    respond_to do |format|
      format.html { redirect_to pregames_url, notice: 'Pregame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pregame
      @pregame = Pregame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pregame_params
      params.require(:pregame).permit(:event_id, :place, :address, :city, :state, :zipcode, :special)
    end
end

