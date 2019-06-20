class Action::FindItem < Action::Base
  ICON = :inbox_tray

  ITEMS = [
    'legendary sword',
    'oran berry',
    'finished release of pokemon cosmos',
    'dehydrated water',
    'wynaut plush',
    ':petercomfers: peter comfers :petercomfers:',
    'lala plushie',
    'zigzagoon plushie',
    'care and support from one or more friend(s)',
    'mew under the truck',
    'the gays',
    'magmortar ass head',
    'imperial sword',
    'lydia the housecarl',
  ]

  def perform
    item = ITEMS.sample
    player.give! item
    respond "#{player} found an item: **#{item}**!"
  end
end