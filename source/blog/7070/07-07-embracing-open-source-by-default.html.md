---
title: Embracing Open Source By Default
---

With Forty I have taken to embracing the ethos of the Open Source By Default
movement. There are three main repos that might interest you: forty-web,
forty-site and forty-time-management, let's discuss them in detail.

<!-- READ-MORE -->

## forty-web

The Forty web app is a [Rails application][rails] deployed to [Heroku][]. It
uses [Postgres][] for persistence, [Sidekiq][] for background jobs and takes
advantage of [React][] for a couple complex interactions.

I've integrated with Stripe for payment, specifically their [Stripe
Elements][elements] product that has great React support. I'm using the
[Webpacker gem][Webpacker] and that pipeline to serve React components authored
in [Typescript][].

For testing I use [RSpec][] and [Jest][]. There's some system tests that spin up
headless Chrome using the [Webdrivers gem][Webdrivers] to simulate user behavior
and on the other end I have [Enzyme][] setup so I can get good unit tests around
the React component stack.

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

## forty-site

The marketing site for Forty is built using the static site generator
[Middleman][]. I'm using the [blog extension][mm-blog] and then I deploy it to
[Digital Ocean][] using [CircleCI][] and [rsync][].

[Middleman]: https://middlemanapp.com/
[mm-blog]: https://middlemanapp.com/basics/blogging/
[do]: https://www.digitalocean.com/
[CircleCI]: https://circleci.com/
[rsync]: https://en.wikipedia.org/wiki/Rsync

## forty-time-management

This is an interesting little project I put together to share some code and
idioms between Ruby and Typescript. There are folders for each of those languages where
I've implemented the same business logic in each language.

For example, I have [a Ruby class called `FortyTime`][ruby-forty-time] that
implements `to_s` to convert some number of minutes into a nicely formatted
string. I have the same sort of thing [in Typescript with a class also called
`FortyTime`][ts-forty-time] that has a `toString` function. I drove out both of
these implementations with tests that match and now I can ensure whether I'm in
Ruby or Typescript that going from minutes to strings will work consistently.

[ruby-forty-time]: https://github.com/verynicecode/forty-time-management/blob/291f6c0c83ad63f3b1752a347ab615a5b4261b49/ruby/lib/forty_time.rb#L44-L56
[ts-forty-time]: https://github.com/verynicecode/forty-time-management/blob/291f6c0c83ad63f3b1752a347ab615a5b4261b49/typescript/src/FortyTime.ts#L36-L51

## Working in the Open

Having these repos public on GitHub means I'm working in the open and that frees
me to talk about the code that I've built in whatever way I want. It's like a
free source of content marketing ideas! And should I want to impress a potential
employer at some point they'll be able to see exactly how I've built my side
hustle down to the PRs I write to myself.
