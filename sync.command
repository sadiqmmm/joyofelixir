#!/bin/bash
cd ~/books/joy_of_elixir
bundle exec jekyll build
aws s3 sync _site s3://joyofelixir.com --acl public-read --delete --exclude _site/book.pdf

# Invalid CloudFront caches, otherwise new content will not display.

aws cloudfront create-invalidation --distribution-id E2VMVK9PHS2KRO --paths '/*'
