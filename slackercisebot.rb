require 'slack-ruby-bot'
require 'pp'
require 'httparty'
require 'dotenv'
Dotenv.load

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'SLACKERCISE RULLLEEESSSS', channel: data.channel)
    channel_response = HTTParty.get("https://slack.com/api/channels.list?token=#{ENV["SLACKERCISE_BOT_KEY"]}&pretty=1")
    channel_response["channels"].each do |key, value|
      # if key["name"] == "slackercise-club" && key["is_archived"]
      #   unarchive_request = HTTParty.post("https://slack.com/api/channels.unarchive?token=#{ENV["SLACKERCISE_BOT_KEY"]}&channel=#{key["id"]}C&pretty=1")
      #   pp unarchive_request
      # end
    end
  end

  command 'init' do |client, data, match|
    # client.say(text: 'SLACKERCISE RULLLEEESSSS', channel: data.channel)
    # p "*" * 50
    # p "DATA:"
    # pp data[:user]
    # p "*" * 50
    # p "*" * 50
    # p "CLIENT:"
    # # pp client.users[data[:user]]
    # pp client.users
    # p "*" * 50
    # p "*" * 50
    # p "MATCH:"
    # pp match
    # p "*" * 50
    # p "*" * 50
    client.users.each do |key, value|

    end

  end


  command 'addme' do |client, data, match|
    user_data = client.users[data[:user]]
    HTTParty.post("http://localhost:3000/users",
      body: {
        user: {
          team_id: user_data["team_id"],
          name: user_data["name"],
          real_name: user_data["real_name"],
          first_name: user_data["profile"]["first_name"],
          last_name: user_data["profile"]["last_name"],
          image_original: user_data["profile"]["image_original"],
          email: user_data["profile"]["email"] }
        }.to_json,
      headers: {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      )

  end
end

PongBot.run
