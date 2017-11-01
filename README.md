# Cory Fauver's Code Challenge Solution

### Setup

To get the app working, clone the repo, `bundle`, run `rails db:create`, `rails db:migrate`, and then `rails db:seed`.

At this point, run `rails s` to serve the application and go to `localhost:3000` to see the landing page. This has a "sample email" with a link to the form that I built for the challenge. That form will be capable of editing a user's notification settings.

Once you submit, the form currently redirects to the users index page at `/users`. This is for the sake of the demo, so that you can see your changes have taken place on the relevant user, but would not be the setup I'd use for a deployed app.

### Navigating the codebase

The setup of this app is a bit more built out than requested. I imagined that the requested `/notification-settings` route would typically be accessed by following a link *from the bottom of an email*. This user would not need to sign in to adjust their account settings because of the token and email pair that could verify their identity. Because of that, I left room for a normal `/users/:id/edit` route in case you also wanted another similar form that would allow a signed-in user to edit their name and other possible user details.

This meant that I felt the `/notification-settings` form should live in its own sphere separate from the `UsersController`. Accordingly, I built a `NotificationsController`, and a `NotificationForm` object (found in [`app/forms/notifications_form.rb`](/app/forms/notification_form.rb)) based on the material I found [in this railscast](http://railscasts.com/episodes/416-form-objects?autoplay=true).

### Next steps

While I finished the basic requirements laid out in the spec sheet, there are a few steps ahead that I would complete next, if given more time.

1. **Add testing** Both the models and the form I created need testing. I'd hope to follow the advice here and "[Write tests. Not too many. Mostly integration.](https://blog.kentcdodds.com/write-tests-not-too-many-mostly-integration-5e8c7fff591c)
2. **Add Styles** I'd love to integrate bootstrap, materialize, or another styling framework to polish up the appearance of the form and the site in general.
3. **Refactoring** Among other simplifications and polishing, I'd hope to add more unified error messaging that would pass more informative messages around the application.

### Remaining questions

1. **Should the user have a foreign key that refers to the token?** I elected to give the token model a column to refer to the user, but not the other way around. My idea was that
2. **Should the token model's `generate` method be type checking the `user` input?** It seems that ActiveRecord models are pretty good about giving useful error messages and that developers will be the only ones calling `generate`. It seems like type checking the input is redundant.
3. **Is a form object too complex for this use case?** I thought that the `/notifications-settings` route would have a form similar enough to the `/users/:id/edit` route. That route would only be accessible when users are signed in. The `/notifications-settings` route's needs would bloat the `user` model if it weren't further separated.
4. **Should the `/notification-settings` query params be route params?** I generally prefer route params like `/notification-settings/:email/:token` because they allow for fewer characters and less explicit access to the user looking at the url.  
