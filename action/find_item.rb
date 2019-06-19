class Action::FindItem < Action::Base
  ICON = :inbox_tray

  ITEMS = [
    'legendary sword',
    'oran berry',
    'finished release of pokemon cosmos',
  ]

  def perform
    item = ITEMS.sample
    player.give! item
    respond "#{player} found an item: **#{item}**!"
  end
end