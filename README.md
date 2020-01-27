# Run Wordpress on gitpod

You can use this repository to run a plain WordPress installation on [Gitpod](https://gitpod.io).

Using:
  
Apache
  
MySql
- User: root
- Pass: (no password)
  
WP-CLI
- Admin User: gitpod
- Admin pass: gitpod

## Useful commands

- Create dummy posts
```curl http://loripsum.net/api/3 | wp post generate --post_content --count=10```

This project was forked from [https://github.com/meysholdt/laravel-apache-mysql-php-in-gitpod-example](https://github.com/meysholdt/laravel-apache-mysql-php-in-gitpod-example) and adapted to WordPress :)

Big thanks to [meysholdt](https://github.com/meysholdt) and [alesanchezr](https://github.com/alesanchezr)
