class Task < ApplicationRecord
  extend Enumerize
  belongs_to :sprint
  validates :title, :estimated_time, presence: true
  belongs_to :user, optional: true
  enumerize :status, in: [:pending, :running, :stoped, :finished, :canceled, :homologating, :approved, :inconsistent, :implanted ], default: :pending, scope: true

  scope :not_finished, -> { where(status: [:pending, :running,:inconsistent]) }

  def start(user)
    if !self.status.running?
      self.update_attributes(status: :running, started_in: Time.now, user: user)
    end
  end

  def stop
    now = Time.now
    self.time_spent = 0 if self.time_spent.nil?
    worked_time = self.time_spent + (( now - self.started_in ) / 1.minute).round
    self.update_attributes(status: :stoped, started_in: nil, finished_in: nil, time_spent: worked_time)
  end

  def finish
    now = Time.now
    if self.started_in.nil?
      self.update_attributes(status: :finished, finished_in: now)
    else
      self.time_spent = 0 if self.time_spent.nil?
      worked_time = self.time_spent + (( now - self.started_in ) / 1.minute).round
      self.update_attributes(status: :finished, finished_in: now, time_spent: worked_time)
    end
  end
end
