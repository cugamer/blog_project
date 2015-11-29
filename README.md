Blog project
============

This is a simple exercise to get my Rails skills back up to par.  It's quite simple, 
just a basic blog app where users can create an account, view other users posts, 
create a feed of other users post, create, edit and delete their own posts, and 
submit comments.  As this is a basic learning exercise the site is not overly complex,
nor does it use many advanced technologies.  Also, it is incomplete, several important
aspects of the site are missing.

To get this up and running
--------------------------
_Note: This project was built in the Ruby development environment at https://c9.io/.
This simulates an IDE built on Unix.  This project should run properly on any *nix
machine (Linux, MacOS X, etc.) but getting this to work on Windows is difficult due 
to lack of support of the necessary tools.  If the user has any difficulties, I
recommend creating a Cloud9 account (seriously, it's awesome) and uploading the 
project there._

1. Clone the project.  
2. Make sure you have Ruby installed.  If not, get it [here](https://www.ruby-lang.org/en/downloads/). 
3. From the command line make sure you have bundler installed by entering "gem install bundler"
4. Navigate to the root folder of the project.
5. Run "bundle install" and rake db:migrate to set things up.
6. Run "rails server" to get things running.  On Cloud9 run "rails s -b $IP -p $PORT"
7. Open your browser and navigate to "http://localhost:3000"  There you should see
the page.  If you are running this on Cloud9 the URL will be different, the terminal
will show you the correct URL
8. When you're done, simply hit ctrl/cmd + c to quit the server.

Components used
---------------
* Ruby on Rails
* BCrypt
* Will_paginate
* Faker
* Sass CSS
* Bootstrap

Still to do
-----------
* Implement persistent user sessions
* Implement threaded comments
* Implement support for user uploaded images
* Implement support for user editing of profile
* Add automated testing