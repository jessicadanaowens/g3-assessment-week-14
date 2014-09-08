require 'rails_helper'
require 'capybara/rails'

feature "Patients" do

  scenario "User sees all patients" do
    user = create_user
    patient = create_patient
    login(user)

    expect(page).to have_content(patient.first_name, patient.last_name)

    #user can go to patient's page

    click_link patient.first_name
    expect(page).to have_content(patient.first_name, patient.last_name)

    #user can add a prescription on patient's page

    click_link "Add Prescription"
    expect(page).to have_content("Add a subscription")


  end



end