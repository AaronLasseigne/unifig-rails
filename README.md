# [Unifig::Rails][]

Adds [Rails][] support to [Unifig][].

[![Version](https://img.shields.io/gem/v/unifig-rails.svg?style=flat-square)](https://rubygems.org/gems/unifig-rails)
[![Test](https://img.shields.io/github/workflow/status/AaronLasseigne/unifig-rails/Test?label=Test&style=flat-square)](https://github.com/AaronLasseigne/unifig-rails/actions?query=workflow%3ATest)

## Installation

Add it to your Gemfile:

``` rb
gem 'unifig-rails', '~> 0.3.0'
```

Run the configuration generator:

``` sh
rails generate unifig:config
```

This project uses [Semantic Versioning][].
Check out [GitHub releases][] for a detailed list of changes.

## Usage

Once your Rails app has been started you will be able use Unifig with the setup you've created in `config/unifig.yml`.

For information on how to use Unifig see the [documentation][] for that gem.

If you need to know more information about the variables in Unifig you can run `rake unifig:vars` and get a listing.

```sh
> be rake unifig:vars
┌────────┬────────────────┬──────────┬──────────┬─────────┐
│        │                │          │          │         │
│ Var    │ Value          │ Provider │ Required │ Method  │
├────────┼────────────────┼──────────┼──────────┼─────────┤
│        │                │          │          │         │
│ HOME   │ "/Users/aaron" │ env      │ true     │ .home   │
│        │                │          │          │         │
│ NAME   │ "Aaron"        │ local    │ true     │ .name   │
│        │                │          │          │         │
│ HELLO  │ "hi \"Aaron\"" │ local    │ false    │ .hello  │
└────────┴────────────────┴──────────┴──────────┴─────────┘

```

## Contributing

If you want to contribute to Unifig::Rails, please read [our contribution guidelines][].
A [complete list of contributors][] is available on GitHub.

## License

Unifig is licensed under [the MIT License][].

[Unifig::Rails]: https://github.com/AaronLasseigne/unifig-rails
[Rails]: https://rubyonrails.org
[Unifig]: https://github.com/AaronLasseigne/unifig
[documentation]: https://github.com/AaronLasseigne/unifig#usage
[Semantic Versioning]: http://semver.org/spec/v2.0.0.html
[GitHub releases]: https://github.com/AaronLasseigne/unifig-rails/releases
[our contribution guidelines]: CONTRIBUTING.md
[complete list of contributors]: https://github.com/AaronLasseigne/unifig-rails/graphs/contributors
[the MIT License]: LICENSE.txt
