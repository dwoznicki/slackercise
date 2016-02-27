require 'slack-ruby-bot'
require 'pp'
require 'httparty'
require 'dotenv'
Dotenv.load
# require_relative '.env'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'SLACKERCISE RULLLEEESSSS', channel: data.channel)
    pp ENV["SLACKERCISE_BOT_KEY"]
    # client.users.each do |key, value|
    # end

  end

  command 'init' do |client, data, match|
    client.say(text: 'SLACKERCISE RULLLEEESSSS', channel: data.channel)
    p "*" * 50
    p "DATA:"
    pp data[:user]
    p "*" * 50
    p "*" * 50
    p "CLIENT:"
    # pp client.users[data[:user]]
    pp client.users
    p "*" * 50
    p "*" * 50
    p "MATCH:"
    pp match
    p "*" * 50
    p "*" * 50
    client.users.each do |key, value|

# https://slack.com/api/channels.create?token=ENV["SLACKERCISE_BOT_KEY"]&name=slackercise-club%20&pretty=1


    end

  end


  command 'addme' do |client, data, match|
    # p "*" * 50
    # p "DATA:"
    # pp data[:user]
    # p "*" * 50
    # p "*" * 50
    # p "CLIENT:"
    # # pp client.users[data[:user]]
    # pp client
    # p "*" * 50
    # p "*" * 50
    # p "MATCH:"
    # pp match
    # p "*" * 50
    # p "*" * 50


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


# "U0FV69WN4"=>
#       {
#        "team_id"=>"T0FU9CULU",
#        "name"=>"edella2",
#        "real_name"=>"Eric DollaDollaBills",

#        "profile"=>
#         {"first_name"=>"Eric",
#          "last_name"=>"DollaDollaBills",
#          "avatar_hash"=>"ea1a2399246d",
#          "image_24"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_24.jpg",
#          "image_32"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_32.jpg",
#          "image_48"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_48.jpg",
#          "image_72"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_72.jpg",
#          "image_192"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_192.jpg",
#          "image_512"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_512.jpg",
#          "image_1024"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_512.jpg",
#          "image_original"=>
#           "https://avatars.slack-edge.com/2015-12-04/15988918035_ea1a2399246d4b0c9670_original.jpg",
#          "real_name"=>"Eric DollaDollaBills",
#          "real_name_normalized"=>"Eric DollaDollaBills",
#          "email"=>"edella2@gmail.com",
#          "fields"=>nil},
#        }

