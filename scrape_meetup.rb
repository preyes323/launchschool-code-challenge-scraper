require_relative 'codes_scraper.rb'

meetup_challenge = CodeChallengeScraper.new
begin
  meetup_challenge.load('email', 'password', '02/13/16 - Challenge: Meetup')
  meetup_challenge.write_solutions_to_files
rescue
  puts 'Please check your inputs: email, password, and challenge to load'
end
