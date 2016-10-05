class ImagesController < ApplicationController
  before_action :set_gallery

  def create
    unless params[:gallery].nil? then
      add_more_images(images_params[:images])
      flash[:alert] = 'Képfeltöltés sikertelen.' unless @gallery.save
    else
      flash[:alert] = 'Kérlek válassz legalább egy képet!'
    end
    redirect_back fallback_location: root_url
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:alert] = 'Kép törlése sikertelen.' unless @gallery.save
    redirect_back fallback_location: root_url
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def add_more_images(new_images)
    images = @gallery.images # copy the old images
    images += new_images # concat old images with new ones
    @gallery.images = images # assign back
  end

  def remove_image_at_index(index)
    remain_images = @gallery.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @gallery.images = remain_images # re-assign back
  end

  def images_params
    params.require(:gallery).permit({images: []}) # allow nested params as array
  end
end
