class Pet < ActiveRecord::Base
    validates_format_of :name, :with => /^[a-zA-Z]+$/, :multiline => true
end