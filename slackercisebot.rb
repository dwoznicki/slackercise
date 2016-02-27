require 'slack-ruby-bot'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'SLACKERCISE RULLLEEESSSS', channel: data.channel)
  end
end

PongBot.run

