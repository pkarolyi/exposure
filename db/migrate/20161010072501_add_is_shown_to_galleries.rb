class AddIsShownToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :is_shown, :boolean, default: false
  end
end
