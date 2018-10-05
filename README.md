# Activities and Friendships

A Backend service that serves sport activities and friends. The data is stored
in-memory and is loaded from JSON files, which can be generated with a script
(see below).

## Setup

Run `bundle`


## Run the server

`rackup -p <port>`


## Run the data generator

Data is already checked in and ready to use in the folder `data`.

However, if you want to generate new data, just run:

`ruby scripts/generate_data.rb`