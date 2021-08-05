WordPress migration can be a challenge. You may want to change web hosting providers for various reasons, for example, increasing costs or poor service provision. Hosting frustrations can build up over time. Maybe due to hosting costs or a gap in service delivery, like constant downtime.

Either way, the reason is simple: moving hosts is a daunting prospect. So many website owners simply put off this decision, worried that moving hosts will make their existing problems even worse. But by properly understanding WordPress hosting migration, you can go through the process of changing hosting providers quite smoothly.

Expert or DIY WordPress migration?
expert or DIY WordPress migration? Plesk
One thing you can do to manage WordPress Migration better is getting expert help. Experts can help you find a new, suitable host. In fact, some hosts can even help you make the transition. But it’s still entirely feasible to transfer a WordPress site on your own. You just need to be aware of some of the following basic principles.

The key lies in the preparation. If you follow the right preparatory steps, moving your website is simple. If you approach it in the right way, WordPress hosting migration is simple. The right steps also help you reverse migration without adverse consequences. So that you can go back if you realize you’ve made a mistake.

Want to try migrating your WordPress site on your own? Then here are the five steps you need to follow.

1. Backup and export before WordPress migration
Backup and export before WordPress migration plesk
When you migrate a website, you want to know that you can always go back to your starting point – should something go wrong. This is why backing up is, without a doubt, your first step. A backup is a requirement when shifting a WordPress installation across to another server. You will also need to export your WordPress database.

Backing up a WordPress instance to transfer WordPress site
You can backup your WordPress site files ( plugins, themes, core files and uploaded content ) by:

using any backup plugins
accessing your host via ssh, archiving everything using tar/zip and passing it to another host via scp connection
archiving and downloading the files by utilizing the file managing functionalities of hosting platforms like Plesk Obsidian or cPanel
using dedicated WordPress management solutions like Plesk WordPress Toolkit ( if your current host is using Plesk Obsidian )
using an FTP app ( such as Filezilla, WinSCP or CuteFTP ) to connect to your web host and download all the files on your host’s machine to your desktop PC. Note that some important files are hidden, including .htaccess, but you can view these if you set the right options inside your FTP client. Also note that downloading these files can take a long time depending on how expansive your WordPress instance is, and how many media files you use in your website.
Copy your WordPress database
Next, make a copy of your WordPress database. You can do this while you’re downloading the site files with FTP. You can copy your database in many ways. Let’s focus on the one which utilizes the power of the PhpMyAdmin tool.

WordPress database export is straightforward. But you have to consider a couple of things. First, you need to log into your web server’s hosting control panel (example, Plesk Obsidian or cPanel ) and open the phpMyAdmin web interface. This shows a list of databases on the left. You need to select the database that matches your WordPress installation here. Next, click on the Export tab to access the Export page.

Thankfully phpMyAdmin offers a default setting, called “Quick”. Tap Quick and then Go to start the database export process. The file then downloads to your PC.

2. Configure database on new WordPress hosting server
Configure database on new WordPress hosting server plesk
Before you upload your WordPress site files. First you need to set up the WordPress database on your new server. To do this, you need to log in to the control panel on your new host. Since MySQL is the most commonly used database, we’ll use it in this example. But your host may be using a different database app. If that’s the case, you need to contact their support team to find out how to create a new database.

Let’s focus on two situations, when your host has Plesk Obsidian or cPanel.

a) Plesk: choose “Databases” and click “Add new database”. Add the name of the databases leaving unchanged name’s prefix, select the website your new database will be related to, add user and its password and submit this data.

b) cPanel: first, open MySQL Databases and create a new database with a name that is appropriate for your website. Next, add a MySQL user and include a secure password too. Finally, make sure this account has the right privileges by granting it “All Privileges” rights.

Copy down the database password, and the database name. You’ll need these for the WordPress configuration file.

3. Change WP config file for WordPress migration
Every WordPress instance has a configuration file. This file contains the details for WordPress to connect to the site’s database. Find this file in the content you’ve previously backed up. It should be in the root folder in the location where you stored the files. It’s called wp-config.php.

Back up this file in another folder on your computer. So that you can restore the changes you made in case something goes wrong later. Now, open the original version with a text editor and make the following modifications:

Edit the database name
Find the line that says

define('DB_NAME', 'database_name');

and change ‘database_name into the name of the new WordPress database that you just created. Currently ‘database_name’ will be the name of your existing database’s name.

Add the new database username and password
Changing the database credentials is just as easy. For the username, find the line

define('DB_USER', 'database_user');

Here you need to update ‘database_user’ so that it contains the username for your new database.

Next, find the line that says:

define('DB_PASSWORD', 'database_password');

Likewise, simply change ‘database_password’ to be your new database password. Once you’re done save the wp-config.php file and close it.

4. Upload WordPress database and files
Change WP config file for WordPress migration plesk
You can now start to import your WordPress site, firing it up with your new hosting provider.

Importing the database
First launch phpMyAdmin from your control panel and select the new database from the options on the left. Next, open the Import tab from the nav bar.

You now need to import the actual database file. Select Choose File in the section that says File to Import and open the file that you previously exported to your desktop PC. Make sure that Partial Import is not selected. And ensure that you’ve set the database type to SQL. That’s it, now click Go.

Note that some larger databases can take a very long time to import successfully. But you’ll get a confirmation message telling you when the database import is complete.

Upload your site files
After you prep the database and have your wp-config.php ready, you can then upload the files on your site. You now need to connect your FTP program with your new web host. Once ready, you simply locate your files on your PC. You need to select the right remote directory: this may be the root public_html folder, or it may be another folder. Check with your host.

Once you pick the right remote directory, you can start to upload the files. These will include the wp-config.php file that you modified to reflect the login details for the database at your new host. Depending on your connection, uploading can take longer than downloading. You may need to leave some time for this to complete before moving on with your WordPress migration.

Transfer your domain and link to the new URL
WordPress migration also often involves moving to a new domain. If that’s the case, you need to read this step. If, however, you’re keeping your domain, you can skip this step. Changing your domain can cause various issues, unless you try to mitigate them.

First, you can struggle moving a site to a new domain when you add a lot of links to internal site posts using a full URL. Likewise, if you refer to images on your site using a full URL, you’ll break the image link once you change the domain that’s included at the start of every URL.

However, you can automatically search for these links and replace them. You can do this by using Search Replace DB, which is a script that you can download from GitHub. Once you’re done with this tool, make sure you delete it. It presents a security risk if it stays around without being used. Also note that you shouldn’t install this tool in the root of your domain. Instead, create a temporary folder with a completely random name that’s not likely to be guessed.

Changing your WordPress site’s address
Your site URL is also altered during the search and replace process. In other words, your home URL and site URL values are up-to-date so they represent the new domain. This means that when you try and log in to your new site, you immediately go to the right location. And not the old one.

5. Finish up your WordPress migration
Finish up your WordPress migration plesk
You’re nearly done with your WordPress migration. But you have a few more steps that you need to complete first. You may have to wait a few days between these steps too.

Your website’s domain will still be pointing to your old host. So you need to redirect your DNS (domain name server) settings to ensure requests direct to your new hosting provider. The process varies depending on where your domain is registered and hosted.

It’s not possible to give full instructions here as the number of different routes are simply too varied. However, your domain registrar can assist you. Note that it can take some time before a change in domain details is fully effective, up to 48 hours. This process is known as domain propagation and is, unfortunately, unavoidable.

Importantly, you shouldn’t make any changes to your site during this period. You may end up changing the site on your original website host, and not your new site instance. After 48 hours you should be fine to make changes, and to delete the contents of your old site at your old hosting provider. Always keep your backup files on your local PC. And keep your old wp-config.php file just in case you need to refer to it.

The process of WordPress site migration isn’t complicated. But you should be careful every step of the way. Always ensure you store your original site on your PC. So that you can go back if there’s any problem.