// Main application JS.
// Author: Walter Schreppers
// Configure your import map in config/importmap.rb.
// Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

function handlePhotoUpload(form) {
  form.addEventListener("submit", async (event) => {
    event.preventDefault(); // Prevent the default form submission

    const formData = new FormData(form);

    try {
      const response = await fetch(form.action, {
        method: "POST",
        body: formData,
        headers: {
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
            .content, // Add CSRF token
        },
      });

      if (response.ok) {
        // const result = await response.json();
        console.log("upload ok doing page refresh to reload images");
        window.location.reload();
      } else {
        console.log("upload error");
      }
    } catch (error) {
      console.error("Error uploading image:", error);
    }
  });
}

function showText() {
  console.log("showText called...");
  let email_text = document.getElementById("email_template");
  email_text.setAttribute("display", "block");
}

function copyClipboard(copy_btn_id) {
  let copy_btn = document.getElementById(copy_btn_id);

  if (copy_btn) {
    copy_btn.onclick = function () {
      let email_text = document.getElementById("email_template");
      showText();
      email_text.focus();
      email_text.select();
      document.execCommand("copy");
    };
  }
}

// called on each page load
function main() {
  // handle file uploading
  const form = document.getElementById("imageUploadForm");
  if (form) handlePhotoUpload(form);

  // handle copy to clipboard button
  copyClipboard("copytext");
}

// document.addEventListener("DOMContentLoaded", () => {
//});

// page load from rails turbo
document.addEventListener("turbo:load", main);
