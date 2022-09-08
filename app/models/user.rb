# frozen_string_literal: true

# Users class for devise
class User < ApplicationRecord
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  # validates :password, presence: true,
  #                      confirmation: true,
  #                      length: { within: 6..40 },
  #                      unless: :force_submit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :subscriptions 
  has_many :plans, through: :subscriptions

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  enum role: %i[admin buyer]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :buyer
  end
end
