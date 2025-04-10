# Motivation Center Plugin for Redmine

This plugin enhances Redmine by adding a motivation center that helps boost team morale and engagement.

> Note: This Plugin Boilerplate was generated using Redmine 4.x and Rails 6.1, so make sure your migrations match up.

## Help

If at any point while developing your plugin you face certain issues, simply refer to this [documentation](https://www.redmine.org/projects/redmine/wiki/Plugin_Tutorial).

## Features

- Motivation ✅

## Installation

1. Clone this repository into your Redmine plugins directory:

```bash
cd /path/to/redmine/plugins
git clone https://github.com/renuo/renuo-redmine-motivation-center.git motivation_center
```

2. Install dependencies:

```bash
bundle install
```

3. Run the plugin migrations:

```bash
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
```

## Configuration

1. Log into Redmine as an administrator
2. Go to Administration > Plugins
3. Find "Motivation Center" in the list
4. Click "Configure" to set up your preferences

## Development

To set up the development environment:

1. Clone the repository
2. Install dependencies
3. Run tests:

```bash
bundle exec rake redmine:plugins:test NAME=motivation_center
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the GitHub repository or contact the Renuo team.

## Authors

- Renuo AG

## Copyright

2025 Renuo AG
