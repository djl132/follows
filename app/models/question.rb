class Question < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :answers

  has_many :users, through: :following


  validates :title, length: {minimum: 7}, presence: true
 validates :body, length: {minimum: 7}, presence: true
 validates_associated :group, :user



# FILE UPLOADS

#  has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", small: "150x150>", thumb: "50x50!" }
# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
#
# has_attached_file :file
# validates_attachment_content_type :file, content_type: /\Aapplication\/.*\z/


  # OVERRIDE
  # TO INCLUDE question and answer's USER for each JSON REQUEST
   def as_json(options = {})
     super(options.merge(include: [:group, :user, answers: {include: [:user, :comments]} ] ))
   end



#   SEARCH QUESTIONS!!!!
# # need to be able to access child attribute name value.
#     def self.search_for(search)
#       # Tagging.find(id: self.id, )
#       joins(:tags).where("title LIKE ? OR body LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
#
#       # where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%").joins(:tags).where("name LIKE ?", "%#{search}%")
#
#     end

end
