<img src="art/icon.png" width="200">

A script that add distracting sites to the `hosts` file and redirects them to `localhost` to encourage focus.

The sites to block are listed in *[sites-to-block.txt](sites-to-block.txt)*.

This script borrows heavily from [Alex Payne's Get-Back-To-Work Hack](https://al3x.net/2009/09/14/my-get-back-to-work-hack.html) and [Vic Cherubini's get-shit-done](https://github.com/leftnode/get-shit-done).


## Usage/Installation


### Don't Use This

This is not a very robust or flexible script and it may not work on your computer for any number of reasons. It shouldn't screw up your `hosts` file, but it might? ¯\\(ツ)/¯

So:

- If you want something that Just Works, can block applications and not just URLs, and can do lots of other things, get [Concentrate](http://www.getconcentrating.com/) ($29). (I have used this app for years but wanted something I could trigger from the command line and just need blocked domains, so I made Hey! Focus!.)

- If you want to block your access to the internet entirely, use [Freedom](http://macfreedom.com/) ($10).


### Alfred Workflow

If you use Alfred and want to toggle Hey! Focus! that way, **[download the HeyFocus.alfredworkflow](raw/master/Hey!%20Focus!.alfredworkflow)** and install it.

You will be asked for your admin password when running the script. Note that the dialog that asks you for it won't get focus, which is very annoying (and [not fixable](http://www.alfredforum.com/topic/3304-focus-when-opening-encrypted-disk-image-files/)).

If you want to add to or delete sites from the list of those to block, right-click on the workflow in the list of Alfred workflows, choose 'Show in Finder', and edit the *sites-to-block.txt* file.


### Shell Script

**[Download this repository](archive/master.zip)**, stick it in a folder somewhere, and add an alias to it in your shell resource file, like this:

```sh
alias focus="sudo sh ~/Scripts/heyfocus/heyfocus.sh"
```

Then you can call `focus` on the command line at any time to block or unblock your distracting sites.

If you want to add to or delete sites from the list of those to block, edit the *sites-to-block.txt* file.


## What About Redirecting to a Specific URL?

Like Alex Payne [suggests](https://al3x.net/2009/09/14/my-get-back-to-work-hack.html). But I can't do this! I use `127.0.0.1` for my webroot and don't want to put an index file in there with a motivational message—I want to see my list of folders. It's not possible to redirect to a specific URL with a `hosts` file; only an IP address. Theoretically, I could use MAMP to set up a port like `127.0.0.1:5555` that goes to a specific directory, then direct something like `127.0.0.2` to that using [local port forwarding with `pf`](https://gist.github.com/kujohn/7209628), but that's getting pretty hairy.