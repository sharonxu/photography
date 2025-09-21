#!/bin/bash

# Simplified build script that avoids Jekyll dependency issues
set -e

echo "Starting simplified build process..."

# Restore Gemfiles
mv Gemfile.ruby Gemfile 2>/dev/null || true
mv Gemfile.ruby.lock Gemfile.lock 2>/dev/null || true

# Install Node dependencies and run gulp
echo "Installing Node.js dependencies..."
npm install

echo "Running gulp production build tasks..."
npx gulp prod

# Create _site directory and copy everything needed
echo "Creating site structure..."
mkdir -p _site

# Copy main files
cp index.html _site/
cp -r assets _site/
cp -r images _site/
cp -r _includes _site/ 2>/dev/null || true
cp favicon.ico _site/ 2>/dev/null || true
cp CNAME _site/ 2>/dev/null || true

echo "Simple build completed successfully!"