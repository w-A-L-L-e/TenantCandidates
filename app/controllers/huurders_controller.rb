class HuurdersController < ApplicationController
  before_action :set_huurder, only: %i[show edit update destroy]

  # GET /huurders or /huurders.json
  def index
    @huurders = Huurder.order(:appointment).all
  end

  # GET /huurders/1 or /huurders/1.json
  def show
    @huurder_files = []
    huurder_id = @huurder.id
    files_path = Rails.root.join('public', 'uploads', "huurder_#{huurder_id}").to_s
    return unless File.directory?(files_path)

    files = Dir.entries(files_path).select { |f| File.file?(Rails.root.join(files_path, f)) }
    puts "files = #{files}"
    @huurder_files = files
  end

  # GET /huurders/new
  def new
    @huurder = Huurder.new
  end

  # GET /huurders/1/edit
  def edit
  end

  # POST /huurders or /huurders.json
  def create
    @huurder = Huurder.new(huurder_params)

    respond_to do |format|
      if @huurder.save
        format.html { redirect_to @huurder, notice: 'Huurder was successfully created.' }
        format.json { render :show, status: :created, location: @huurder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @huurder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /huurders/1 or /huurders/1.json
  def update
    respond_to do |format|
      if @huurder.update(huurder_params)
        format.html { redirect_to @huurder, notice: 'Huurder was successfully updated.' }
        format.json { render :show, status: :ok, location: @huurder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @huurder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /huurders/1 or /huurders/1.json
  def destroy
    @huurder.destroy!

    respond_to do |format|
      format.html { redirect_to huurders_path, status: :see_other, notice: 'Huurder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_huurder
    @huurder = Huurder.find(params[:id])
    @next_huurder = Huurder.where('id > ?', params[:id]).first
  end

  # Only allow a list of trusted parameters through.
  def huurder_params
    params.require(:huurder).permit(:name, :phone, :email, :remarks, :evaluation, :appointment)
  end
end
