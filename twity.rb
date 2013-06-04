#!/usr/bin/env ruby
require 'rubygems'
require 'twitter_oauth'
require 'colored'

client = TwitterOAuth::Client.new(
	:consumer_key 	 => 'CONSUMER_KEY',
	:consumer_secret => 'CONSUMER_SECRET',
	:token 		 => 'ACCESS_TOKEN',
	:secret 	 => 'ACCESS_SECRET')

case ARGV[0]

	when "-timeline"

		if ARGV[1].nil?
			count = 10
		else
			count=ARGV[1]
		end

		timeline = client.home_timeline({"count" => count})

		timeline.each do |tweet|
			puts "#{tweet['user']['name'].bold.yellow} @#{tweet['user']['screen_name']} \n#{tweet['text'].bold} \n \n"
		end

	when "-update"

		if ARGV[1].nil?
			puts "Enter your status:"
			status = STDIN.readline.chomp
			client.update("#{status}")
		else
			client.update("#{ARGV[1]}")
		end

	when "-tweets"

		my_timeline = client.user_timeline

		if my_timeline.empty?
			puts "It's lonely here.. "
		else
			my_timeline.each do |tweet|
				puts "#{tweet['user']['name'].bold.yellow} @#{tweet['user']['screen_name']} \n#{tweet['text'].bold} \n \n"
			end
		end

	when "-list-followers"

		followers =client.followers

		if followers.empty?
			puts "its lonely here"
		else
			followers.each do |person|
				puts "#{person['screen_name'].bold.green} \n"
			end
		end

	when "-message"

		if ARGV[1].nil?
			puts "Enter user name"
			user = STDIN.readline.chomp
		else
			user = ARGV[1]
		end

		if ARGV[2].nil?
			puts "Enter message"
			text = STDIN.readline.chomp
		else
			text =  ARGV[2]
		end

		client.message(user,text)

	when "-list-messages"

		messages=client.messages

		if messages.empty?
			puts "It's lonely here! \n"
		else
			messages.each do |msg|
				puts "#{msg['recipient_screen_name'].bold.yellow} \n#{msg['text'].bold} \n \n"
			end			
		end

	when "-sent-messages"

		sent_msg =client.sent_messages

		if sent_msg.empty?
			puts "It's lonely here! \n"
		else
			sent_msg.each do |msg|
				puts "#{msg['sender_screen_name'].bold.yellow} \n#{msg['text'].bold} \n \n"
			end			
		end

	else
		STDOUT.puts <<-EOF
		Twity App a command line twitter client
		Author - Monideep Purkayastha
		contact - deep2tech@gmail.com

		usage:

		twity -timeline
		Returns the 20 most recent statuses from non-protected users

		twity -tweets
		Returns the 20 most recent statuses, including retweets, posted by the user

		twity -update "I'm tweeting from the command line"
		Post a new tweet

		twity -list-followers
		Returns the list of followers

		twity -message @deep_cs "Your message"
		Sends a new direct message to the specified user

		twity -list-messages
		Return the most recent direct messages sent to your

		twity -sent-messages
		returns a list of the 20 most recent direct messages sent by the authenticating user.

		EOF


end
