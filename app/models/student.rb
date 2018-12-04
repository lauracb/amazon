class Student < ApplicationRecord
    has_and_belongs_to_many :courses, dependent: :delete_all

    ## Ejemplo del uso de los callbacks
    # after_create :print_message

    # private
    #     def print_message
    #         puts "Student created"
    #     end
end
