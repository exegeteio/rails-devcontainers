bundle install --path=vendor/bundle
yarn install

sudo service postgresql start
sudo service redis-server start

# Create PostgreSQL users and databases
sudo su postgres -c "createuser --superuser vscode"
