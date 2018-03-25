from robot.libraries.BuiltIn import BuiltIn


class Browser(object):
    
    BROWSER = "chrome"

    def open_test_browser(self, url):
        seleniumlib = BuiltIn().get_library_instance('Selenium2Library')
        seleniumlib.open_browser(url, self.BROWSER)        
