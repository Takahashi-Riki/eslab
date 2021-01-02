class Comment < ApplicationRecord
    validates :name, {presence: true}
    validates :comment, {presence: true}
    validates :content, {presence: true}

end
