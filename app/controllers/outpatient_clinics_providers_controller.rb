class OutpatientClinicsProvidersController < ApplicationController
  def index
    # binding.pry
  clinic = OutpatientClinic.find(params[:outpatientclinics_id])
  @providers = clinic.providers
  end
end
