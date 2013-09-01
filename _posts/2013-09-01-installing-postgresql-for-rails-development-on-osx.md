---
layout: post
title: Installing PostgreSQL for Rails development on OS X
tags: Coder
date: 2013-09-01 11:48:09.594276000 -07:00
---

I'm playing around with writing a [Rails][rails] application, just to learn new things. At the same time, I wanted to understand why everyone in the Rails community seems to be using [Heroku][heroku]. And since Heroku defaults to using [PostgreSQL][postgresql] for the database backend when you use Rails, I have to now set up a PostgreSQL environment on my Mac for development. This turned out to be harder than I first expected. This is how I got it to work.

First, I had to realize that PostgreSQL doesn't just magically get installed when you create a Rails application that is configured to use it :wink: This was pretty easy because the first time I attempted to launch the "Hello, world!" type thing I had written I got the pretty red Rails error message page saying it couldn't connect to the database. I quickly googled[^1] for instructions on how to properly install PostgreSQL for Rails development on the Mac and was quite happy to find [a StackOverflow answer][answer] for this very issue. I thought I was done, but it seems that as the answer was posted over three years ago ... let's just say that the contents may have settled during transit :laughing: But I was able to use it as a template for how I got things to work and each time I got stuck, it helped me find my way.

Instead of downloading the installer and using that, I used [Homebrew][brew] to install PostgreSQL:

```bash
$ brew install postgresql
```

Then I needed to initialize a database environment[^2] since PostgreSQL needs you to tell it where to put the databases you create. The Homebrew recipe was kind enough to give me the command:

```bash
$ initdb /usr/local/var/postgres -E utf8
```

Next, I started the server using the command that `initdb` conveniently handed me:

```bash
$ postgres -D /usr/local/var/postgres
```

In the future, I'll probably use the [pg_ctl][pg_ctl] command to start and stop the server process in the background. But for today, this was good enough.

At this point, I could actually start messing around with the server and getting things to actually communicate between Rails and PostgreSQL. Or so I thought. It turns out that Rails, by default, attempts to communicate with PostgreSQL via domain sockets. This is a good thing because they're system local and [are much more performant][domain_sockets] than TCP/IP connections. On the other hand, Rails expects the domain sockets to be created in one directory by default and my PostgreSQL installation was using a slightly different one. After taking a stab at reconfiguring the directory used, I just told Rails to connect via TCP/IP by editing the `config/database.yml` file and adding the following line to the `development` section:

```yaml
host: localhost
```

Which is when I started getting database errors! Progress! :sunglasses:

The database errors told me first that the user Rails was trying to use to connect with didn't exist. So I created it by entering:

```bash
$ createuser username
```

In Homebrew installations it seems that all of the PostgreSQL administration commands are also symlinked to the `/usr/local/bin` directory. Very convenient!

And finally, I just needed to create the database itself:

```bash
$ createdb website
```

Once that was complete, I was able to execute the standard Rails commands:

```bash
$ rake db:migrate
$ rails s
```

to start the server and everything was up and running!

To tell the truth, I was really impressed with how easy everything was once I used Homebrew to install PostgreSQL. One thing led me to another and in many cases if the next step wasn't obvious, it was provided in the output of the previous step. Hats off to the Homebrew and PostgreSQL folks! :beer:

[^1]: Am I supposed to capitalize it when it is being used as a verb or not? What is the convention on that? Hmmmmm ...
[^2]: [The documentation][initdb] calls it a "database cluster", but I find that to be a poor choice of phrase given that most people who aren't database wonks use the term "database" and "server" interchangeably.

[answer]: http://stackoverflow.com/questions/2271069/installing-postgresql-on-osx-for-rails-development
[brew]: http://brew.sh
[domain_sockets]: http://momjian.us/main/blogs/pgblog/2012.html#June_6_2012
[heroku]: https://www.heroku.com
[initdb]: http://www.postgresql.org/docs/9.2/static/app-initdb.html
[pg_ctl]: http://www.postgresql.org/docs/9.2/static/app-pg-ctl.html
[postgresql]: http://www.postgresql.org
[rails]: http://rubyonrails.org
