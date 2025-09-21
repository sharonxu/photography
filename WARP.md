# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is a Jekyll-based photography portfolio website designed to showcase photography with automatic EXIF data extraction and display. The site is built for GitHub Pages deployment and includes automated image processing workflows.

## Development Environment Setup

### Prerequisites
- Ruby (for Jekyll)
- Node.js and npm (for build tools)
- ImageMagick (for image processing)

### Initial Setup
```bash
bundle install          # Install Ruby gems
npm install             # Install Node dependencies
```

### Local Development
```bash
# Test the website locally
bundle exec jekyll serve

# For local testing, update _config.yml:
# Comment out: baseurl: "https://photography.rampatra.com"  
# Uncomment: #baseurl: ""
```

## Build and Asset Processing

### Complete Build Process
```bash
gulp                    # Run complete build (CSS, JS minification + image processing)
gulp build              # Build assets only (CSS + JS minification)
```

### Image Processing Workflow
```bash
# Place original images in images/ directory, then:
gulp resize             # Automatically creates fulls/ and thumbs/ versions
gulp resize-images      # Resize images only (1024px fulls, 512px thumbs)
```

### Individual Asset Tasks
```bash
gulp sass               # Compile SCSS to minified CSS
gulp minify-js          # Minify JavaScript
gulp sass:watch         # Watch SCSS files for changes
```

## Architecture and Key Components

### Jekyll Structure
- **_layouts/default.html**: Base template with header/footer includes
- **_includes/**: Reusable components (header.html, footer.html)
- **index.html**: Main gallery page with dynamic image loading
- **_config.yml**: Site configuration, social links, EXIF display settings

### Image System
- **images/fulls/**: Full-size images (1024px width) displayed in lightbox
- **images/thumbs/**: Thumbnail images (512px width) for gallery grid
- **Automatic EXIF extraction**: Camera metadata displayed on image click

### Asset Pipeline
- **assets/sass/**: SCSS source files compiled to assets/css/main.min.css
- **assets/js/**: JavaScript including EXIF parsing, jQuery plugins
- **gulpfile.js**: Automated build tasks for image processing and asset minification

### EXIF Data Configuration
The `_config.yml` file controls which EXIF fields are displayed:
```yaml
exif: '[{"tag": "Model", "icon": "camera-retro"}, {"tag": "FNumber", "icon": "dot-circle-o"}, {"tag": "ExposureTime", "icon": "clock-o"}, {"tag": "ISOSpeedRatings", "icon": "info-circle"}]'
```

## Content Management

### Adding New Images
1. Place high-resolution images in the `images/` directory
2. Run `gulp resize` to generate optimized fulls and thumbs
3. Images are automatically detected by Jekyll's `site.static_files` loop

### Customizing Site Content
- **Site title/subtitle**: Update `_config.yml` title, subtitle, and header sections
- **Bio and social links**: Modify footer section and social_urls in `_config.yml`
- **Contact form**: Currently static; see README for Google Script integration
- **Analytics**: Configure `google_analytics` field in `_config.yml`

## Deployment

This site is designed for GitHub Pages deployment:
1. Fork the repository
2. Enable GitHub Pages in repository settings
3. Update `baseurl` in `_config.yml` with your domain
4. Add custom domain to `CNAME` file (or remove for github.io domain)

## Development Notes

- The site uses Jekyll 3.9.3 for GitHub Pages compatibility
- Image processing requires ImageMagick for gulp-image-resize
- EXIF data extraction happens client-side via assets/js/exif.js
- The gallery uses jQuery Poptrox for lightbox functionality
- CSS framework includes IE8/IE9 compatibility layers

## Testing

Run the Jekyll development server and test image processing:
```bash
bundle exec jekyll serve    # Test site locally
gulp resize                 # Test image processing pipeline
```