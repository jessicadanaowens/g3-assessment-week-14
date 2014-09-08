class PrescriptionsController < ApplicationController
  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = Prescription.new
  end

  def create
    puts "*" * 80
    puts params

    def med_id
      params[:prescription][:medication_id]
    end

    start_date = Date.new(
      params[:prescription]["starts_on(1i)"].to_i,
      params[:prescription]["starts_on(2i)"].to_i,
      params[:prescription]["starts_on(3i)"].to_i,
    )

    end_date = Date.new(
      params[:prescription]["ends_on(1i)"].to_i,
      params[:prescription]["ends_on(2i)"].to_i,
      params[:prescription]["ends_on(3i)"].to_i,
    )

    prescription = Prescription.new(
      :medication_id => med_id,
      :patient_id => params[:patient_id],
      :dosage => params[:prescription][:dosage],
      :schedule => params[:prescription][:schedule],
      :starts_on => start_date,
      :ends_on => end_date,
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