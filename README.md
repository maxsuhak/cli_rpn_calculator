CLI RPN Calculator <img src="https://img.shields.io/badge/ruby%20-v2.6.6-brightgreen.svg" title="ruby-badge"> <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/maxsuhak/cli_rpn_calculator"> <img alt="GitHub issues" src="https://img.shields.io/github/issues/maxsuhak/cli_rpn_calculator"> ![MASTER CI](https://github.com/AnjanJ/fuber/workflows/CI/badge.svg?branch=master)
===================

Command-line (CLI) reverse polish notation (RPN) calculator using ruby language.

## Features

* The calculator uses standard ruby input `STDIN` and standard output `STDOUT`
* Four standard arithmetic operators: addition `+`, multiplication `*`, subtraction `-`, division `/`
* The calculator exit when it receives a `q` command or an end of input indicator (EOF / Ctrl+D)
* The calculator returns information when it receives a `i`
* The calculator returns welcome message when it receives a `w`
* The calculator returns returns link to wikipedia when it receives a `?`
* The calculator returns stack when it receives a `s`
* The calculator clears the stack when it receives a `c`

## Installation

Clone this GitHub repository:

```console
$ git clone git@github.com:maxsuhak/cli_rpn_calculator.git
```

### System Requirements

This application requires [ruby-2.6.6](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-6-6-released/) to be installed.

### Setup

Setup this application locally:

```console
$ bundle install
```

### Testing

Test this application locally:

```console
$ rspec spec
```

Note: All 82 tests should be passed.

## Usage

There are three ways to run the RPN calculator:

### Rake Task

```console
$ rake console
```

### Ruby Script

```console
$ ruby start.rb
```

### Docker

```console
$ docker-compose run app
```

## Sample

```
Welcome to the CLI RPN Calculator!
Press 'i' for instructions on use.
Press '?' for a link to more info about RPN.
Press 's' to see the current stack.
Press 'c' to clear the current stack.
Press 'w' to repeat this welcome message.
Press 'q' to quit.
> 5
5.0
> 8
8.0
> +
13.0
> q
Calculation terminated. Goodbye!
```

## Technical notes / architectural choices



## Trade-offs / possible improvements

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maxsuhak/cli_rpn_calculator
