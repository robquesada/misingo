class AddAttachmentImageToPetImages < ActiveRecord::Migration
  def self.up
    change_table :pet_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pet_images, :image
  end
end
