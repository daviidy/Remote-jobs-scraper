# Remote-jobs-scraper
Web scraper to get all the remote software development jobs on [remote.io](https://remotive.io)
We used Nokogiri gem

![screenshot](./screenshot.png)

## Built With

- Ruby
- Nokogiri gem

## Getting Started

My main goal when I joined Microverse was to get a remote job. So I decided to build a scraper to get all the remote software development jobs available on remotive.io
This website is one of the very famous websites about remote jobs.

### Installation

**To get this project set up on your local machine, follow these simple steps:**

- Clone the github repository https://github.com/daviidy/Remote-jobs-scraper/tree/feature-branch on your local machine
- Cd into the clone folder
- Set `bin/main.rb` as executable file
- Open your terminal and run `bin/main.rb`

### How to use the scraper

1- Enter your name to start

```
λ .\bin\main.rb
Hello, what's your name?

```
2- After, choose a number n > 0. This number represents the number of results you will get per page

```
λ ruby bin\main.rb
Hello, what's your name?
dave
dave here is the list of available remote software developement jobs on remote.io!
How many jobs do you want to see per page ? Choose a number > 0

```
3- You will see the n first remote software development jobs available on remotive.io, with the job title, the employer and the link of the job description.
You can type `yes(y)` to see the next n jobs or `no(n)` to exit the scraper

```

How many jobs do you want to see per page ? Choose a number > 0
3
[DEPRECATION] HTTParty will no longer override `response#nil?`. This functionality will be removed in future versions. Please, add explicit check `response.body.nil? || response.body.empty?`. For more info refer to: https://github.com/jnunemaker/httparty/issues/568
C:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/nokogiri-1.10.10-x64-mingw32/lib/nokogiri/html/document.rb:199:in `parse'
Loading...
1- Engineering Manager (m/f/d): cargo.one· Remote (Selected Countries)
Link: https://remotive.io/remote-jobs/software-dev/engineering-manager-m-f-d-288515

    ======================================

2- Senior Node.js Developer: Flyp· Remote (Europe Only)
Link: https://remotive.io/remote-jobs/software-dev/senior-node-js-developer-287632

    ======================================

Continue ? yes(y) or no(n)

```

## Live Demo
[Click this link to play](https://repl.it/@daviidy/Remote-jobs-scraper)

## Testing

We used Rspec for testing our Scraper

**What does this do?**

- Test public methods created in Tic Tac Toe project

**Description of Task to be completed**

We checked if all the scraper methods return the right data

**How should this be manually tested?**

Clone this repo https://github.com/daviidy/Remote-jobs-scraper/tree/feature-branch
Navigate to the project directory.
install rspec with `gem install rspec` and then run `bundle install` to install all packages in gemfile
And finally run `rspec --format d` to run the tests

## Author

👤 **David Yao**

- Github: [@daviidy](https://github.com/daviidy )
- Twitter: [@DavidYao3](https://twitter.com/DavidYao3)
- Linkedin: [@DavidYao](https://www.linkedin.com/in/david-yao-6bb95299/daviidy )


## Show your support

If you've read this far, pls give us a ⭐️!

## Acknowledgments

- My thanks also goes to Microverse and all our peers and colleagues there.
