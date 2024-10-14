# TenantCandidates

Wrote this little rails app in a few hours just to keep track of your tenants phone, remarks, documents, pictures, appointments etc.
Basically when you put an appartment for rent a lot of people start calling + emailing. Few years ago I did this all with a simple spreadsheat.
This time around I wanted to also have a central place to keep track of files, documents and pictures for each tenant so I figured
hacking together a quick n dirty rails app would do the trick.

WARNING: Many development shortcuts were taken here just to get things done in less time.
File uploading is normally done with the excellent carrierwave gem.
However to keep things minimal and have minimal deps I just crammed the features directly into an imagescontroller that incidently both handles
uploading of files and images and also handles deleting them (without a confirmation dialog because, hey that is faster to implement ;)
For the javascript/frontend part you would use stimulus here and seperate js files into seperate files matching your views.
Or alternatively use something like vue.js and thereby making your rails app just a simple json api (but is common practice
nowadays especially in the python/fastapi world).

However again I took a lot of shortcuts here to get this done super quickly by just dumping all my js code in application.js
and using this event to work nicely together with rails turbo (that nice to have faster pageloads but the dom ready event is a bit different to classical html.erb rails apps without turbo or turbolinks).

```
function main() {
  // handle file uploading
  const form = document.getElementById("imageUploadForm");
  if (form) handlePhotoUpload(form);
  // handle copy to clipboard button
  copyClipboard("copytext");
}
// page load finished event from rails turbo
document.addEventListener("turbo:load", main);
```

All other forms and views are done using classical rails view erb templates with some partials and customized a bit with
rails bulma css. I even used the default generator with rails g and then just hacked it to my likings to make it a little more
response (just enough) so that it fits on my desktop and ancient tiny iphone screen ;).

It's definately not fully polished nor production ready and some ugly hacks were done.
Some features are missing or incomplete (for instance pagination, searching etc.)
But our specific usecases it served us nicely and we're in the final stage of selecting our new tenant
and its super easy to compare them thanks to this handy tiny rails 7 app ;).

# Features

- Create, Edit and manage tenants.
- Upload files and take photo's when connected with a smartphone.
- Generate email template with appointment and use a dirty copy to clipboard to just allow you to quickly send email replies in
  your gmail etc. Again here this was done in about 10 mins and is not complete but it did enough to save me some time typing.

# Installation

Have a recent version of ruby and rails installed on your system.
Anyway to get this up and running just git clone this repo and perform the following steps to install it.

```
bundle install
rails db:create
rails db:migrate
rails s
```
