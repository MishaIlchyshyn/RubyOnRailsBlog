Clone this repo.

Run:
1) bundle install;
2) rake db:migrate;
3) rake db:seed;
4) rails s;

A simple Blog where you can create, edit, delete, add to favorites posts, and view list posts. On the "show" page, you can add comments to post. On create post page you can select date when your post will be create. 
Also you can log in as admin with these credentials (before you need to run "rake db:seed"): email: admin_test@gmail.com, password: password. 
In admin panel you can see all posts and comments. As the admin, you can export posts or comments in .csv or .xls formats and also import your files to lists posts or comments. 
Also you can register your own accaunt.
