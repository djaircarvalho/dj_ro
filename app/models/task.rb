class Task < ApplicationRecord
  extend Enumerize
  belongs_to :sprint
  validates :title, :estimated_time, presence: true

  enumerize :status, in: [:pending, :running, :stoped, :finished, :canceled, :homologating, :approved, :inconsistent, :implanted ], default: :pending, scope: true

  scope :not_finished, -> { where(status: [:pending, :running,:inconsistent]) }

end
