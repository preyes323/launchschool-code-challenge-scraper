require_relative 'codes_scraper.rb'

meetup_challenge = CodeChallengeScraper.new
meetup_challenge.go_to_challenge_page('vpaoloreyes@gmail.com', 'Rachelle_0329', 'https://launchschool.com/gists/9ba29fa3')
meetup_challenge.write_solutions_to_files
