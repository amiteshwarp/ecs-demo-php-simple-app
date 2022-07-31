<?php
	header( 'Access-Control-Allow-Origin: http://web.residentinsuredev.com' );
	$curl = curl_init();
	$method = 'GET';
	$url = 'users';
	switch( $_REQUEST['module'] ) {
		case 'get-user':
			$url = $url . '/' . $_REQUEST['query'];
			break;
	}

	curl_setopt_array( $curl, [
		CURLOPT_URL => "https://reqres.in/api/" . $url,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => $method
	]);

	curl_setopt( $curl, CURLOPT_HTTPHEADER, [
		"cache-control: no-cache"
	]);

	$response = curl_exec($curl);
	$error = curl_error($curl);

	curl_close($curl);

	if( $error ) {
		echo "cURL error #:" . $error;
	} else {
		echo $response;
	}
exit;