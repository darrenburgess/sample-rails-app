class Address < ActiveRecord::Base
  belongs_to  :user
  validates 	:user_id, presence: true
  validates   :street1, presence: true, length: { maximum: 50 }
  validates   :street2, length: { maximum: 50 }
  validates   :city,    presence: true, length: { maximum: 20 }
  validates   :state,   presence: true, length: { maximum: 2 }
  VALID_ZIP_REGEX = /\A[0-9]{5}(?:-[0-9]{4})?\z/
  validates   :zip,     presence: true, 
                        format: { with: VALID_ZIP_REGEX }
end
