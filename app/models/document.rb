class Document < ApplicationRecord
  has_one_attached :image
  has_many_attached :file
end
