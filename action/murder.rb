class Action::Murder < Action::Base
  ICON = :skull

  def perform
    other_player.kill! game.turn_num
    respond "#{player} murdered #{other_player} with their **#{player.item}**!"
  end
end