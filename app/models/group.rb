class Group < ApplicationRecord
  include Comparable
# ASSOICATIONS
  has_many :questions
  has_many :users

# VALIDATIONS
  # validates_associated :users
  validates :name, length: {minimum: 2}, presence: true
  validates :description, length: {minimum: 10}, presence: true

  validates_uniqueness_of :name, case_sensitive: false

  def <=>(other)
       self.name <=> other.name
  end

  def as_json(options = {})
    super(options.merge(include: [:questions, {include:
            [:user, :answers, {include:
              [:user, :comments, {include: :user} ]} ]} ]  ))
  end

end
