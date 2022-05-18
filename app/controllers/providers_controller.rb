class ProvidersController < ApplicationController
  def index
    @providers = Provider.true_records
  end

  def show
    @providers = Provider.find(params[:id])
  end

  def edit
    @providers = Provider.find(params[:id])
  end

  def update
    providers = Provider.find(params[:id])
    providers.update!(providers_params)
    redirect_to "/providers/#{providers.id}"
  end

  def destroy
    providers = Provider.find(params[:id])
    providers.destroy
    redirect_to '/providers'
  end

private
  def providers_params
    params.permit(:name, :age, :doctor, :review_rating)
  end
end
