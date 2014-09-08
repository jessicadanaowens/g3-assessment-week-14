class ChangeDateTimeColumns < ActiveRecord::Migration
  def change
    change_column :prescriptions, :starts_on, :date
    change_column :prescriptions, :ends_on, :date
  end
end
