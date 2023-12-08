

Macos :
Install luarocks : brew install luarocks
Install kong : 
```
brew tap kong/deck
brew install deck
```

Build plugin : `luarocks make testplugin-0.1-1.rockspec`
Above cmd creates plugin in following directory : /usr/local/share/lua/5.4/kong/plugins/testplugin

Build docker image: `docker build --no-cache -t kong-testplugin .`

Run kong custom image : 
```
docker run -it -d --name kong-demo-testplugin \
  -p "8000-8001:8000-8001" \
  -e "KONG_DATABASE=off" \
  -e "KONG_LOG_LEVEL=debug" \
  kong-testplugin
```

Create a online mock server here : https://app.beeceptor.com/

Curl cmd to execute a request to mock server : `curl -v 'http://localhost:8000/todos' -H 'some-header: some-value'`