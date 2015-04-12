fs = require 'fs'
webpage = require 'webpage'
page = webpage.create()
renderedUrls = 0
totalUrls = 0

prerenderUrls = (urls) ->
  for url in urls
    ((url) ->
      subPage = webpage.create()
      #subPage.onConsoleMessage = (msg) ->
      #  console.log(msg);

      subPage.open url, (status) ->
        interval = null
        interval = setInterval =>

          foo = subPage.evaluate =>
            # First, retrieve the container
            container = document.getElementsByClassName('container')[0]
            # next the loading indicator (aka first div)
            indicator = container.getElementsByTagName('div')[0]
            foo = container.getElementsByClassName('ng-scope').length;

            # next, check if it contains 'ng-hide', which means it has been hidden
            if foo == 0 or !indicator.classList.contains('ng-hide')
              return false
            return true


          # Prerender action!!!
          if foo == true
            clearInterval(interval) # this is important, otherwise it will keep on evaluating
            content = subPage.content

            # To quickly get the path of the url, we generate a tag and go over the href api
            el = document.createElement('a')
            el.href = url
            urlpath = el.hash.split("#!")[1]

            path = "./dist#{urlpath}/index.html"
            # In case the website is a root page (a.k.a http://google.com/ and not google.com/index.html)
            if urlpath == '/'
              path = "./dist/index.html"

            fs.write(path, content, 'w')

            renderedUrls++
            console.info "Prerendered '#{url}' to '#{path}'"
            subPage.close()

        , 1000

    )(url)

page.open 'https://api.proxmate.me/url/list.json', ->
  jsonSource = page.plainText
  resultObject = JSON.parse(jsonSource)
  totalUrls = resultObject.length

  # Watcher to auto close phantom after all urls have been rendered
  setInterval(->
    if totalUrls == renderedUrls
      console.info "Prerendered #{renderedUrls} urls."
      phantom.exit(0)
  , 1000)

  prerenderUrls(resultObject)
  page.close()
