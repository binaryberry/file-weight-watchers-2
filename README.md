# file-weight-watchers-2
An app allowing to display the weight and gravity of files stored on a cloud computing platform. Available online [here](https://the-file-weight-watchers.herokuapp.com) on Heroku.

##How does it work?

When the user logs in to the app, his details are sent to the cloud computing platform's API for authentication. If the authentication is successful, he receives an authentication token which is saved in his browser's cookies.

The user is then redirected to a page that displays the data from the files saved on the cloud computing platform. Another API call is sent, with the authentication information previously saved in the browser's cookies, and the app receives the metadata from all of the user's files. 

This metadata is then processed by the file_list class, which calculates for each file type (texts, videos, songs, binary, documents, other) the weight of the files with gravity and their number, as well as the total weight of all files (with gravity) and the gravity displacement. All the numbers are rounded up to the nearest 0.05.


##What technologies did I use?

In Ruby, using the Sinatra DSL. It was (light) BDD-ed using cucumber and capybara and TDD-ed using Rspec, then I added some CSS and pushed it to Heroku. For debugging binding.pry was of great help, and rest-client facilitated the API calls.

##What did I learn?

I learned how to get an authentication token through an API call, and how to save that token in the cookies. I also learned how to require that token from the cookies to make an API call that requires authentication.

I learned how to parse and process a large metadata file, extracting only the information I needed.

##How can I see the tests?
In the command line, clone the repo, run bundle, then simply run rspec and/or cucumber.
