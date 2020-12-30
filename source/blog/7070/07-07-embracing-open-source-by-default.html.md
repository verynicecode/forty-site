---
title: Embracing Open Source By Default
---

With Forty I have taken to embracing the ethos of the Open Source By Default
movement.

<!-- READ-MORE -->

## forty-web

The main app for Forty is a Rails application deployed to Heroku that takes
advantage of a little React for a couple complex interactions.

## forty-site

The marketing site, this very site you are reading this post on, is built using
the static site generator Middleman. I'm using the blog extension and then I
deploy it to Digital Ocean using CircleCI and rsync.

## forty-time-management

This is an interesting little project I put together to share some code and
idioms between Ruby and Typescript. I guess that means it's sort of a monorepo
in that it contains two projects, but they are so related I couldn't see
splitting them up. So yeah, there's a Ruby and a Typescript folder and each
contain the Ruby Gem and JS package that I then pull into forty-web. It was
handy to think about some of these problems in isolation like this, but strictly
speaking it was probably not necessary to do it this way.

Still, I learned a lot and it was a fun challenge to put this project together!
