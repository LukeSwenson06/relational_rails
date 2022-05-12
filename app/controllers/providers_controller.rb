class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end

  def show
    @providers = Provider.find(params[:id])
  end
end
