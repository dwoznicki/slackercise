require 'slack-ruby-bot'
require 'pp'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'SLACKERCISE RULLLEEESSSS', channel: data.channel)
  end

  command 'addme' do |client, data, match|
    p "*" * 50
    p "DATA:"
    pp data[:user]
    p "*" * 50
    p "*" * 50
    p "CLIENT:"
    # pp client.users[data[:user]]
    pp client
    user = client.users[data[:user]]
    p "*" * 50
    p "*" * 50
    p "MATCH:"
    pp match
    p "*" * 50
    p "*" * 50
    User.find_or_create_by(
      team_id: user["team_id"],
      name: user["name"],
      real_name: user["real_name"],
      first_name: user["profile"]["first_name"],
      last_name: user["profile"]["last_name"],
      image_original: user["profile"]["image_original"]
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

