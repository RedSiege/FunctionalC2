import logging
import urllib.parse
import urllib.request
import azure.functions as func

def main(req: func.HttpRequest) -> func.HttpResponse:
    #incoming_request = urlparse(req.url)
    #dict(req.headers).items()
    header_dict = {}
    get_url = 'http://<IPADDRESS>/FortyNorth/Gett'
    for key, value in dict(req.headers).items():
        header_dict.update({key : value})

    request = urllib.request.Request(get_url, headers=header_dict)
    with urllib.request.urlopen(request) as response:
        html = response.read()
    return func.HttpResponse(html)
