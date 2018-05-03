## a nodejs express simple app
* based on a debian package style in Sagoku
* side car may be loaded, but there are no built-in libraries to reference things like PVs or zookeeper or to do Eureka lookups
* leverages node from a debian repository, you pay pass a node version and debian version to the build scripts as node = $5 (first build script option flag).  See package.sh
* logs are piped from nodejs to topic and container of the package-name and monitored by 'forever'
