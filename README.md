## Setup

1. Create and fill in `.env` using `.env.example` as an example.

2. Install required gems

```
bundle install
```

Install required yarn packages

```
yarn install
```

3. Turn your PDF into embeddings for GPT-3:

```
ruby ./lib/scripts/pdf_to_pages_embeddings.rb --pdf /your/path/to/book.pdf
```

Note

This script uses `pdftotext` gem to read pdf files in ruby. In order to use this
gem you need to install Poppler on your machine.

To install Poppler using Homebrew:

```
brew install poppler
```

For more information on installing Poppler refer to:
https://www.viget.com/articles/extract-embedded-text-from-pdfs-with-poppler-in-ruby/

4. Set up database tables and initialize seed data:

```
rails db:migrate
rails db:seed
```

### Run locally

To run the rails server over port 3000 for this app open a terminal window and type:

```
rails s
```

And to run webpack dev server open another terminal window and run

```
./bin/webpack-dev-server
```
