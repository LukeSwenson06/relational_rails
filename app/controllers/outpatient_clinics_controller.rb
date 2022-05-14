class OutpatientClinicsController < ApplicationController
  def index
    @outpatientclinics = OutpatientClinic.most_recently_created
  end

  def show
    @outpatientclinics = OutpatientClinic.find(params[:id])
  end
end
