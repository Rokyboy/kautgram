'use strict';

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var dropDown = function dropDown() {
  var input = document.getElementById('post_image');
  var area = document.getElementById('area');

  if (area) {
    area.addEventListener('dragover', function (e) {
      e.preventDefault();
      area.classList.add('post-form_dropdown--active');
    });

    area.addEventListener('dragleave', function (e) {
      e.preventDefault();
      area.classList.remove('post-form__dropdown--active');
    });

    area.addEventListener('drop', function (e) {
      e.preventDefault();
      var file = e.dataTransfer.files;
      input.files = file;
      readFile(file);
    });

    input.addEventListener('change', function (e) {
      var file = e.target.files;

      if (file) {
        area.classList.add('post-form__dropdown--active');
        readFile(file);
      } else {
        area.classList.remove('post-form__dropdown--active');
      }
    });
  }
};

var readFile = function readFile(file) {
  if (file.length) {
    (function () {
      var fileReader = new FileReader();
      fileReader.onload = function () {
        var img = document.createElement('IMG');
        var rBtn = document.createElement('SPAN');
        if (!document.querySelector('.inserted-img')) {
          img.setAttribute('src', fileReader.result);
          img.className = 'inserted-img';
          rBtn.id = 'removeImg';
          rBtn.setAttribute('onclick', 'removeImg()');
          rBtn.innerHTML = 'Remove';
          document.getElementById('area').appendChild(img);
          document.getElementById('area').appendChild(rBtn);
        }
      };
      fileReader.readAsDataURL(file[0]);
    })();
  }
};

var removeImg = function removeImg() {
  var rBtn = document.getElementById('removeImg');
  var area = document.getElementById('area');
  var img = document.querySelector('.inserted-img');

  area.removeChild(img);
  area.removeChild(rBtn);
  area.classList.remove('post-form__dropdown--active');
};

window.addEventListener('DOMContentLoaded', dropDown);