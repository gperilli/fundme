# frozen_string_literal: true

class Donation < ApplicationRecord
  # Associations
  belongs_to :user

  # Callbacks
  after_commit :trigger_next_subscription_donation, :send_payment_complete_email, on: :create

  # Scopes
  scope :monthly_donations, -> { where(donation_type: %w[monthly_subscription automated]) }
  scope :yearly_donations, -> { where(donation_type: 'yearly_subscription') }
  scope :one_off_donations, -> { where(donation_type: 'one_time') }

  private

  def trigger_next_subscription_donation
    return unless subscription_id.present?

    this_subscription = Subscription.find_by!(id: subscription_id)
    if donation_type == 'monthly_subscription' || donation_type == 'automated'
      subscription_stage = user.subscription_stage + 1
      if subscription_stage < this_subscription.monthly_subscription_term + 1
        user.update_attribute(:subscription_stage, subscription_stage)
        month_wait_time = Rails.env.development? ? 1.minute : 1.month
        ChargeSubscriberJob.set(wait: month_wait_time).perform_later(self)
      elsif subscription_stage == this_subscription.monthly_subscription_term + 1
        # Stop Monthly Subscription
        user.update_attribute(:subscribed, false)
        user.update_attribute(:subscription_stage, 1)
        user.update_attribute(:subscription_frequency, '')
        user.donations.all.each do |donation|
          donation.update_attribute(:subscription_status, 'completed') if donation.subscription_status == 'active'
        end
        this_subscription.update_attribute(:status, 'completed')
      end
    elsif donation_type == 'yearly_subscription'
      # Stop Yearly Subscription
      year_wait_time = Rails.env.development? ? this_subscription.monthly_subscription_term.minutes : this_subscription.monthly_subscription_term.months
      EndYearlySubscriptionJob.set(wait: year_wait_time).perform_later(self)
    end
  end

  def send_payment_complete_email
    return unless user.email.present?

    PaymentCompleteMailer.payment_complete(self).deliver_later
  end
end
