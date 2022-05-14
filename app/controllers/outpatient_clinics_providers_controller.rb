class OutpatientClinicsProvidersController < ApplicationController
  def index
  clinic = OutpatientClinic.find(params[:outpatientclinics_id])
  @providers = clinic.providers
  end
end
