class Post < ApplicationRecord
    validates :name, {presence: true, uniqueness: true}
    validates :content, {presence: true}
    validates :password, {presence: true}
    validates :year_deadline, {presence: true}
    validates :month_deadline, {presence: true}
    validates :day_deadline, {presence: true}
end
