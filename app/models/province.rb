# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Province < ActiveRecord::Base
  has_many :lost_reports
end
