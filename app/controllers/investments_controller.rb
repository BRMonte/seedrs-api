class InvestmentsController < ApplicationController

  before_action :set_campaign

  def create
    @investment = @campaign.investments.build(investment_params)

    if @investment.save
      render json: @campaign
    else
      render json: { errors: @investment.errors }
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
