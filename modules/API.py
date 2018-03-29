from robot.libraries.BuiltIn import BuiltIn


class API():
    
    def create_session_at_API_base(self, api):
        requestsLib = BuiltIn().get_library_instance('RequestsLibrary')
        requestsLib.create_session("base", api)

    def make_request_to_endpoint(self, endpoint):
        requestsLib = BuiltIn().get_library_instance('RequestsLibrary')
        return requestsLib.get_request("base", endpoint)

    def is_response_200(self, resp):
        BuiltIn().should_be_equal(resp.status_code, 200)

    def does_response_contain_value(self, resp, val):
        contains = val in resp.json().values()
        BuiltIn().should_be_true(contains)
