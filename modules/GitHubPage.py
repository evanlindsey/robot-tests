from robot.libraries.BuiltIn import BuiltIn

from Pages import Pages


class GitHubPage(Pages):
    
    ROBOT_LIBRARY_VERSION = 1.0
    
    URL = "https://github.com/"
    OVERVIEW_TAB = "//*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[1]"
    REPOSITORIES_TAB = "//*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[2]"
    STARS_TAB = "//*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[3]"
    FOLLOWERS_TAB = "//*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[4]"
    FOLLOWING_TAB = "//*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[5]"
    
    def get_url(self):
        return self.URL

    def get_avatar_source(self):
        seleniumlib = BuiltIn().get_library_instance('Selenium2Library')
        seleniumlib.get_element_attribute("class: avatar", "src")
    
    def click_repositories_tab(self):
        seleniumlib = BuiltIn().get_library_instance('Selenium2Library')
        seleniumlib.click_element("xpath: {0}".format(self.REPOSITORIES_TAB))
        
