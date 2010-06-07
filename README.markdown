### Acceptance Testing with Cucumber

This is the example app for Acceptance Testing with Cucumber tutorial,
presented by Aslak Hellesøy and David Chelimsky at RailsConf 2010.

The master branch is the starting point, and the other branches represent
different phases in the evolution of the example app.

### Recommended environment

* git
* rvm 0.1.38 (if you're on *nix)
* pik (if you're on windows)
* ruby 1.8.7-p249 

### Get started

Start off with a clean gemset with rvm or pik:

    rvm gemset create tutorial
    rvm gemset use tutorial

Install a couple of gems you'll need to bootstrap everything else:

    gem install rake bundler

Now do all this:

    git clone git://github.com/dchelimsky/railsconf2010-app.git
    cd railsconf2010-app
    bundle install
    bundle lock
    cucumber

If you see cucumber run at the end with a pending step, then all is right with
the world.
