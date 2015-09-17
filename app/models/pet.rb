class Pet < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed
  has_one :lost_report, dependent: :destroy

  delegate :name, to: :breed, prefix: true
  delegate :animal_type_name, to: :breed

  before_save :capitalize_name

  has_attached_file :avatar,  styles:
                              {
                                medium: '346x346#',
                                thumb: '100x100#',
                                profile: '150x150#',
                                flyer: '462x526#'
                              },
                              default_url: '/images/:style/missing.png',
                              processor: 'mini_magick',
                              convert_options:
                              {
                                flyer: '-background white -compose Copy -gravity center -extent 612x792'
                              }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_format_of :name, with: /^[a-zA-Z]+$/, multiline: true
  validates :avatar, presence: true

  def capitalize_name
    name.capitalize!
  end
end

# == Schema Information
#
# Table name: pets
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  sex                 :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  user_id             :integer
#  breed_id            :integer
#
