class PrescriptionsController < ApplicationController
  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = Prescription.new
  end

  def create

    def med_id
      params[:prescription][:medication_id]
    end

    prescription = Prescription.new(
      :medication_id => med_id,
      :patient_id => params[:patient_id],
      :dosage => params[:prescription][:dosage],
      :schedule => params[:prescription][:schedule],
      :starts_on => params[:prescription][:starts_on],
      :ends_on => params[:prescription][:ends_on],
      :user_id => session[:user_id]
    )

    if prescription.save
      flash[:notice] = "Prescription successfully created"

      redirect_to "/medications/" + med_id
    else
      redirect_to patient_prescription_path

    end
  end

  def show

  end
end