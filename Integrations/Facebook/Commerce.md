# Upload Stock Items from the to a Facebook Commerce Catalog With a Data Feed

The Facebook Integration for the Alliance Business Suite allows you to maintain a data feed to bulk upload Published Stock Items (Store Products) to your catalog using an automatically generated spreadsheet file. 

You will need to configure the data feed on the Facebook Commerce Manager by a file once or set up a schedule to update your catalog automatically on a regular basis. Your catalog can hold multiple data feeds, but each data feed must contain different items.

Note: These steps are to set up a new data feed. Depending on the feed configuration, Facebook will automatically retrieve and update published items on a schedule.


## Configure a new data feed to a catalog

To upload a new data feed to your catalog: 

1. Go to Commerce Manager and select your catalog.
1. Open the Catalog tab and go to Data Sources.
1. Select Data Feed. 
1. Select Scheduled Feed.
1. Enter the URL on the following form `https://your-portal-domain.com/api/v2/Integrations/Facebook/Stores/Catalog` ( You can test the URL in your browser to make sure it downloads your file.)
1. Choose an hourly, daily, or weekly upload schedule for your data feed. Select Next.
1. Review your data feed’s settings. Select to make any changes. The default currency will only be used if prices in your file don't include a currency code.

Review your data feed’s settings. Select to make any changes. The default currency will only be used if prices in your file don't include a currency code.

Select Save Feed and Upload.

You've uploaded a new data feed from a URL. Your data feed now appears in Data Sources. You can select it to see an overview or manage its settings. To update your items in the future, edit your file and save it again on your hosting website. We'll fetch it from its URL to update your catalog at your scheduled times. You can edit your schedule or request a single upload sooner in your data feed's settings.

