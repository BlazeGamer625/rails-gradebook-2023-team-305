class Grade < ApplicationRecord
    validates_presence_of :student_id, :student_name, :student_grade
    validate :grade_must_be_within_range, :student_id_length_must_be_valid
    validates_uniqueness_of :student_id

    MIN_GRADE = 0
    MAX_GRADE = 100
    STUDENT_ID_LENGTH = 6

    

    #custom validator
    #makes sure grade is between min and max grade values
    def grade_must_be_within_range
        if student_grade.present? && (student_grade < MIN_GRADE || student_grade > MAX_GRADE)
          errors.add(:student_grade, "must be between #{MIN_GRADE} and #{MAX_GRADE}")
        end
    end

    def student_id_length_must_be_valid
        if student_id.present? && student_id.length != STUDENT_ID_LENGTH
          errors.add(:student_id, "id must be #{STUDENT_ID_LENGTH} digits in length")
        end
    end


end
