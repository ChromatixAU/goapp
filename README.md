# GOAPP base

Built by [Chromatix Digital Agency](https://www.chromatix.com.au)

Important Note: This base is still in development, do not use in production unless you know what you're doing

## Prerequisites
* go (golang)
* npm (node) - for node-sass

## Dependencies

* node-sass
* github.com/chromatixau/gotheme
* github.com/chromatixau/goplugin
* github.com/chromatixau/gocore
  * github.com/urfave/negroni
  * github.com/unrolled/render
  * github.com/chromatixau/gomiddleware

## Instructions

For windows, you may need to get a version of make or use mingw32-make.exe that comes with MINGW32

### Installation
* npm install
* make init
* make install
* make buildall

### Compile and Run
* make build

## Directory Structure

### Golang core
* src/github.com - libs source
* pkg - packaged 3rd party libs
* bin - binaries

### Goapp boilerplate
* log - application logs
* public - web root (Do not put things in here, items are copied from theme folder via 'make assets'
* uploads - where uploads to the app is stored WIP
* node_modules - for node modules used for node-sass
* src/goapp - main source directory

## Your Theme Setup

Setup your theme directory in the Makefile, replace:

* THEME=src/$(DEFAULT_THEME)

With:

* THEME=src/goapp/themes/yourthemename

Change yourthemename to the name you want to use.

You may want to have a separate GIT repository for your theme

* cd src/goapp/themes/yourtheme
* git init
* git remote add origin [your-repository.git]
* git push -u origin master

### Required Theme Directories
* src/goapp/themes/yourthemename
* src/goapp/themes/yourthemename/data - json files for static data per theme. Files end in .json
* src/goapp/themes/yourthemename/templates - golang html templates used by render lib. Files end in .tmpl
* src/goapp/themes/yourthemename/assets/js - theme js
* src/goapp/themes/yourthemename/assets/css - theme css
* src/goapp/themes/yourthemename/assets/images - theme images
* src/goapp/themes/yourthemename/assets/files - other theme files

Change yourthemename to the name you want to use.

## TODO

* Add Babel
* Add Minification
* Add React
* Add Tests
* Add Configuration System
* Add file watch
* Add Template Layouts
* Add Routing
* Add Database
* Add Authentication
* Add Linting
* Add Code Standard Testing

