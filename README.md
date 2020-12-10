## Brikalot: A Property Investment Platform

[Brikalot](https://brikalot.herokuapp.com/) is a platform that enable investors to own units of a property by acquiring units they can afford. The platform was built with the following tools.

* Frontend
  * HTML, CSS, JavaScript


* Backend
  * Ruby on Rails v5


* Libraries and Integration
  * Bootstrap v4
  * DataTables plugin
  * Braintree (card and paypal processing)
  * Google Places API

Check out the [repo](https://github.com/jkups/project1) here.
### List of Features
##### 1. User and Account setup
You can setup a user profile on the platform. To make an investment though, you will be required to create an investment account. You can create unlimited number of investment accounts tied to a single user profile.

Each property unit acquired is associated with an investment account making it possible to manage an investment portfolio across different investment philosophies under a single login credential.

#### 2. Payment Integration
The platform comes setup with two payment option - Credit/Debit Card and Paypal. All popular cards are accepted including MasterCard, Visa, AmericanExpress, etc.

#### 3. Investment Dashboard
All investment activity on each account is logged and a history of succesful transaction presented in a clear to understand dashboard. The dashboard shows a list of all investments that have been made on the account, how much was invested and fees paid. It also includes a summary at the account level.

### TODO
1. Search function to filter listed properties
2. A geocoded view of the property listing
3. Deactivate the property when fully subscribed
4. Logic of dividend and investment returns
5. Admin / backend setup
