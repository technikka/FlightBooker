# Flight Booker

A simple app to book a one way flight for up to 4 passengers. It's an assignment from [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker) to practice advanced form techniques. There is no simulation of payment and flight/passenger details are kept to a minimum.  

This project serves as a nice example for:

* using #accepts_nested_attributes_for method to give a model the functionality to create another model's object with arguments.

* using the form helper 'fields_for' to accept attributes for the nested data. In this project it's used in conjunction with the BookingsController building the specified number of passengers on the booking object, which then allows fields_for to auto render its form fields once for each passenger object, and sending them back to the server in an indexed hash.

* using the select_tag along with options_for_select (remember, this needs an array of arrays passed to it!), for a quick and concise way of prepopulating select elements with model data.

* having multiple get requets on one page needing to be routed to different controllers.

* seeding the database

* interesting model associations

* working with datetime methods

## Method placement

I'm still working on understanding where certain functionality should be placed, whether in the controller, view or model. In this project I kept the controllers slim and put query functionality in the model. I know that's right. I think my biggest question is about having formatting helpers in the model. It seems the view would be the more appropriate place, but having it in the model keeps the code DRY. 