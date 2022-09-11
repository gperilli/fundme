class EndYearlySubscriptionJob < ApplicationJob
  queue_as :default

  def perform(*donation)
    # Do something later
    puts ""
    puts donation
    puts "###########################################"
    puts "Ending A Yearly Subscription"
    donation = donation[0]
    puts donation
    puts "stripe_customer_id: #{donation.user.stripe_customer_id}"
    puts "stripe_payment_method_id: #{donation.stripe_payment_method_id}"
    puts "###########################################"
    puts ""
    puts ""

    donation.user.update_attribute(:subscribed, false)
    donation.user.update_attribute(:subscription_frequency, "") 
    donation.user.update_attribute(:subscription_stage, 1)
    donation.update_attribute(:subscription_status, "completed")
    completed_subscription = Subscription.find_by!(id: donation.subscription_id)
    completed_subscription.update_attribute(:status, "completed") 
  end
end
