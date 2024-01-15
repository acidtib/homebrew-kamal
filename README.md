homebrew-kamal
=================

Homebrew Tap for Kamal

Make sure you have Homebrew installed on your macOS or Linux system. If not, you can install it by following the instructions on the [Homebrew website](https://brew.sh/).

## Installation
To install the latest stable version of `kamal` using Homebrew, follow these steps:

Tap the repository (if you haven't already):
```
brew tap acidtib/kamal
```

Install `kamal`:
```
brew install kamal
```

Test `kamal` installation:
```
kamal version
```

## Upgrading Kamal
```
brew update && brew upgrade kamal
```

## Bleeding Edge Installation
Install the unreleased version of `kamal` using Homebrew:
```
brew install kamal --HEAD
```

## Usage
To deploy your web app using `kamal`, first create a configuration file using the `kamal init` command:
```
kamal init
```
This will create a new configuration file at the specified path with some default settings.

For full usage and documentation please visit https://kamal-deploy.org and https://github.com/basecamp/kamal


## Troubleshooting

* Use `--verbose` to get more info while installing.
* Make sure to update XCode and the command line tools.
* Run `brew update` and `brew upgrade`
* Fix what the `brew doctor` says.
* Make changes to `/usr/local/Library/Taps/acidtib/homebrew-kamal/kamal.rb`
* Reinstall with `brew reinstall kamal` (send a pull request!)
* Take a walk
