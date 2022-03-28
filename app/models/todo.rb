class Todo < ApplicationRecord
    belongs_to :user

    has_many :favorites, dependent: :destroy

    with_options presence: true do
        validates :task
        validates :detail
    end
end
