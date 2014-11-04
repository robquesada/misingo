class Province < ActiveRecord::Base
  has_many :lost_reports
end