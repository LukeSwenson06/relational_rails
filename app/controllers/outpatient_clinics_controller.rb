class OutpatientClinicsController < ApplicationController
  def index
    @outpatientclinics = OutpatientClinic.most_recently_created
  end

  def show
    @outpatientclinics = OutpatientClinic.find(params[:id])
  end

  def new

  end

  def create
    clinic = OutpatientClinic.create!(outpatientclinics_params)
    redirect_to "/outpatientclinics"
  end

  def outpatientclinics_params
    params.permit(:name, :city, :rank, :radiology, :pediatrics, :womens_health, :referrals, :clinic_services_provided)
  end
end
