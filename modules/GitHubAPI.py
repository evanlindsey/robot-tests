from robot.libraries.BuiltIn import BuiltIn

from API import API


class GitHubAPI(API):
    
    API_URL = "https://api.github.com"

    def get_api(self):
        return  self.API_URL;
    
    def get_user_endpoint(self, user):
        return "/users/{0}".format(user)
