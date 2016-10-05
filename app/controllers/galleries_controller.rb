class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:admin, :new, :edit, :destroy, :create, :update]

  # GET /galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /admin
  def admin
    @galleries = Gallery.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to gallery_admin_path, notice: 'Galéria sikeresen létrehozva.'
    else
      flash[:alert] = 'Kérlek válassz legalább egy képet!'
      render :new
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    if @gallery.update(gallery_params)
      redirect_to edit_gallery_path(@gallery), notice: 'Galéria sikeresen frissítve.'
    else
      render :edit
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    redirect_to gallery_admin_path, notice: 'Galéria sikeresen törölve.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:title, {images: []})
    end
end
