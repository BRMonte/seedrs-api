class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show]

  MAX_PERCENTAGE = '100'

  def show
    render json: @campaign
  end

  def index
    @campaigns = Campaign.all

    render json: @campaigns
  end

  def fill_percentage
    @campaign.percentage_raised = MAX_PERCENTAGE if max_number_of_shares == @investments.size

    unless @campaign.percentage_raised == '100'
      current_percentage = (@investments * 100) / @campaign.target_amount
      @campaign.percentage_raised = current_percentage
    end
  end

  def max_number_of_shares
    (@campaign.target_amount / @campaign.investment_multiple).ceil
  end

  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def set_investments
      @investments = Investment.where(campaign_id: @campaign.id)
    end
end
