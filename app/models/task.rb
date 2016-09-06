class Task < ApplicationRecord
  belongs_to :sprint
   validates :title, presence: true
end
