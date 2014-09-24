class Task < ActiveRecord::Base
	belongs_to :project
	validates :content, presence: true, length: { maximum: 70 }
	validates :project_id, presence: true
end
