class MedicationsController < ApplicationController

  def show
    @medication = Medication.find(params[:id])
    @prescriptions = Prescription.where(:medication_id => params[:id])

  end
end