class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication

  validates_presence_of :dosage, :schedule, :starts_on, :ends_on, :user_id, :patient_id
  validate :dosage_starts_with_number
  validate :start_date_before_end_date

  private

  def dosage_starts_with_number
    unless /^\d*/.match(self.dosage)[0] == /^\w*/.match(self.dosage)[0]
      errors.add(:dosage, "must begin with a number")
    end
  end

  def start_date_before_end_date
    if (self.ends_on) - (self.starts_on) <= 0
      errors.add(:start_date, "must be before end date")
    end
  end
end