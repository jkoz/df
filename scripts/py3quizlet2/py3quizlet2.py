import random
from urllib.parse import urlencode

import requests

# http://www.tp.com/quizletapp
# https://quizlet.com/api-dashboard


class Quizlet():
    auth_url_base = 'https://quizlet.com/authorize'
    token_url_base = 'https://api.quizlet.com/oauth/token'
    api_url_base = 'https://api.quizlet.com/2.0'

    def __init__(self):
        self.client_id = "N5E5kywUwf"
        self.client_secret = "GBeE5bf2WKp9vEI0y2sn8Q"
        self.redirect_uri = "http://zhangyi.org"
        self.access_info = None
        self.all_sets = None
        self._token = None



    #def __init__(self, client_id, client_secret, redirect_uri):
        #self.client_id = client_id
        #self.client_secret = client_secret
        #self.redirect_uri = redirect_uri
        #self.access_info = None

    #
    # Auth Flow
    #
    def generate_auth_url(self, scope):
        # Generate randome string of 10 hexadecimal digits
        state = '%010x' % random.randrange(16 ** 10)
        params = {'scope': scope,
                  'client_id': self.client_id,
                  'response_type': 'code',
                  'state': state}
        auth_url = '?'. join([Quizlet.auth_url_base, urlencode(params)])
        return (auth_url, state)

    def request_token(self, code):
        data = {'grant_type': 'authorization_code',
                'code': code,
                'redirect_uri': self.redirect_uri,
                'client_id': self.client_id,
                'client_secret': self.client_secret
                }
        headers = {
            'Content-type': 'application/x-www-form-urlencoded;charset=UTF-8',
            'Authorization': 'Basic %s' % self.client_secret}
        r = requests.post(Quizlet.token_url_base, headers=headers, data=data)

        # Keys: access_token, token_type, expires_in, scope, user_id
        self.access_info = r.json()

    #
    # Request Utility
    #
    def make_request(self, api_path, params=None, type='get'):
        params = params if params else {}
        request_url_base = '/'.join([Quizlet.api_url_base, api_path])
        headers = {'Authorization': ' '.join(
            ['Bearer', self.access_info['access_token']])}

        # TODO(hammer): clena up this design
        if type == 'get':
            r = requests.get(request_url_base, headers=headers, params=params)
        elif type == 'post':
            r = requests.post(request_url_base, headers=headers, data=params)

        return r.json()

    #
    # Useful Requests
    #
    def get_sets(self):
        self.all_sets = self.make_request('/'.join(['users', self.access_info['user_id'], 'sets']))
        i = 1
        for se in self.all_sets:
            print(str(i) + ": " + se['title'])
            i = i + 1

def delete_all_nait_sets(self):
    self.all_sets = self.make_request('/'.join(['users', self.access_info['user_id'], 'sets']))
    i = 1
    for se in self.all_sets:
        if se['title'].startswith("NAIT_"):
            card_id = str(se['id'])
            print(type(card_id))
            #self.make_request('/'.join(['sets', card_id]))

    def add_set(self, title, terms, definitions, lang_terms, lang_definitions):
        params = {'title': title,
                  'terms[]': terms,
                  'definitions[]': definitions,
                  'lang_terms': lang_terms,
                  'lang_definitions': lang_definitions}
        return self.make_request('sets', params, 'post')
