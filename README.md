# mirror-to-github

See your favourite repos in GitHub!

Mirrors a remote git repository into GitHub.

1. Make a GitHub access token.
2. Copy `settings.sh.example` to `settings.sh` and configure.
3. Add `mirror.sh` to your crontab

Example cron line:

```
# Update every hour
0 * * * * ~/mirror-to-github/mirror.sh
```
