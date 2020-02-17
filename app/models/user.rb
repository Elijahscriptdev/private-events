# frozen_string_literal: true

class User < ActiveRecord::Base
  attr_accessor :gen_token
  before_create :create_token_and_save
  before_save { self.email = email.downcase }

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 25 },
                    format: { with: VALID_EMAIL_REGEX }

  has_many :events, foreign_key: :creator_id
  has_many :user_events, foreign_key: 'user_id'
  has_many :attended_events, through: :user_events, source: :event

  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypted(string)
    Digest::SHA1.hexdigest(string.to_s)
  end

  def create_token_and_save
    self.gen_token = User.new_token
    self.remember_digest = User.encrypted(gen_token)
  end
end
