# www.fortyeven.com [![Build Status][badge]][circleci]

This is the source for www.fortyeven.com.

## Building

This site is done with Middleman so building can be done like:

```
$ bundle exec middleman build
```

But I made a script:

```
$ ./bin/build
```

## Deployment

It's configured to deploy from CircleCI based on an ENV var but can be deployed
locally like this:

```
$ cat .env
DEPLOY_TARGET="user@www.fortyeven.com:/var/www/fortyeven.com"
$ bundle exec rake deploy
```

This will build the site into the `build` folder and then rsync to the server.

You can skip the build and rsync directly like this:

```
$ dotenv ./bin/deploy
```

[badge]: https://circleci.com/gh/verynicecode/forty-site.svg?style=svg
[circleci]: https://circleci.com/gh/verynicecode/forty-site
