fs = require 'fs'
webpage = require 'webpage'
page = webpage.create()
renderedUrls = 0
totalUrls = 0

# Taken from https://github.com/ariya/phantomjs/blob/master/examples/waitfor.js
# Converted into coffee
waitFor = (testFx, onReady, timeOutMillis) ->
  maxtimeOutMillis = (if timeOutMillis then timeOutMillis else 3000) #< Default Max Timout is 3s
  start = new Date().getTime()
  condition = false
  interval = setInterval(->
    if (new Date().getTime() - start < maxtimeOutMillis) and not condition

      # If not time-out yet and condition not yet fulfilled
      condition = ((if typeof (testFx) is "string" then eval_(testFx) else testFx())) #< defensive code
    else
      unless condition

        # If condition still not fulfilled (timeout but condition is 'false')
        console.log "'waitFor()' timeout"
        phantom.exit 1
      else

        # Condition fulfilled (timeout and/or condition is 'true')
        # console.log "'waitFor()' finished in " + (new Date().getTime() - start) + "ms."
        (if typeof (onReady) is "string" then eval_(onReady) else onReady()) #< Do what it's supposed to do once the condition is fulfilled
        clearInterval interval #< Stop this interval
    return
  , 250) #< repeat check every 250ms
  return

prerenderUrls = (urls) ->
  for url in urls
    ((url) ->
      subPage = webpage.create()
      subPage.open url, ->
        content = subPage.content.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, '')

        # Wait for loading indicator to disappear. We don't want to have that in our rendered pages.
        waitFor(->
          return subPage.evaluate ->
            return document.getElementsByClassName('loading-indicator-wrapper')[0].offsetParent == null
        , ->
          el = document.createElement('a')
          el.href = url

          path = "./dist#{el.pathname}.prerender.html"
          if el.pathname == '/'
            path = "./dist/prerender.html"

          fs.write(path, content, 'w+')
          renderedUrls++

          console.info "Prerendered '#{url}' to '#{path}'"
          subPage.close()
        )
    )(url)


page.open 'http://api.proxmate.me/url/list.json', ->
  jsonSource = page.plainText
  resultObject = JSON.parse(jsonSource)
  totalUrls = resultObject.length

  # Watcher to auto close phantom after all urls have been rendered
  setInterval(->
    if totalUrls == renderedUrls
      console.info "Prerendered #{renderedUrls} urls."
      phantom.exit(0)
  , 100)

  prerenderUrls(resultObject)
  page.close()