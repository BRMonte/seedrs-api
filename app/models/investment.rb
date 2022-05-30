class Investment < ApplicationRecord
  belongs_to :campaign

  validate :is_investment_multiple_correct?

  before_save :is_campaign_complete?

  after_save :update_percentage

  def is_campaign_complete?
    if campaign.percentage_raised == CampaignsController::MAX_PERCENTAGE
      return "This campaign no longer takes investments"
    end
  end

  def is_investment_multiple_correct?
    invested_amount >= quota && (invested_amount % quota).to_i == 0
  end

  def update_percentage
    percentual_investmented = (self.amount * 100 / campaign.target_amount)
    campaign.percentage_raised = (campaign.percentage_raised.to_i + percentual_investmented).to_s
  end

  private

  def quota
    campaign.investment_multiple
  end

  def invested_amount
    self.amount
  end
end
