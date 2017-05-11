# GOAPP base

## Prerequisites
* go (golang)
* npm (node)

## Dependencies

* node-sass
* github.com/urfave/negroni
* github.com/unrolled/render
* github.com/ChromatixAU/gomiddleware

## Instructions

For windows, you may need to get a version of make or use mingw32-make.exe

### Installation
* npm install
* make install

### Compile and Run
* npm run assets
* make

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

## Directory Structure

### Golang core
* src/github.com - 3rd party libs source
* pkg - packaged 3rd party libs
* bin - binaries

### Goapp core
* log - application logs
* public - web root (Do not put things in here, items are copied from theme folder via 'npm run assets'
* public/uploads - where uploads to the app is stored
* node_modules - for node modules used for js/css/image asset pipeline

### Application Theme
You may want to have a separate GIT repository for the following

* src/goapp/themes - theme base directory
* src/goapp/themes/default - default theme. To use a different theme set GO_THEME environment variable to name of directory, also update theme directory in package.json to new theme
* src/goapp/themes/default/data - json files for static data per theme. Files end in .json
* src/goapp/themes/default/templates - golang html templates used by render lib. Files end in .tmpl
* src/goapp/themes/default/assets/js - theme js
* src/goapp/themes/default/assets/css - theme css
* src/goapp/themes/default/assets/images - theme images
* src/goapp/themes/default/assets/files - other theme files

