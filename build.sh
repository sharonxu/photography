#!/bin/bash

# Cloudflare Pages build script for Jekyll photography portfolio
set -e

echo "Starting build process..."

# Check if bundler is available, install if not
if ! command -v bundle &> /dev/null; then
    echo "Bundler not found, installing..."
    gem install bundler
else
    echo "Bundler found"
fi

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