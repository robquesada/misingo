class Pet < ActiveRecord::Base
  belongs_to :breed
  has_one :lost_report, dependent: :destroy

  delegate :name, to: :breed, prefix: true
  delegate :animal_type_name, to: :breed

  before_save :capitalize_name

  has_attached_file :avatar, styles:
                              {
                                large: '480x480#',
                                medium: '346x346#',
                                thumb: '100x100#',
                                profile: '150x150#',
                                flyer: '450x526#'
                              },
                              default_url: '/images/:style/missing.png',
                              processor: 'mini_magick',
                              convert_options:
                              {
                                flyer: '-distort DePolar 0 -virtual-pixel HorizontalTile -distort Polar 0 -compose Dst_In -background white -compose Copy -gravity center -extent 612x830'
                              }

  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/jpg", "image/png"] }
  validates_attachment_presence :avatar
  validates_format_of :name, with: /^[a-z\u00E0-\u00FC]+$/i, multiline: true

  def capitalize_name
    name.capitalize!
  end
end

# == Schema Information
#
# Table name: pets
#
#  id                  :integer          not null, primary key
#  name                :string
#  created_at          :datetime
#  updated_at          :datetime
#  sex                 :string
#  breed_id            :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  castrated           :boolean
#  age                 :string
#  size                :string
#
