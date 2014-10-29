class Pet < ActiveRecord::Base
    belongs_to :user
    belongs_to :animal_type
    belongs_to :breed
    has_one :lost_report
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :profile => "150x150#"}, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    validates_format_of :name, :with => /^[a-zA-Z]+$/, :multiline => true
end
