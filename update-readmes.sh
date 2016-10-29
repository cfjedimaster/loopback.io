#!/bin/bash

# The following is a 3 column list of org, repo, and branch.
# The branch is optional and will default to 'master' if omitted.
(cat <<LIST_END
strongloop loopback-connector-cloudant
strongloop loopback-connector-dashdb
strongloop loopback-connector-db2
strongloop loopback-connector-db2iseries
strongloop loopback-connector-db2z
strongloop loopback-connector-informix
strongloop loopback-connector-jsonrpc
strongloop loopback-connector-kv-redis
strongloop loopback-connector-mongodb
strongloop loopback-connector-mqlight
strongloop loopback-connector-mssql
strongloop loopback-connector-mysql
strongloop loopback-connector-oracle
strongloop loopback-connector-postgresql
strongloop loopback-connector-redis
strongloop loopback-connector-remote
strongloop loopback-connector-rest
strongloop loopback-connector-soap
strongloop loopback-connector-sqlite3
strongloop loopback-android-getting-started
strongloop loopback-example-angular
strongloop loopback-example-app-logic
strongloop loopback-example-access-control
strongloop loopback-example-angular-live-set
strongloop loopback-example-connector remote
strongloop loopback-example-connector rest
strongloop loopback-example-connector soap
strongloop loopback-example-database mssql
strongloop loopback-example-database mysql
strongloop loopback-example-database oracle
strongloop loopback-example-database postgresql
strongloop loopback-example-database
strongloop loopback-example-kv-connectors
strongloop loopback-example-middleware
strongloop loopback-example-mixins
strongloop loopback-example-offline-sync
strongloop loopback-example-passport
strongloop loopback-example-relations
strongloop loopback-example-storage
strongloop loopback-example-user-management
strongloop loopback-example-isomorphic
strongloop loopback-example-xamarin
strongloop loopback-ios-getting-started
strongloop strong-error-handler
strongloop strong-remoting
strongloop loopback-component-storage
strongloop loopback-component-explorer
strongloop loopback-component-push
strongloop loopback-component-passport
strongloop loopback-component-oauth2
LIST_END
) | while read org repo branch; do
  # set default value for $branch
  : ${branch:=master}

  # Use github's raw content domain for downloading the raw README.md contents
  URL="https://raw.githubusercontent.com/$org/$repo/$branch/README.md"

  # Write the README.md to a file named after the repo
  echo "fetching $org/$repo/$branch..."
  curl -s $URL > pages/en/lb2/readmes/$repo.md
done
