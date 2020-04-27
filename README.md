CLI RPN Calculator <img src="https://img.shields.io/badge/ruby%20-v2.6.6-brightgreen.svg" title="ruby-badge"> <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/maxsuhak/cli_rpn_calculator"> <img alt="GitHub issues" src="https://img.shields.io/github/issues/maxsuhak/cli_rpn_calculator"> ![MASTER CI](https://github.com/maxsuhak/cli_rpn_calculator/workflows/CI/badge.svg?branch=master)
===================

Command-line (CLI) Reverse Polish Notation (RPN) calculator using ruby language.

## Features

* The calculator uses standard ruby input `STDIN` and standard output `STDOUT`.
* Four standard arithmetic operators: addition `+`, multiplication `*`, subtraction `-`, division `/`.
* The calculator exit when it receives a `q` command or an end of input indicator (EOF / Ctrl+D).
* The calculator returns information when it receives a `i`.
* The calculator returns welcome message when it receives a `w`.
* The calculator returns returns link to wikipedia when it receives a `?`.
* The calculator returns stack when it receives a `s`.
* The calculator clears the stack when it receives a `c`.

## Installation

Clone this GitHub repository:

```
$ git clone git@github.com:maxsuhak/cli_rpn_calculator.git
```

### System Requirements

This application requires [ruby-2.6.6](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-6-6-released/) to be installed.

### Setup

Setup this application locally:

```
$ bundle install
```

### Testing

Test this application locally:

```
$ rspec spec
```

Note: All 82 tests should be passed.

## Usage

There are three ways to run the RPN calculator:

### Rake Task

```
$ rake console
```

### Ruby Script

```
$ ruby start.rb
```

### Docker

```
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

## Technical / architectural choices

* Created a command-line (CLI), Reverse Polish Notation (RPN) calculator for people who are comfortable with UNIX-like CLI utilities.
* Followed gem similar standard structure of code organization for future rebuilding the code into gem uses [`tty`](https://github.com/piotrmurach/tty).
* Classes abide by the Single Responsibility Principle.
* Implemented 4 basic operators, 6 commands and a standard IO interface.
* A standard IO interface `IOProviders::Base` is built with extension to new, IO-like interfaces, class `IOProviders::Console` has been extracted.
* There are separate operator and command classes.
* Logs are stored and located into `tmp/`.
* Code is `RuboCop` consistent.
* Code is well tested for prevent regression used `RSpec`.
* Configured GitHub workflow actions for prevent regressions.

### Folders and files structure:

```
▾ cli_rpn_calculator/
├── ▾ .github/
│   ├── ▾ workflows/
│   │   └── ruby.yml
│   └── pull_request_template.md
├── ▾ bin/
│   └── boot.rb
├── ▾ lib/
│   ├── ▾ cli_rpn_calculator/
│   │   ├── ▾ commands/
│   │   │   ├── base.rb
│   │   │   ├── check_stack.rb
│   │   │   ├── clear_stack.rb
│   │   │   ├── instructions.rb
│   │   │   ├── welcome_message.rb
│   │   │   └── wikipedia.rb
│   │   ├── ▾ helpers/
│   │   │   ├── file_log.rb
│   │   │   └── tokenizer.rb
│   │   ├── ▾ io_providers/
│   │   │   ├── base.rb
│   │   │   └── console.rb
│   │   ├── ▾ operators/
│   │   │   ├── addition.rb
│   │   │   ├── base.rb
│   │   │   ├── division.rb
│   │   │   ├── multiplication.rb
│   │   │   └── subtraction.rb
│   │   └── cli.rb
│   └── cli_rpn_calculator.rb
├── ▾ spec/
│   ├── ▾ lib/
│   │   ├── ▾ cli_rpn_calculator/
│   │   │   ├── ▾ commands/
│   │   │   │   ├── base_spec.rb
│   │   │   │   ├── check_stack_spec.rb
│   │   │   │   ├── clear_stack_spec.rb
│   │   │   │   ├── instructions_spec.rb
│   │   │   │   ├── welcome_message_spec.rb
│   │   │   │   └── wikipedia_spec.rb
│   │   │   ├── ▾ helpers/
│   │   │   │   ├── file_log_spec.rb
│   │   │   │   └── tokenizer_spec.rb
│   │   │   ├── ▾ io_providers/
│   │   │   │   ├── base_spec.rb
│   │   │   │   └── console_spec.rb
│   │   │   ├── ▾ operators/
│   │   │   │   ├── addition_spec.rb
│   │   │   │   ├── base_spec.rb
│   │   │   │   ├── division_spec.rb
│   │   │   │   ├── multiplication_spec.rb
│   │   │   │   └── subtraction_spec.rb
│   │   │   └── cli_spec.rb
│   │   └── cli_rpn_calculator_spec.rb
│   └── spec_helper.rb
├── ▾ tmp/
│   └── .keep
├── .gitignore
├── .rspec
├── .rubocop.yml
├── .ruby-version
├── docker-compose.yml
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── README.md
└── start.rb
```

## Trade-offs / possible improvements

* Well describe all classes and methods.
* Rebuild the code into gem and store it to [RubyGems.org](https://rubygems.org/).
* Improve calculator to work with options.
* Create additional IO Interfaces.
* Refactor class `CLI`.
* Refactor validations.
* Improve errors handling.
* Refactor getting operators and commands list to make it automated.
* Add `I18n`.
* More test coverage.
* Add gem `simplecov` for track test coverage.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maxsuhak/cli_rpn_calculator.
