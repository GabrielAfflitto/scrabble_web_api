class GameSerializer < ActiveModel::Serializer
  attributes :id, :scores

  def scores
    [{user_id: object.player_1.id,
      score: object.player_1.plays.sum(:score)},
     {user_id: object.player_2.id,
      score: object.player_2.plays.sum(:score)}]
  end
end
