# == Schema Information
#
# Table name: donations
#
#  id                       :bigint           not null, primary key
#  title                    :string
#  amount                   :integer
#  stripe_payment_id        :string
#  status                   :string
#  donation_type            :string           "one_time" / "subscription" / "automated"
#  stripe_payment_method_id :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Donation < ApplicationRecord

  # Associations
  belongs_to :user

  # after_create :attach_viator_attraction_on_listing_creation
  after_commit :trigger_next_subscription_donation, :send_payment_complete_email, on: :create

  # Scopes
  scope :monthly_donations, -> { where.not(donation_type: "one_time", amount: 200) }
  scope :yearly_donations, -> { where(donation_type: "subscription", amount: 200) }
  scope :one_off_donations, -> { where(donation_type: "one_time") }
  #scope :recent, -> { order(created_at: :desc) }

  private
  def trigger_next_subscription_donation
    
    if self.subscription_id.present?
      this_donations_subscription = Subscription.find_by!(id: self.subscription_id)
    end
    if self.amount == 20 && (self.donation_type == "subscription" || self.donation_type == "automated") #&& this_donations_subscription.status == "active"
      subscription_stage = self.user.subscription_stage + 1
      if subscription_stage < 13        
        self.user.update_attribute(:subscription_stage, subscription_stage) 
        ChargeSubscriberJob.set(wait: 1.month).perform_later(self)
      elsif subscription_stage == 13
        # Stop Monthly Subscription
        self.user.update_attribute(:subscribed, false)
        self.user.update_attribute(:subscription_stage, 0)
        self.user.update_attribute(:subscription_frequency, "") 
        self.user.donations.all.each do |donation|
          donation.update_attribute(:subscription_status, "completed") if donation.subscription_status == "active" 
        end 
        #completed_subscription = Subscription.find_by!(id: self.subscription_id)
        this_donations_subscription.update_attribute(:status, "completed") 
      end
    elsif self.amount == 200 && self.donation_type == "subscription"
      # Stop Yearly Subscription
      EndYearlySubscriptionJob.set(wait: 1.year).perform_later(self)
    end
    
  end

  def send_payment_complete_email
    if self.user.email.present?
      PaymentCompleteMailer.payment_complete(self).deliver_later
    end
  end

end
