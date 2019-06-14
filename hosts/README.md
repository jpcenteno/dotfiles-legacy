# Hosts file

I use the _hosts_ file as a blacklist for known malware hosts and time wasters
(ads, clickbait, adult sites, etc).

The script `update-hosts` is used to update `/etc/hosts` with a blacklist from
the intermet ([StevenBlack/hosts](https://github.com/StevenBlack/hosts)). It
works best when used as a cronjob or similar.
