# Websocket examples

## Usage

Socket servers are in sockets/. There's a Sinatra site with pages that listen to different socket servers.

Start one or more socket server examples.

    ruby sockets/multicast.rb
    
Based on http://github.com/ismasan/websockets_examples.git

Start the site:

    rackup -p 3000
    
Navigate to localhost:3000. You should see an index of available examples.

## Installation

You'll need the Bundler gem installed to manage dependencies.

    gem install bundler
    
Now you can clone and install dependencies

    git clone http://github.com/damianmarti/websocket-examples
    cd websocket_examples
    bundle install