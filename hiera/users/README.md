# Per-user hiera configuration

The example `hiera.yaml` includes an entry in the hierarchy for
per-user configurations, allowing individuals to override many, many
common puppet parameters for their own machines.

Simply place a file in this directory named after your github
login. For example, if your github login is `johndoe`, you would edit
the file `johndoe.yaml` here.

## Example

```yaml
boxen::personal::homebrew_packages:
  - pstree
  - htop

boxen::personal::osx_apps:
  - google-chrome
  - spotify
  - things

boxen::personal::projects:
  - project_a
  - secret_project
```
