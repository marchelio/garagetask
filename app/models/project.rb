class Project < ActiveRecord::Base
belongs_to :user
has_many :tasks, dependent: :destroy

validates :title, length: { maximum: 20 }
validates :user_id, presence: true

end
