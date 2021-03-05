# WordPress Tips

## WordPress Installation manual

Requirements on the server side # Requirements on the server side

* PHP 7.4 or greater
* MySQL 5.6 or MariaDB 10.1 or greater

### Changing File Permissions [More info](https://wordpress.org/support/article/changing-file-permissions/)

Permission Modes
```console
 7       5    5
 user   group  world
 r+w+x  r+x    r+x
 4+2+1  4+0+1  4+0+1 = 755
```

The permission mode is computed by adding up the following values for the user, the file group, and for everyone else. The diagram shows how.

- Read      4 – Allowed to read files
- Write     2 – Allowed to write/modify files
- eXecute   1 – Read/write/delete/modify/directory

```shell
7       4     4
user   group  world
r+w+x    r      r
4+2+1  4+0+0 4+0+0  = 744
```

Example Permission Modes
```shell
Mode	Str Perms	Explanation
0477	-r–rwxrwx	owner has read only (4), other and group has rwx (7)
0677	-rw-rwxrwx	owner has rw only(6), other and group has rwx (7)
0444	-r–r–r–	all have read only (4)
0666	-rw-rw-rw-	all have rw only (6)
0400	-r——–	owner has read only(4), group and others have no permission(0)
0600	-rw——-	owner has rw only, group and others have no permission
0470	-r–rwx—	owner has read only, group has rwx, others have no permission
0407	-r—–rwx	owner has read only, other has rwx, group has no permission
0670	-rw-rwx—	owner has rw only, group has rwx, others have no permission
0607	-rw—-rwx	owner has rw only, group has no permission and others have rwx
```

Additional directories under /wp-content/ should be documented by whatever plugin / theme requires them. Permissions will vary.
```shell
/   
|- index.php
|- wp-admin
|   - wp-admin.css
|- wp-blog-header.php
|- wp-comments-post.php
|- wp-commentsrss2.php
|- wp-config.php
|- wp-content
|   |- cache
|   |- plugins
|   |- themes
|   - uploads
|- wp-cron.php
|- wp-includes
- xmlrpc.php
```

Using the Command Line
```shell
chmod -v 746 DIR
chmod -v 747 DIR
chmod -v 756 DIR
chmod -v 757 DIR
chmod -v 764 DIR
chmod -v 765 DIR
chmod -v 766 DIR
chmod -v 767 DIR
```

