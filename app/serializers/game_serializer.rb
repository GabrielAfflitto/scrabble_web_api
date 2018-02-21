class GameSerializer < ActiveModel::Serializer
  attributes :id, :scores
  has_many :plays

  def scores
    object.plays.select(:user_id, :score)
  end
end
