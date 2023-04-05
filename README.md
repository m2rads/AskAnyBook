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

### Note

This script uses `pdftotext` gem to read pdf files in ruby. In order to use this
gem you need to install Poppler on your machine.

To install Poppler using Homebrew:

brew install poppler

For more information on installing Poppler refer to:
https://www.viget.com/articles/extract-embedded-text-from-pdfs-with-poppler-in-ruby/

4. Set up database tables and collect static files:

```
rails db:migrate
rails db:seed
```

5. Other things to update:

- Book title
- Book cover image
- URL to purchase book
- Author name and bio

## Deploy to Heroku

1. Create a Heroku app:

```
heroku create yourappname
```

Set config variables on Heroku to match `.env`.

Note that this repo does not contain the `pages.csv` and `embeddings.csv` you'll need, generated above. You can remove `.csv` from your own `.gitignore` and push them manually via `git push heroku main`.

### Run locally

To run the rails server over port 3000 for this app open a terminal window and type:

```
rails s
```

And to run webpack dev server open another terminal window and run

```
./bin/webpack-dev-server
```

Note: macOS Monterey uses port 5000 (the default port) for AirPlay sharing, so you will need to run heroku local on a different port. For example:
