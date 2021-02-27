---
id: 3
title: Building Forty In The Open
---

I've built Forty in the open using public GitHub repos because I believe in the
ideas of the [Open Source by Default][osbd] movement. There are three main repos
that might interest you: [forty-site][], [forty-web][] and
[forty-time-management][]. Here I'll summarize these projects and how I've used
them to build the application. I can talk freely about all this stuff because
they are open source - my favorite part of embracing Open Source by Default!!

<!-- READ-MORE -->

## forty-site

The marketing site for Forty is built using the static site generator
[Middleman][]. I'm using the [blog extension][mm-blog] and then I deploy it to
[Digital Ocean][do] using [CircleCI][] and [rsync][]. Easy.

## forty-web

The Forty web app is setup on the `app` subdomain and the marketing site links
to it. It's a [Rails application][rails] deployed to [Heroku][]. It uses
[Postgres][] for persistence, [Sidekiq][] for background jobs and takes
advantage of [React][] for a couple complex interactions.

I've integrated with Stripe for payment, specifically their [Stripe
Elements][elements] product that has great React support. I'm using the
[Webpacker gem][Webpacker] and that pipeline to serve React components authored
in [Typescript][].

For testing I use [RSpec][] and [Jest][]. There's some system tests that spin up
headless Chrome using the [Webdrivers gem][Webdrivers] to simulate user behavior
and on the other end I have [Enzyme][] setup so I can get good unit tests around
the React component stack.

## forty-time-management

This is an interesting little project! The goal here is to ensure consistent
behavior across Ruby and Typescript when it comes to dealing with time amounts.
The problem to solve is that I use Ruby on the server and Typescript on the
client for the same operations. If I'm going to add up ones time for a given
week, I better get the same total on the server as I do on the client.

My approach to this problem was to create a single repo that produces both a
Ruby gem and an NPM package. I wrote tests for each language so I can evolve my
business logic but ensure each language behaves the same. They are published in
unison using CircleCI.

For example, I have [a Ruby class called `FortyTime`][ruby-forty-time] that
implements `to_s` to convert some number of minutes into a nicely formatted
string. I have the same sort of thing [in Typescript with a class also called
`FortyTime`][ts-forty-time] that has a `toString` function. I drove out both of
these implementations with tests that match and now I can ensure whether I'm in
Ruby or Typescript that going from minutes to strings will work consistently.

## Working in the Open

Having these repos public on GitHub means I'm working in the open and that frees
me to talk about the code that I've built in whatever way I want. It's like a
free source of content marketing ideas! And should I want to impress a potential
employer at some point they'll be able to see exactly how I've built my side
hustle down to the PRs I write to myself.

[osbd]: https://code.dblock.org/2015/02/09/becoming-open-source-by-default.html
[forty-web]: https://github.com/verynicecode/forty-web
[forty-site]: https://github.com/verynicecode/forty-site
[forty-time-management]: https://github.com/verynicecode/forty-time-management
[rails]: https://rubyonrails.org/
[Heroku]: https://www.heroku.com/
[Postgres]: https://www.postgresql.org/
[Sidekiq]: https://sidekiq.org/
[React]: https://reactjs.org/
[elements]: https://stripe.com/docs/stripe-js
[Webpacker]: https://github.com/rails/webpacker
[Typescript]: https://www.typescriptlang.org/
[RSpec]: https://rspec.info/
[Jest]: https://jestjs.io/
[Webdrivers]: https://github.com/titusfortner/webdrivers
[Enzyme]: https://enzymejs.github.io/enzyme/
[Middleman]: https://middlemanapp.com/
[mm-blog]: https://middlemanapp.com/basics/blogging/
[do]: https://www.digitalocean.com/
[CircleCI]: https://circleci.com/
[rsync]: https://en.wikipedia.org/wiki/Rsync
[ruby-forty-time]: https://github.com/verynicecode/forty-time-management/blob/291f6c0c83ad63f3b1752a347ab615a5b4261b49/ruby/lib/forty_time.rb#L44-L56
[ts-forty-time]: https://github.com/verynicecode/forty-time-management/blob/291f6c0c83ad63f3b1752a347ab615a5b4261b49/typescript/src/FortyTime.ts#L36-L51
