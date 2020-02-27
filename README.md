My attempt to build a simple imageboard.

Goals:

- Simple to deploy: should be a single executable that uses an sqlite3 db. Put
  it behind a TLS-terminating reverse proxy like nginx or caddy and you're in
  business. Optional s3-like storage support is planned.

- Simple to use: UI should be minimal and functional even with JS disabled.
  [textboard](http://textboard.org/) is a huge inspiration.

- Simple (and hopefully fun) to develop: prioritize correctness & simplicity
  over performance in general. Nim + sqlite3 is plenty fast already, and no
  your shitty Mongolian basket weaving forum does not need to be "web scale".

# Dev

```sh
nimble install
sudo pacman -S entr
find src -type f -name '*.nim' | entr -rc nimble run --verbose caophim
xdg-open http://localhost:5000
```

## Design choices

**src/caophim.nim** is the main entrypoint and all state should be managed
there. Other files should only define composable, stateless utils.

This project unapologetically utilizes n+1 queries, since they're [not a
problem with sqlite](https://www.sqlite.org/np1queryprob.html).
