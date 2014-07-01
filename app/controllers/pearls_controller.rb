class PearlsController < ApplicationController
  before_action :set_pearl, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :make_sure_is_owner, only: [:edit, :update, :destroy]
  impressionist :actions=>[:show]
  # GET /pearls
  # GET /pearls.json
  def index
    @pearls = Pearl.all
  end

  # GET /pearls/1
  # GET /pearls/1.json
  def show
    impressionist(@pearl)
  end

  # GET /pearls/new
  def new
    @pearl = Pearl.new
  end

  # GET /pearls/1/edit
  def edit
  end

  # POST /pearls
  # POST /pearls.json
  def create
    @pearl = Pearl.new(pearl_params)

    respond_to do |format|
      if @pearl.save
        format.html { redirect_to @pearl, notice: 'Perle wurde erfolgreich angelegt.' }
        format.json { render :show, status: :created, location: @pearl }
      else
        format.html { render :new }
        format.json { render json: @pearl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pearls/1
  # PATCH/PUT /pearls/1.json
  def update
    respond_to do |format|
      if @pearl.update(pearl_params)
        format.html { redirect_to @pearl, notice: 'Perle wurde erfolgreich bearbeitet.' }
        format.json { render :show, status: :ok, location: @pearl }
      else
        format.html { render :edit }
        format.json { render json: @pearl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pearls/1
  # DELETE /pearls/1.json
  def destroy
    @pearl.destroy
    respond_to do |format|
      format.html { redirect_to pearls_url, notice: 'Perle wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pearl
    @pearl = Pearl.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pearl_params
    params.require(:pearl).permit(:user_id, :body, :title, :image, :remove_image)
  end

  def make_sure_is_owner
    @pearl = Pearl.friendly.find(params[:id])
    if (user_signed_in? && current_user.id == @pearl.user.id)

      else
      respond_to do |format|
        format.html { redirect_to pearl_path(@pearl), alert: 'Sie können nur ihre eigenen Perlen bearbeiten!' }
        format.json { head :no_content }
      end
    end
  end
end
