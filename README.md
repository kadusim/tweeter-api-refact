# Support tweets

* [Most Relevants](#most-elevants)
* [Most Mentions](#most-mentions)
* [Testing with RSpec](#testing-with-rspec)

## Installation

Resource | Version
-------- | ---------
Ruby     | 2.4.1
Rails    | 5.2.0

This app runs on a docker container. The following commands are necessary to set up the environment on your machine.

Make sure you have docker and docker-compose installed.

+ Clone the project:

````bash
git clone https://github.com/kadusim/tweeter-api-refact.git
````

+ Inside the folder project. Run this follow command for install the project and up server:

````bash
docker-compose up --build
````

Application will be runing at [localhost:3000](http://localhost:3000).

## API Documentation

### MOST RELEVANTS

##### Request

````
GET api/most_relevants`
````

##### Response

````
status: 200 Ok
````

##### Errors
Status | Error                | Message
------ | ---------------------|--------
000    | -                    | -

````
Content-Type: "application/json"
````

````json
Body:
[
	{
		"screen_name": "larkin_lela",
		"followers_count": 831,
		"retweet_count": 7,
		"favorite_count": 257,
		"text": "If we reboot the application, we can get to the PCI tr @locaweb ",
		"created_at": "Mon Sep 24 03:35:21 +0000 2012",
		"profile_link": "https://twitter.com/larkin_lela",
		"tweet_link": "https://twitter.com/larkin_lela/status/474221"
	},
	{
		"screen_name": "reba_wehner",
		"followers_count": 671,
		"retweet_count": 0,
		"favorite_count": 57,
		"text": "If we override the application, we can get to the THX hard drive throug @locaweb ",
		"created_at": "Mon Sep 24 03:35:21 +0000 2012",
		"profile_link": "https://twitter.com/reba_wehner",
		"tweet_link": "https://twitter.com/reba_wehner/status/670868"
	}
]
````

### MOST MENTIONS

##### Request

````
GET api/most_mentions`
````

##### Response

````
status: 200 Ok
````

##### Errors
Status | Error                | Message
------ | ---------------------|--------
000    | -                    | -

````
Content-Type: "application/json"
````

````json
Body:
[
	{
		"v_spencer_darion": [
			{
				"screen_name": "v_spencer_darion",
				"followers_count": 968,
				"retweet_count": 2,
				"favorite_count": 0,
				"text": "@locaweb Try to transmit the USB pixel, maybe it will copy the optical driver!",
				"created_at": "Mon Sep 24 03:35:21 +0000 2012",
				"profile_link": "https://twitter.com/v_spencer_darion",
				"tweet_link": "https://twitter.com/v_spencer_darion/status/722217"
			}
		]
	},
	{
		"sr_sporer_rubie": [
			{
				"screen_name": "sr_sporer_rubie",
				"followers_count": 968,
				"retweet_count": 0,
				"favorite_count": 10,
				"text": "Use the online HDD application, then you can generate the ope @locaweb ",
				"created_at": "Mon Sep 24 03:35:21 +0000 2012",
				"profile_link": "https://twitter.com/sr_sporer_rubie",
				"tweet_link": "https://twitter.com/sr_sporer_rubie/status/510186"
			},
			{
				"screen_name": "sr_sporer_rubie",
				"followers_count": 968,
				"retweet_count": 0,
				"favorite_count": 0,
				"text": "Use the online HDD application, then you can generate the ope @locaweb ",
				"created_at": "Mon Sep 25 01:50:21 +0000 2012",
				"profile_link": "https://twitter.com/sr_sporer_rubie",
				"tweet_link": "https://twitter.com/sr_sporer_rubie/status/510186"
			}
		]
	}
]
````

## TESTING WITH RSPEC

* Execute all tests

````bash
docker-compose run --rm website rspec
````

- by [Kadu Simões](https://github.com/kadusim)
