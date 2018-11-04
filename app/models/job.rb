class Job < ApplicationRecord
  belongs_to :company
  belongs_to :occupational_category
end
