class OutpatientClinicsProvidersController < ApplicationController
  def index
    @clinic = OutpatientClinic.find(params[:outpatientclinics_id])
    @providers = @clinic.providers
  end

  def new
    @clinic = OutpatientClinic.find(params[:outpatientclinics_id])
  end

  def create
    clinic = OutpatientClinic.find(params[:outpatientclinics_id])
    provider = clinic.providers.create!(providers_params)
    redirect_to "/outpatientclinics/#{clinic.id}/providers"
  end

  def providers_params
    params.permit(:name, :age, :doctor, :review_rating)
  end
end
