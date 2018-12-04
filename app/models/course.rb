class Course < ApplicationRecord
    has_and_belongs_to_many :students, dependent: :delete_all
end
