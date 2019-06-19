require 'rubygems'
require 'bundler/setup'

require 'yaml'
require 'discordrb'
require 'active_support/all'

require_relative 'game'
require_relative 'player'
require_relative 'turn'
require_relative 'player_turn'
require_relative 'action'

require_relative 'action/base'
require_relative 'action/murder'
require_relative 'action/exploration'
require_relative 'action/leisure'
require_relative 'action/find_item'
require_relative 'action/pve_death'

SECRETS = YAML.load_file('secrets.yml').with_indifferent_access
CONFIG  = YAML.load_file('config.yml').with_indifferent_access

BOT = Discordrb::Bot.new(
  token: SECRETS[:token],
  client_id: SECRETS[:client_id],
)

BOT.message start_with: '!hg start' do |event|
  Game.new event
end

BOT.message start_with: '!hg next' do |event|
  Game.next event
end

BOT.message start_with: '!hg stop' do |event|

end

BOT.run