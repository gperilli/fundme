# frozen_string_literal: true

class Subscription < ApplicationRecord
  # Associations
  belongs_to :user

  # Callbacks
  after_commit :set_subscription_values, on: :create

  private

  def set_subscription_values
    update_attribute(:monthly_subscription_term, current_subscription_parameters.monthly_subscription_term)
    update_attribute(:monthly_subscription_amount, current_subscription_parameters.monthly_subscription_amount)
    update_attribute(:yearly_subscription_amount, current_subscription_parameters.yearly_subscription_amount)
    update_attribute(:status, 'active')
    update_attribute(:subscription_stage, 1)
  end

  def current_subscription_parameters
    SubscriptionParameter.find_by(active: true)
  end
end
