#!/bin/bash

# Cloudflare Pages build script for Jekyll photography portfolio
set -e

echo "Starting build process..."

# Restore Gemfile for bundler
echo "Setting up Ruby environment..."
mv Gemfile.ruby Gemfile
mv Gemfile.ruby.lock Gemfile.lock

# Install bundler
echo "Installing Bundler..."
gem install bundler

# Install Ruby dependencies
echo "Installing Ruby gems..."
BUNDLE_WITHOUT="" bundle install

# Install Node dependencies  
echo "Installing Node.js dependencies..."
npm install

# Run gulp build process (CSS, JS only - no image processing)
echo "Running gulp production build tasks..."
gulp prod

# Build Jekyll site
echo "Building Jekyll site..."
bundle exec jekyll build

echo "Build completed successfully!"