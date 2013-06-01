## Twity - A command line twitter client
Author - Deep

### Installation

first install the required gems
	
	gem install twitter_oauth
	gem install colored

Then clone the repository
	
	git clone git@github.com:monideeps99/twity.git

Visit https://dev.twitter.com/apps and register a new application.

On the application settings page, click "Create my access token" to generate an access token and secret.

Copy the values for consumer key, consumer secret, access token, and access secret into the example.

Edit your ~/.profile file and add a new alias:

    alias twitter='ruby /your/path/command-line-twitter-client.rb'

Reload your ~/.profile:

    source ~/.profile

### Usage
type 'twity' to see all available usage options

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




