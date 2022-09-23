class User < ApplicationRecord
  #skip_before_filter :verify_authenticity_token  
  # @@yearly_subscriber_checker = "inactive"
  

  # def self.yearly_subscriber_checker_switch
  #   @@yearly_subscriber_checker == "active" ? @@yearly_subscriber_checker = "inactive" : @@yearly_subscriber_checker = "active"
  #   CheckYearSubscriptionsJob.perform_now() if @@yearly_subscriber_checker == "active"
  #   puts @@yearly_subscriber_checker
  # end
# 
  # def self.yearly_subscriber_checker_status
  #   @@yearly_subscriber_checker
  # end
  # Associations
  has_many :donations, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  #validates :username, presence: true, uniqueness: true
  #validates :email, uniqueness: true
  validates_uniqueness_of :email, conditions: -> {where.not(:email => '')}
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, presence: true

  # Callbacks
  before_validation :attach_uuid_on_user_creation, :attach_user_number_on_user_creation, on: :create

  # Scopes
  scope :subscribed, -> { where(subscribed: true) }
  scope :not_subscribed, -> { where(subscribed: false) }

  # login username OR Email
  # attr_writer :login

  #def login
  #  @login || self.username || self.email
  #end

  #def email_required?
  #  false
  #end
#
  #def email_changed?
  #  false
  #end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  private
  def attach_uuid_on_user_creation
    self.uid = SecureRandom.uuid
  end

  def attach_user_number_on_user_creation
    # generate user_number
    rndhx = SecureRandom.hex(8)

    all_user_numbers = []
    User.all.each do |user|
      all_user_numbers << user.user_number
    end

    # Check for duplicate user numbers
    while all_user_numbers.include?(rndhx)
      rndhx = SecureRandom.hex(8)
      puts "duplicate user number detected!"
      puts "newly generated securerandom hex: #{rndhx}"
    end

    self.user_number = rndhx
    puts "user number #{self.user_number}"
  end
end