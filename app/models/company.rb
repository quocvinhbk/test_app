class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_many :manages, dependent: :destroy
end
