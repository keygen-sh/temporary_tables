# temporary_tables

[![CI](https://github.com/keygen-sh/temporary_tables/actions/workflows/test.yml/badge.svg)](https://github.com/keygen-sh/temporary_tables/actions)
[![Gem Version](https://badge.fury.io/rb/temporary_tables.svg)](https://badge.fury.io/rb/temporary_tables)

Use `temporary_tables` to create temporary tables and models in RSpec specs,
rather than create and maintain a dummy Rails application or messy block-level
constants.

This gem was extracted from [Keygen](https://keygen.sh).

Sponsored by:

<a href="https://keygen.sh?ref=temporary_tables">
  <div>
    <img src="https://keygen.sh/images/logo-pill.png" width="200" alt="Keygen">
  </div>
</a>

_A fair source software licensing and distribution API._

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'temporary_tables'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install temporary_tables
```

## Usage

### `temporary_table`

To define a temporary table:

```ruby
describe Example do
  temporary_table :users do |t|
    t.string :email
    t.string :first_name
    t.string :last_name
    t.index :email, unique: true
  end

  it 'should define a table' do
    expect(ActiveRecord::Base.connection.table_exists?(:users)).to be true
  end
end
```

The full Active Record schema API is available.

### `temporary_model`

To define an Active Record:

```ruby
describe Example do
  temporary_model :user do
    has_many :posts
  end

  it 'should define a record' do
    expect(const_defined?(:User)).to be true
  end
end
```

To define an Active Model:

```ruby
describe Example do
  temporary_model :guest_user, table_name: nil, base_class: nil do
    include ActiveModel::Model
  end

  it 'should define a model' do
    expect(const_defined?(:GuestUser)).to be true
  end
end
```

To define a PORO:

```ruby
describe Example do
  temporary_model :null_user, table_name: nil, base_class: nil do
    # ...
  end

  it 'should define a PORO' do
    expect(const_defined?(:NullUser)).to be true
  end
end
```

## Future

Right now, the gem only supports RSpec, but we're open to pull requests that
extend the functionality to other testing frameworks.

## Supported Rubies

**`temporary_tables` supports Ruby 3.1 and above.** We encourage you to upgrade
if you're on an older version. Ruby 3 provides a lot of great features, like
better pattern matching and a new shorthand hash syntax.

## Is it any good?

Yes.

## Contributing

If you have an idea, or have discovered a bug, please open an issue or create a
pull request.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
