Tweet My Rep is a self-guided project. This app allows
users to search their United States Congressional and Senate
Representatives by zip code. Once the congress members have been
identified, app users will be able to send tweets to the legislators.
If the legislator does not have a twitter id, the user will be able to send
an email to the representative

The three most recent New York Times articles about each legislator will
be available on the same page where tweets are composed.

To find the legislators who represent a zipcode I used the Sunlight
Foundation's API and as well as imported a csv of all zipcodes in the United States.
Each zipcode record has a longitude and latitude. When a user enters
a zipcode in the search field after logging in, the database is queried and
the corresponding coordinates are sent to the Sunlight Foundation legislator
locator endpoint.

After searching, users see a list of legislators and can contact them
by email or twitter.

There is also a feature that generates a random zipcode.
