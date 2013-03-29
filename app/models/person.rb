class Person < ActiveRecord::Base
  attr_accessible :phone_number, :fullname, :nickname, :active

  validates :phone_number, presence: true

  def response_count
    0
  end

  def call_count
    0
  end

  def situations
    []
  end
end
