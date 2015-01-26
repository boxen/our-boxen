# Updates

When Boxen runs, it checks to see if your system matches a large set of
statements (Puppet "resources"). If it doesn't, it knows how to make changes
to your system to "converge" on that desired state. Those resources are all
defined in Puppet `*.pp` manifest files in a git repository, github/boxen.
We use a simple `git` workflow to keep those definitions up-to-date whenever
you go to run Boxen.

## Where is this repository

`/opt/boxen/repo`, which is also symlinked at `$HOME/src/our-boxen` for
convenience.

## What does "up to date" mean?

Unless you're actively working on Boxen, "up to date" means that your local
working copy is on `master`, and up to date with (same revision as)
`origin/master`.

## How do we keep up to date?

At the earliest possible moment in a Boxen run, some checks are made to ensure
that updating your working copy is going to be safe:

* Are you on a non-master branch (or no branch at all)? (see `git symbolic-ref HEAD`)
* Do you have any uncommitted changes? (see `git status --porcelain`)
* Do you have any unpushed commits on master? (see `git log origin/master..master`)

If your working copy is a "yes" to any of those checks, we won't touch a thing.
Boxen will tell you why it's not going to auto-update, then offer to run Puppet
with your working copy as-is.

If, on the other hand, we are going to auto-update:

```sh
# Get the most recent commits from upstream
git fetch origin
# Reset your working copy to look just like upstream's master
git reset --hard origin/master
git clean -qdf
```

## Workflow tip

If you're working on something in Boxen (e.g. your personal manifest,
or adding a new project definition), move over to a branch. Working on
a branch signals to Boxen that you're actively making changes, and that
it shouldn't do things like try to auto-update, or to submit issues on
failed runs.

Once you're happy with your changes, the usual workflow of submitting a
pull request, waiting for some review then a merge applies. Until then,
you have the option of either leaving your working copy on the branch,
or moving back to master and getting other updates. This should be a good
incentive to get your branch merged quickly :)
