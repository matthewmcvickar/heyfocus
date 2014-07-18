# Hey! Focus!

A script to add a bunch of distracting sites to my `/etc/hosts` file <s>and redirect their URLs to a motivational page instead</s>.

This script borrows heavily from [al3x's Get-Back-To-Work Hack](https://al3x.net/2009/09/14/my-get-back-to-work-hack.html) and [Vic Cherubini's get-shirt-done](https://github.com/leftnode/get-shit-done) script.

## Redirecting to a Motivational Message

Like Al3x [suggests](https://al3x.net/2009/09/14/my-get-back-to-work-hack.html). But I can't do this! I use `127.0.0.1` for my webroot, for my folders of sites. It's not possible to redirect to a specific URL with `/etc/hosts`; only an IP address. Theoretically, I could use MAMP to set up a port like 127.0.0.1:5555 that goes to a specific directory, then direct something like 127.0.0.2 to that using [local port forwarding with `pf`](https://gist.github.com/kujohn/7209628), but that's getting pretty hairy.