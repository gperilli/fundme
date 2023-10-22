# frozen_string_literal: true

class User < ApplicationRecord
  # Associations
  has_many :donations, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email, conditions: -> { where.not(email: '') }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, presence: true

  # Callbacks
  before_validation :attach_uuid_on_user_creation, :attach_user_number_on_user_creation, on: :create

  # Scopes
  scope :subscribed, -> { where(subscribed: true) }
  scope :not_subscribed, -> { where(subscribed: false) }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
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
      puts 'duplicate user number detected!'
      puts "newly generated securerandom hex: #{rndhx}"
    end

    self.user_number = rndhx
    puts "user number #{user_number}"
  end
end
