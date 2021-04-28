# Viewing Statistics
To view the reports on disk space and traffic usage by your account:

## 1. Select your subscription.
If you have several subscriptions associated with your account, select the required subscription in the Subscription menu at the top of the screen.

## 2. Go to Statistics.

The following information is presented in charts:

Disk space used by the following files and directories in the subscription:
- Websites
- Mail accounts
- Databases
- Logs
- Backups
- Chroot directories
- Configuration files
- Anonymous FTP directory
- Traffic used by FTP, web, and mail services during the current month.

**FTP** field shows the information about the total size of files transferred to and from the subscription over the file transfer protocol.

**HTTP** field shows the information about the total amount of data transferred from all of your websites over HTTP protocol, that is, retrieved by web browsers.

**POP3/IMAP** field shows the total amount of data received by all mail accounts under your domains.

**SMTP** field shows the total amount of data sent by all mail accounts under your domains.

## 3. Do any of the following:

- To view a report on the amount of data transferred to and from your sites over FTP, click FTP Statistics.
- To view a report on the amount of data transferred to and from your FTP directory, which is accessed without authorization, click **Anonymous FTP statistic**s.
- To view a report on the amount of traffic used by services during a certain month, click **Data Transfer Statistics,** and select the required month from the menu.

Remember that your subscription can be suspended automatically if you overuse disk space depending on the Provider's policy. Here are some tips that can help you free up some space:

- Remove any unnecessary and/or obsolete files that are stored in the httpdocs folder.
- Configure log rotation as described in the Log Files section.
- Delete outdated emails, or configure your mail client to download email messages from the server by switching to POP3. See the Access Your Mailbox section for more information.
- Remove outdated backup files as described in the Uploading and Downloading Backup Files section.
- Remove unnecessary databases. See the **Website Databases** section for more information.

The Disk space usage by services chart displays how much space is taken up by website content, emails, backups, logs, and databases. It makes sense to pay attention to the services that use the most disk space. If none of the steps above helped, contact your provider to increase the amount of disk space available to your subscription.

![view-statistics.png](/.attachments/view-statistics-471543ad-9c84-4ec8-9d06-a1e29778bd42.png)
