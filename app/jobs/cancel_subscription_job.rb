# frozen_string_literal: true

class CancelSubscriptionJob < ApplicationJob
  queue_as :default

  def perform(*subscribed_user)
    # Do something later

    puts ''
    puts ''
    puts '###########################################'
    puts 'Canacelling A Subscription'
    subscribed_user = subscribed_user[0]
    puts subscribed_user
    puts '###########################################'
    puts ''
    puts ''

    subscribed_user.update_attribute(:subscribed, false)
    subscribed_user.update_attribute(:subscription_frequency, '')
    subscribed_user.update_attribute(:subscription_stage, 0)
    subscription_payments_n = 0
    active_subscription_donations = []
    subscribed_user.donations.all.each do |donation|
      if donation.subscription_status == 'active'
        subscription_payments_n += 1
        active_subscription_donations << donation
      end
      if donation.subscription_status == 'active'
        donation.update_attribute(:subscription_status,
                                  "cancelled at stage #{subscription_payments_n}")
      end
    end

    puts '################'
    puts active_subscription_donations[0].subscription_id
    puts '################'
    subscription_to_cancel = Subscription.find_by!(id: active_subscription_donations[0].subscription_id)
    subscription_to_cancel.update_attribute(:status, 'cancelled')
  end
end
