#!/bin/bash

# Build script with Jekyll template processing
set -e

echo "Starting build process with Jekyll..."

# Restore Gemfiles
echo "Setting up Ruby environment..."
mv Gemfile.ruby Gemfile 2>/dev/null || true
mv Gemfile.ruby.lock Gemfile.lock 2>/dev/null || true

# Install bundler and Ruby dependencies
echo "Installing Bundler..."
gem install bundler

echo "Installing Ruby gems..."
BUNDLE_WITHOUT="" bundle install

# Install Node dependencies and run gulp
echo "Installing Node.js dependencies..."
npm install

echo "Running gulp production build tasks..."
echo "Current working directory: $(pwd)"
echo "Node version: $(node --version)"
echo "NPM version: $(npm --version)"
npx gulp prod

# Build Jekyll site (this processes templates)
echo "Building Jekyll site..."
bundle exec jekyll build

echo "Jekyll build completed successfully!"
