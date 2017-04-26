class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following_question, class_name: "Question"

  def as_json(options={})
    super(options.merge(include:[:following_question, :user ]))
  end

end
