class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true
  validates :name, uniqueness: true

  mount_uploader :photo, PhotoUploader

  def url
    if name.downcase === "mojito"

      url = "https://static.750g.com/images/622-auto/b520523117d647dab6b842a36f4cc7f5/mojito-le-vrai.jpg"
    elsif
      name.downcase === "cuba libre"
      url =  "cubalibre.jpg"
    else
      url = "https://images-na.ssl-images-amazon.com/images/I/51IJZB8Cv6L.jpg"
    end
    url
  end
end
