class OutpatientClinicsController < ApplicationController
  def index
    @outpatientclinics = OutpatientClinic.all
  end

  def show
    @outpatientclinics = OutpatientClinic.find(params[:id])
  end
end
