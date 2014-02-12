## Using the GitHub API

### What it does

It its current iteration, this site allows a user to search for a github user by specifying a username.

The search returns some data about the specified user, including:
- their name
- where they live
- how many followers they have
- gravatar image
- a link to their public repos

### How it works

The site currently does not take advantage of any ruby gems to interface with the GitHub API, though they are included in the Gemfile for future extensibility.

All of the data used for the site in its current form can be obtained by submitting a GET request to the GitHub API and specifying a GitHub user.  Here is an example:

```
curl -X GET "https://api.github.com/users/mh120888"
```

