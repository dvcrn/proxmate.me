# The code has been moved. This version is no longer maintained.

# proxmate.me
[![Built Status](https://travis-ci.org/dvcrn/proxmate.me.png "Build Status")](https://travis-ci.org/dvcrn/proxmate.me/)

This is the sourcecode for the [proxmate.me](https://proxmate.me). proxmate.me has been designed to be completely static and can be served by any static webserver (such as s3). 

## Serving

Run `grunt serve` to spawn a static, self-reloading webserver. 

## Building

We are using Grunt for building. Make sure you have all dependencies (bower + npm) installed, then run `grunt build`. 
To deploy to s3, make sure that `grunt-aws.json` contains your aws credentials, then run `grunt deploy`. 

## Prerendering

Since javascript is hard to index, proxmate.me is using a prerender script to generate static html pages that are being served. To prerender, make sure that your latest source is deployed somewhere (s3 for example), then execute `grunt freeze`. This will generate a static html for every html page listed inside [api.proxmate.me](https://api.proxmate.me/url/list.json). 

## Contributing

- make sure that your code is tested
- make sure all existing unit tests pass (`grunt test`). 
