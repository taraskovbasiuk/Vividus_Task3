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

Scenario: Verify that allows adding an item to the Wishlist
Given I am on a page with the URL 'https://demowebshop.tricentis.com/apparel-shoes'
When I click on element located by `xpath(//a[normalize-space()='Blue and green Sneaker'])`
When I click on element located by `xpath(//input[@value='Add to wishlist'])`
Then element located by `xpath(//div[@id='bar-notification'])` appears in `PT1S`
