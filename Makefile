CORE_PACKAGES=github.com/chromatixau/gocore
DEFAULT_THEME=github.com/chromatixau/gotheme

# you can replace default theme with your own git folder under src
THEME=src/$(DEFAULT_THEME)

# change this to the goapp.go file in your theme folder
MAIN=src/goapp/goapp.go
BINARY=goapp
SERVICE=goapp

all: buildall run

init:
	npm install
	mkdir log
	mkdir bin
	mkdir public
	mkdir uploads

build: clean
	GOPATH=`pwd -P` go build -o $(PWD)/bin/$(BINARY) $(MAIN)

clean:
	rm -f bin/$(BINARY)

run: build
	GO_THEME=$(THEME) $(PWD)/bin/$(BINARY)

buildall: assets build

assets: cleanassets
	cp -r $(THEME)/assets/images public
	cp $(THEME)/assets/files/* public
	cp -r $(THEME)/assets/js public
	node_modules/node-sass/bin/node-sass $(THEME)/assets/scss --output public/css

cleanassets:
	rm -rf public
	mkdir public
	mkdir public/images
	mkdir public/js
	mkdir public/css

install: uninstall 
	GOPATH=`pwd -P` go get ${CORE_PACKAGES}
	GOPATH=`pwd -P` go get ${DEFAULT_THEME}

uninstall:
	rm -rf src/github.com


# the following are used for setting up a daemon via systemd
# systemd service script not included
# only use the following on linux

daemon: build restart

daemonall: buildall restart

cleansymlink:
	sudo rm -f /usr/sbin/$(BINARY)

symlink: cleansymlink
	sudo ln -s $(PWD)/bin/$(BINARY) /usr/sbin/$(BINARY)

add: symlink 
	sudo cp -f systemd/system/goapp.service /etc/systemd/system/$(SERVICE).service
	sudo systemctl daemon-reload

remove: disable
	sudo rm -f /etc/systemd/system/$(SERVICE).service

enable: add
	sudo systemctl enable $(SERVICE)

start:
	sudo systemctl start $(SERVICE)

stop:
	sudo systemctl stop $(SERVICE)

restart:
	sudo systemctl restart $(SERVICE)

disable:
	sudo systemctl disable $(SERVICE)
