class OccupationalCategory < ApplicationRecord
  has_many :jobs, dependent: :destroy
end
