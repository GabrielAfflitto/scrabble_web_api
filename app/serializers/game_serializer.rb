class GameSerializer < ActiveModel::Serializer
  attributes :id, :scores

  def scores
    object.plays.select(:user_id, :score).as_json(:except => :id)
  end
end
