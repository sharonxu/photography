#!/bin/bash

# Cloudflare Pages build script for Jekyll photography portfolio
set -e

echo "Starting build process..."

# Install Bundler and Ruby dependencies
echo "Installing Bundler..."
gem install bundler

echo "Installing Ruby gems..."
bundle install

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