Scenario: Check the title is correct
Given I am on main application page
When I save text of element located by `xpath((//p[@class='scaling-of-text-wrapper'])[16])` to scenario variable `title`
Then `#{eval("${title}" == "We can help you reimagine your business through a digital lens.")}` is = `true`

Scenario: Check the ability to switch Light / Dark mode
Given I am on main application page
When I click on element located by `xpath(//div[@class='header__vaulting-container']//div[@class='theme-switcher'])`
When I wait until element located by `xpath(//body[@class="fonts-loaded light-mode"])` appears
When I take screenshot

Scenario: Check that allow to change language to UA
Given I am on main application page
When I click on element located by `xpath(//button[@class='location-selector__button'])`
When I click on element located by `xpath(//a[@class='location-selector__link'][contains(text(),'Україна')])`
Then `${current-page-url}` is equal to `https://careers.epam.ua/`

Scenario: Check the policies list
Given I am on main application page
When I scroll element located by `xpath(//h2[normalize-space()='policies'])` into view
When I save text of element located by `xpath(//div[@class='policies-links-wrapper'])` to scenario variable `policies`
Then `${policies}` contains text `expected text`

Scenario: Check that allow to switch location list by region
Given I am on main application page
When I scroll element located by `xpath(//span[@class='museo-sans-light'][contains(text(),'Our')])` into view
When I save text of element located by `xpath(//a[normalize-space()='AMERICAS'])` to scenario variable `amer`
Then `#{eval("${amer}" == "AMERICAS")}` is = `true`
When I save text of element located by `xpath(//a[normalize-space()='EMEA'])` to scenario variable `amer`
Then `#{eval("${amer}" == "EMEA")}` is = `true`
When I save text of element located by `xpath(//a[normalize-space()='APAC'])` to scenario variable `apac`
Then `#{eval("${apac}" == "APAC")}` is = `true`
When I click on element located by `xpath(//a[normalize-space()='APAC'])`


Scenario: Check the search function
Given I am on main application page
When I click on element located by `xpath(//span[@class='search-icon dark-icon header-search__search-icon'])`
When I enter `AI` in field located by `xpath(//input[@id='new_form_search'])`
When I click on element located by `xpath(//span[normalize-space()='Find'])`
When I save text of element located by `xpath(//h2[normalize-space()='775 results for "AI"'])` to scenario variable `results`
Then `#{eval("${results}" == "775 results for "AI"")}` is = `true`

Scenario: Check form's fields validation
Given I am on a page with the URL 'https://www.epam.com/about/who-we-are/contact'
When I click on element located by `xpath(//button[normalize-space()='Submit'])`
When I wait until element located by `xpath((//span[@class='validation-tooltip'])[4])` appears
When I take screenshot

Scenario: Check that the Company logo on the header lead to the main page
Given I am on a page with the URL 'https://www.epam.com/about'
When I click on element located by `xpath(//img[@class='header__logo header__logo-light'])`
Then `${current-page-url}` is equal to `https://www.epam.com/`
