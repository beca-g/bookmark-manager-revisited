Bookmark Manager
================

A bookmark manager to save and maintain a collection of bookmarks (URLs) where a user is able to save a useful webpage, add tags to the webpages saved to find them later, browse saved bookmarks of other users and comment on the bookmarks. 

User Stories
============
```
As a user
So I can revisit websites with ease
I would like to view a list of my saved bookmarks
```
```
As a user 
So I can save a website for later
I would like to save a new bookmark
```
```
As a user 
So I can remove bookmarks that I no longer need
I would like to delete a bookmark
```
```
As a user 
So I can edit exisiting bookmarks 
I would like to update a bookmark
```
```
As a user 
So I can save notes about my bookmarks for later
I would like to comment on a bookmark
```
```
As a user 
So that I can organise my bookmarks,
I would like to add a tag to my bookmarks
```

## Initial Domain Model
![domain_model](https://i.imgur.com/I622wp4.png)

Getting started
================

### Setup

From the command line run the following:
```
git clone git@github.com:beca-g/bookmark-manager-revisited.git
cd bookmark-manager-revisited
```
### Install dependencies
```
bundle
```

### Database set up

Connect to `psql` abd create the `bookmarks` and `bookmarks_test` datatbases:

```
CREATE DATABASE bookmarks;
CREATE DATABASE bookmarks_test;
```

To set up the datatbase tables connect to each database in `psql` abd rub the SQL scripts in the db/migrations folder in the given order.


### To run the Bookmark Manager app:
```
rackup -p 3000
```

To view bookmars, navigate to `localhost:3000/bookmarks`.

### To run tests:
```
rspec
```

### To run linting:
```
rubocop
```

