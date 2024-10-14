class ImagesController < ApplicationController
  def create
    uploaded_io = params[:image]
    huurder_id = params[:huurder_id]

    puts "huurder_id=#{huurder_id}"

    extension = File.extname(uploaded_io.original_filename)
    filename = "#{SecureRandom.urlsafe_base64}#{extension}"

    # make dir for storage of huurder
    upload_path = Rails.root.join('public', 'uploads', "huurder_#{huurder_id}").to_s
    system 'mkdir', '-p', upload_path

    # write file in folder of huurder
    File.open(Rails.root.join(upload_path, filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    # render json: { message: 'Image uploaded successfully' }, status: :ok
    redirect_to huurder_path(id: huurder_id)
  end

  def destroy
    huurder_id = params[:huurder_id]
    fn = params[:filename]
    photo_path = Rails.root.join('public', 'uploads', "huurder_#{huurder_id}", fn).to_s
    # delete our photo
    system 'rm', '-f', photo_path

    render json: { message: 'deleted photo' }
  end
end
