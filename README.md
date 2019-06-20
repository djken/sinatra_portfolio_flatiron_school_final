# E-Schedule — A Sinatra Project

E-Schedule is an application built using Sinatra Framework. It is an application that allows you to keep track of your different meetings, register the anniversary of your friends and your family and also take notes wether you want to.

## Different options are given such as:

1. User Sign Up and Login authentification.

Every single user who registers will be able to manage his or her own account independently, e.i, any other user won’t have access to view your information.

2. Every single user will be able to Create, Read, modify and Update, and also delete meetings. And, the same thing is true for a registered birthday.

3. This application allows a user to switch easily from the meeting page to birthday page and also to the note page.

### How to build this application

To build such application, you will to have knowledge in HTML, CSS, Ruby, Sinatra, ActiveRecord, and also Git if you want to place your work on an online repository.

## How MVC (Model-View-Controller) is implemented in this Application.

### Models

You'll need to create three models in `app/models`, one `User` model, one `Meeting` and one `Birthday`. The three classes should inherit from `ActiveRecord::Base`.

### Migrations

You'll need to create three migrations to create the users and the meetings and the birthdays table.

Users should have a username, email, and password, and can create many meetings and birthdays.

Meetings and Birthdays should have content, belong to a user.

### Associations

You'll need to set up the relationship between users and meetings, and Users and birthdays. Think about how the user interacts with the meetings and birthdays, what belongs to who?

## Meeting

### Create Meetings

You'll need to create two controller actions, one to load the create meeting form, and one to process the form submission. The meeting should be created and saved to the database. The form should be loaded via a GET request to `/meeting/new` and submitted via a POST to `/meetings`.

### Show Meeting

You'll need to create a controller action that displays the information for a single meeting. You'll want the controller action respond to a GET request to `/meetings/:id`.

### Edit Meeting

You'll need to create two controller actions to edit a meeting: one to load the form to edit, and one to actually update the meeting entry in the database. The form to edit a meeting should be loaded via a GET request to `/meetings/:id/edit`. The form should be submitted via a POST request to `/meetings/:id`.

You'll want to create an edit link on the meeting show page.

### Delete Meeting

You'll only need one controller action to delete a meeting. The form to delete a meeting should be found on the meeting page.

The delete form doesn't need to have any input fields, just a submit button.

The form to delete a meeting should be submitted via a POST request to `meetings/:id/delete`.

## Birthdays

You need to do the same thing for the birthdays.

### Sign Up

You'll need to create two controller actions, one to display the user signup and one to process the form submission. The controller action that processes the form submission should create the user and save it to the database.

The form to sign up should be loaded via a GET request to `/signup` and submitted via a POST request to `/signup`.

The signup action should also log the user in and add the `user_id` to the sessions hash.

Make sure you add the Signup link to the home page.

### Log In

You'll need two more controller actions to process logging in: one to display the form to log in and one to log add the `user_id` to the sessions hash.

The form to login should be loaded via a GET request to `/login` and submitted via a POST request to `/login`.

### Log Out

You'll need to create a controller action to process a GET request to `/logout` to log out. The controller action should clear the session hash
