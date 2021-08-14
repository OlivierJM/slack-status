# slack-status


<!-- Install selenium webdriver -->
<!-- make sure it is in your path -->
<!-- get slack auth token -->
Inspiration:
Being in places where Internet connectivity is not always assured, it comes and goes, it is a good practive for your team to know your current status

Features:
- check internet speed using fast.com
- if it is low (`< 1mbps`) update slack status

Requirements:
- Selenium webdriver
- Ruby v2^
- Slack token


Possible usage:
- can be put in your cron job to be run in a 30mins interval

TODO:
- Refactor the code to remove the "@"
- Use a headless browser - urgent
- If the internet is above 1mbps it should clear the status
