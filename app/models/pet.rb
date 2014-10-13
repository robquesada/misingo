class Pet < ActiveRecord::Base
    has_one :kind_of_animal
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    validates_format_of :name, :with => /^[a-zA-Z]+$/, :multiline => true
end
