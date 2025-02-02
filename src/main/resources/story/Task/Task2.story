Scenario: Verify that allows register a User
Given I am on main application page
When I click on element located by `xpath(//a[normalize-space()='Register'])`
When I click on element located by `xpath(//input[@value='M'])`
When I add `#{generate(Name.firstName)}` to field located by `xpath(//input[@name='FirstName'])`
When I add `#{generate(Name.lastName)}` to field located by `xpath(//input[@name='LastName'])`
When I add `#{generate(Internet.emailAddress)}` to field located by `xpath(//input[@name='Email'])`
When I add `qwerty12345` to field located by `xpath(//input[@name='Password'])`
When I add `qwerty12345` to field located by `xpath(//input[@name='ConfirmPassword'])`
When I click on element located by `xpath(//input[@name='register-button'])`
When I save text of element located by `xpath((//div[@class='result'])[1])` to scenario variable `Sucess`
Then `#{eval("${Sucess}" == "Your registration completed")}` is = `true`
When I click on element located by `xpath(//a[@class='ico-logout'])`


Scenario: Verify that allows login a User
Given I am on main application page
When I click on element located by `xpath(//a[@class='ico-login'])`
When I enter `${UserEmail}` in field located by `xpath(//input[@class='email'])`
When I enter `${UserPass}` in field located by `xpath(//input[@id='Password'])`
When I click on element located by `xpath(//input[@value='Log in'])`
When I save text of element located by `xpath(//a[normalize-space()='taraskovbasyk@2000gmail.com'])` to scenario variable `LogIn`
Then `#{eval("${LogIn}" == "taraskovbasyk@2000gmail.com")}` is = `true`


Scenario: Verify that Computers group has 3 sub-groups with correct names
Given I am on main application page
When I click on element located by `xpath((//a[normalize-space()='Computers'])[1])`
When I COMPARE_AGAINST baseline with name `Computers2` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE	|
|2		|


Scenario: Verify that allows sorting items (different options)
Given I am on a page with the URL 'https://demowebshop.tricentis.com/apparel-shoes'
When I click on element located by `xpath(//select[@id='products-orderby'])`
When I click on element located by `xpath(//*[@id="products-orderby"]/option[4])`
When I save text of element located by `xpath((//span[@class='price actual-price'])[1])` to scenario variable `1st_el`
When I save text of element located by `xpath((//span[@class='price actual-price'])[last()])` to scenario variable `last_el`
Then `#{eval("${last_el}" > "${1st_el}")}` is = `true`
When I click on element located by `xpath(//*[@id="products-orderby"]/option[5])`
When I save text of element located by `xpath((//span[@class='price actual-price'])[1])` to scenario variable `1st_el`
When I save text of element located by `xpath((//span[@class='price actual-price'])[last()])` to scenario variable `last_el`
Then `#{eval("${last_el}" < "${1st_el}")}` is = `true`


Scenario: Verify that allows changing number of items on page
Given I am on a page with the URL 'https://demowebshop.tricentis.com/apparel-shoes'
When I click on element located by `xpath(//select[@id='products-pagesize'])`
When I click on element located by `xpath(//*[@id="products-pagesize"]/option[1])`
Then number of elements found by `xpath(//div[@class='product-item'])` is equal to `4`
When I click on element located by `xpath(//select[@id='products-pagesize'])`
When I click on element located by `xpath(//*[@id="products-pagesize"]/option[2])`
Then number of elements found by `xpath(//div[@class='product-item'])` is equal to `8`


Scenario: Verify that allows adding an item to the Wishlist
Given I am on a page with the URL 'https://demowebshop.tricentis.com/apparel-shoes'
When I click on element located by `xpath(//a[normalize-space()='Blue and green Sneaker'])`
When I click on element located by `xpath(//input[@value='Add to wishlist'])`
Then element located by `xpath(//div[@id='bar-notification'])` appears in `PT1S`



Scenario: Verify that allows adding an item to the card
Given I am on a page with the URL 'https://demowebshop.tricentis.com/apparel-shoes'
When I click on element located by `xpath(//a[normalize-space()='Blue and green Sneaker'])`
When I click on element located by `xpath((//input[@value='Add to cart'])[1])`
When I click on element located by `xpath(//span[normalize-space()='Shopping cart'])`
Then number of elements found by `xpath(//td[@class='product'])` is equal to `1`


Scenario: Verify that allows removing an item from the card
Given I am on a page with the URL 'https://demowebshop.tricentis.com/cart'
When I check checkbox located by `xpath(//td[@class='remove-from-cart'])`
When I click on element located by `xpath(//input[@name='updatecart'])`
Then number of elements found by `xpath(//td[@class='product'])` is equal to `0`


Scenario: Verify that allows checkout an item
Given I am on a page with the URL 'https://demowebshop.tricentis.com/blue-and-green-sneaker'
When I click on element located by `xpath((//input[@value='Add to cart'])[1])`
When I click on element located by `xpath(//span[normalize-space()='Shopping cart'])`
When I check checkbox located by `xpath(//input[@id='termsofservice'])`
When I click on element located by `xpath(//button[@id='checkout'])`
When I select `New Address` in dropdown located by `xpath(//select[@id='billing-address-select'])`
When I select `Angola` in dropdown located by `xpath(//select[@id='BillingNewAddress_CountryId'])`
When I add `#{generate(Address.city)}` to field located by `xpath(//input[@id='BillingNewAddress_City'])`
When I add `#{generate(Address.streetAddress)}` to field located by `xpath(//input[@id='BillingNewAddress_Address1'])`
When I add `#{generate(Address.postcode)}` to field located by `xpath(//input[@id='BillingNewAddress_ZipPostalCode'])`
When I add `#{generate(PhoneNumber.cellPhone)}` to field located by `xpath(//input[@id='BillingNewAddress_PhoneNumber'])`
When I click on element located by `xpath(//input[@onclick='Billing.save()'])`
When I click on element located by `xpath(//input[@onclick='Shipping.save()'])`
When I click on element located by `xpath(//input[@onclick='ShippingMethod.save()'])`
When I click on element located by `xpath(//input[@onclick='PaymentMethod.save()'])`
When I click on element located by `xpath(//input[@onclick='PaymentInfo.save()'])`
When I click on element located by `xpath(//input[@value='Confirm'])`
When I save text of element located by `xpath(//div[@class='title'])` to scenario variable `Success_msg`
Then `#{eval("${Success_msg}" == "Your order has been successfully processed!")}` is = `true`
