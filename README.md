# Semantic Search Plugin for Redmine

This plugin enhances the default Redmine Search Functionality by adding Embeddings to each issue using `pgvector`.

## Help

If at any point while developing your plugin you face certain problems, just open an issue.

## Features

- Search for issues by entering a question
- Get a detailed list of issues without needing to know specific keywords

## Installation

1. Clone this repository into your Redmine plugins directory:

```bash
cd /path/to/redmine/plugins
git clone https://github.com/renuo/redmine-semantic-search.git
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

> Before continuing, make sure you have set an Environment Variable called `OPENAI_API_KEY`. Get your API Key from [here](https://platform.openai.com/api-keys).

1. Log into Redmine as an administrator
2. Go to Administration > Plugins
3. Find "Semantic Search" in the list
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

Sami Hindi @ Renuo AG.

## Copyright

2025 Renuo AG
