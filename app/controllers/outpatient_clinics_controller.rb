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

  def edit
    @outpatientclinic = OutpatientClinic.find(params[:id])
  end

  def update
    outpatientclinic = OutpatientClinic.find(params[:id])
    outpatientclinic.update!(outpatientclinics_params)
    redirect_to "/outpatientclinics/#{outpatientclinic.id}"
  end

  def destroy
    clinic = OutpatientClinic.find(params[:id])
    clinic.providers.destroy_all
    clinic.destroy
    redirect_to "/outpatientclinics"
  end

private
  def outpatientclinics_params
    params.permit(:name, :city, :rank, :radiology, :pediatrics, :womens_health, :referrals, :clinic_services_provided)
  end
end
