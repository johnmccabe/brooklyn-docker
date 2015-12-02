# brooklyn-docker
Brooklyn Docker Image

## Exposed ports
- `8081` - Brooklyn JSGui

## Volumes
- `/root/.brooklyn` - brooklyn.properties etc
- `/root/.ssh` - ssh keys
- `/root/.brooklyn-persistance` - Brooklyn persistance data 

## Usage
Start with default user (docker:docker):
```
docker run -d -P docker/brooklyn
```

Start with a custom user/password and mapping the UI to port 80(note the username appears in the password environment variable):
```
docker run -d -p 80:8081 \
  -e "brooklyn.webconsole.security.users=bob" \
  -e "brooklyn.webconsole.security.user.bob.password=bobspassword" \
  johnmccabe/brooklyn
```

Start with all volumes mapped to local dirs:
```
docker run -d -P \
  -v ~/.brooklyn:/root/.brooklyn \
  -v ~/.ssh:/root/.ssh \
  -v ~/.brooklyn-persistance:/root/.brooklyn-persistance \
  johnmccabe/brooklyn
```

Start with arbitrary additional Brooklyn properties passed via envvars, for example to pass jclouds credentials:
```
docker run -d -P \
  -e "brooklyn.location.jclouds.softlayer.identity=username" \
  -e "brooklyn.location.jclouds.softlayer.credential=XXXXXXXXXXXXXXXXXXXXX" \
  -e "brooklyn.location.named.softlayer-ams01=jclouds:softlayer:ams01" \
  johnmccabe/brooklyn
```