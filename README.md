# launchschool-code-challenge-scraper

This is a scraper that is used to download the launchschool coding challenges solutions. This makes use of the `mechanize` gem to navigate the launch school website. I've included a sample usage of the scraper in the repository. It scrapes the `meetup challenge`.


#### Methods

`#new(page)`
Creates an instance of the CodeChallengeScrape class. It takes in a `homepage string` as an argument. It should point to the homepage url of launchschool. If no value is given it defaults to https://launchschool.com/.

`#load(email, password, challenge)`
Loads the challenge that you want to scrape solutions from. It needs your `email`, `password`, and the `link name` of the challenge that you want to scrape.

`#write_solutions_to_files`
Runs the parser and saves the solutions to a solutions folder.


**NOTE**
For comments, bugs, and suggestions don't hesistate to get in touch with me at <vpaoloreyes@gmail.com>

Feel free to fork/clone it if you want. Open also to collaborating on it for improvement (though I'm not familiar with it on how to do it with git =p).
