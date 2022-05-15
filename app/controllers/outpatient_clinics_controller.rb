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
    clinic = OutpatientClinic.create!(
      name: params[:name],
      city: params[:city],
      rank: params[:rank],
      radiology: params[:radiology],
      pediatrics: params[:pediatrics],
      womens_health: params[:womens_health],
      referrals: params[:referrals],
      clinic_services_provided: params[:clinic_services_provided])
      clinic.save
      redirect_to "/outpatientclinics"
  end
end
