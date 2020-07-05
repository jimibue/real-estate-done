class Api::DocumentsController < ApplicationController
  def create
    file = params[:file]
    # cloud_image = Cloudinary::Uploader.upload(file, public_id: file.original_filename, secure: true)

    thing = Cloudinary::Uploader.upload(file,
                                        :resource_type => :raw)
    binding.pry
    # @document = Document.new(document_params)
    # if @document.save
    #   render json: @document
    # else
    #   render json: @document.errors, status: :unprocessable_entity
    # end
  end

  private

  def document_params
    params.permit(files: []) # permit the files parameter.
  end
end
