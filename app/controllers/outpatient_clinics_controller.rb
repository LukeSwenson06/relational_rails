class OutpatientClinicsController < ApplicationController
  def index
    @outpatientclinics = OutpatientClinic.all
  end
end
