# RRC Full-Stack eCommerce Project

An ecommerce store for Paper4Paper File Storage Solutions

* Ruby version 2.5.0

* Project Proposal: https://docs.google.com/document/d/1B7I9Oq9iycfKUbjLx685MRt-DwlpqZkAT0NqUmeuxAI/edit?usp=sharing

## Installation Notes
 * In order to use the image magick tool to resize images, your vagrant VM needs to be updated. 
 Running `sudo apt-get install` was enough to get this to work for me.

## Outstanding issues (For future improvments)
* Error on active admin comment delete
* Active Admin logout just redirects (no sign-out)
* Browser caching allows back navigation to restricted pages after logout
* There are some old orders in the DB which wouldn't be valid to enter now
* Colour selection for products looks awful.

## Bugs
* [fixed] Place Order > Go to product page and add a new item to cart.
You should have that item in your cart as well as a classic folder.