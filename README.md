# RRC Full-Stack eCommerce Project

An ecommerce store for Paper4Paper File Storage Solutions

* Ruby version 2.5.0

* Project Proposal: https://docs.google.com/document/d/1B7I9Oq9iycfKUbjLx685MRt-DwlpqZkAT0NqUmeuxAI/edit?usp=sharing
---

## Installation Notes
 * In order to use the image magick tool to resize images, your vagrant VM needs to be updated. 
 Running `sudo apt-get install` was enough to get this to work for me.
---

## Outstanding issues
* Error on active admin comment delete
* Active Admin logout just redirects (no sign-out)
* Browser caching allows back navigation to restricted pages
* Missing quantity field in product purchase form
* Does Active Admin need to be responsive and usable on small devices?
* Why don't the product cards in the search results use horizontal space?
* Consider moving _cart_item.html.erb and _invoice_item.erb to the views/order_items folder. 
