# Run Wordpress on gitpod

You can use this repository to run a plain WordPress installation.

Using:
  
Apache
  
MySql
- User: root
- Pass: (no password)
  
WP-CLI
- Admin User: gitpod
- Admin pass: gitpod

WiP... 
You'll have to run these commands manually. Change accordingly:
```bash
wp config create --dbname=wpclidemo --dbuser=root --dbpass=
wp db create
wp core install --url=$(gp url 8080) --title="WP-Gitpod" --admin_user=gitpod --admin_password=gitpod --admin_email=admin@email.com
```
