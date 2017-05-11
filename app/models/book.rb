class Book < ApplicationRecord
  validates :name,presence: true
  
  
=begin
  def display_name
    "#{title}(#{author})"
  end
=end
end