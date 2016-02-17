require 'mechanize'

class CodeChallengeScraper
  attr_reader :agent, :user_name, :password
  attr_accessor :page, :form

  def initialize(homepage = 'https://launchschool.com/')
    @agent = Mechanize.new
    @page = agent.get(homepage)
  end

  def load(email, password, challenge)
    click_link
    login(email, password)
    click_link('Challenges and Live Sessions')
    click_link(challenge)
  end

  def write_solutions_to_files
    html = page.body
    html_doc = Nokogiri::HTML(html)
    solution_count = 1
    Dir.mkdir('solutions')

    loop do
      text_doc = html_doc.at_xpath("//*[@id='main-content']/div/div[#{solution_count}]")
      text_doc.text =~ /Solution/ ? encode_text(text_doc, solution_count) : break
      solution_count += 1
    end
  end

  private

  def click_link(link = 'Sign In')
    self.page = agent.page.link_with(:text => link).click
  end

  def login(email, password, form_name = nil)
    self.form = form_name ? page.form(form_name) : page.form()
    self.form.email = email
    self.form.password = password
    self.page = agent.submit(form)
  end

  def encode_text(text_doc, solution_count)
    fp = File.new("./solutions/solution#{solution_count}.rb", 'w')
    fp.write(text_doc.text.split("\n").slice(5..-1).join("\n"))
  end
end
