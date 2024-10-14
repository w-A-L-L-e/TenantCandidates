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

Anyway just git clone this repo.
Then do following steps to install it.
```
bundle install
rails db:create
rails db:migrate
rails s
```

It's definately not fully polished and some features are missing or incomplete but for our purposes it served us nicely and we're in the final stage of selecting our new tenant and its super easy to compare them thanks to this handy rails 7 app ;).

