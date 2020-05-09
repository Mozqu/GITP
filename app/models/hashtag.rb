class Hashtag < ApplicationRecord
  validates :hashname, {presence: true, uniqueness: true}

  private

end
