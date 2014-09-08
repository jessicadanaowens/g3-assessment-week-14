class CreatePrescriptionsTable < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.references :patient
      t.references :medication
      t.string :dosage
      t.string :schedule
      t.datetime :starts_on
      t.datetime :ends_on
    end
  end
end
