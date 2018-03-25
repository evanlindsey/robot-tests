from robot.libraries.BuiltIn import BuiltIn

from Browser import Browser


class Pages(object):
        
    def go_to_page(self, url):
        browser = Browser()
        browser.open_test_browser(url)
        
    def is_page_open(self, term):
        seleniumlib = BuiltIn().get_library_instance('Selenium2Library')
        seleniumlib.wait_for_condition("return document.title.includes('{0}')".format(term), 5)
