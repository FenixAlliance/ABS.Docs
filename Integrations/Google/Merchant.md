# Mantaining a Google Merchant Center Data Feed through the Alliance Business Suite

The Alliance Business Suite's Google Merchant Integration can help you upload your product data in Google Merchant Center, it automatically exposes the data to be submitted to your feeds. 

To configure this capability, you will need to set up any new feed, and once a feed is registered, it will be updated on a regular basis without having to register it again.

Although feeds are multi-currency, they display the base amount without shipment nor tax data, but we're currently working on multi-country feeds. 🥳

The data endpoint to point Google Merchant Center to can be constructed using the following route:

 `https://your-portal-domain.com/api/v2/Integrations/Google/Merchant/Catalog?CurrencyID=USD`

# Configuring survey opt-in 

To set up the Google Merchant Survey Opt-In, all you need to do is to plug your Google Merchant ID into the integration configuration page.

To set up your Merchant ID, navigate to the Studio on any Web Portal, head to Integration > Google > Merchant, and place your Google Merchant ID on the form field, then save changes.