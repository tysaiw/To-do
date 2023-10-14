class Todo < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true

  enum status: { incomplete: 0, in_progress: 1, completed: 2 } 

  belogs_to :Category
end
