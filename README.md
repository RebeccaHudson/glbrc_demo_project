# README
# glbrc_demo_project

Solution to a simple programming assignment for GLBRC.

Rails version: 5.1
Ruby version : 2.2.5

This is a contrived application that allows a user to log in and view some graphic links to web pages.
Each user can add, move, and remove links on their Home page. That's the whole thing.

How to run the application:
 
   1. Clone the git reposiotry to your machine.

   2. Navigate to the project root directory and run 'bundle install'.

   3. Setup the database by copying the sqlite3 file.
      cp db/sample-data.sqlite3 db/development.sqlite3
         
   4. Run the command 'rails server'.

   5. Open a web browser and view the URL 0.0.0.0:3000
