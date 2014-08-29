class Task < ActiveRecord::Base
	belongs_to :project
	validates :content, presence: true, length: { maximum: 20 }
	validates :project_id, presence: true
end
