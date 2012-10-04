class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(params[:upload])

    if @upload.valid?
      @upload.parse_file
      flash[:notice] = "Total amount gross revenue represented by the uploaded file: #{@upload.total_gross_revenue}"
    end
    render :new
  end
end
