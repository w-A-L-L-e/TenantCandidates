# TenantCandidates

Wrote this little rails app in a few hours just to keep track of your tenants phone, remarks, documents, pictures, appointments etc.
Basically when you put an appartment for rent a lot of people start calling + emailing. Few years ago I did this all with a simple spreadsheat.
This time around I wanted to also have a central place to keep track of files, documents and pictures for each tenant so I figured
hacking together a quick n dirty rails app would do the trick.

Many shortcuts were taken here just to get things done.
File uploading is normally done with the carrierwave gem however to keep things minimal and have minimal deps I just used a controller with some inline code to save and manage the uploaded files.
For the javascript/frontend part you would use stimulus here and seperate js files into seperate files matching your views (or alternatively use something like vue.js and thereby making the rails app just a simple json api). However again I took a lot of shortcuts here to get this done super quickly by just dumping all my js code in application.js and using this event to work nicely together with rails turbo (that nice to have faster pageloads but the dom ready event is a bit different to classical html.erb rails apps without turbo or turbolinks).

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

It's definately not fully polished nor production ready. Some features are missing or incomplete etc.
But for our purposes it served us nicely and we're in the final stage of selecting our new tenant
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
