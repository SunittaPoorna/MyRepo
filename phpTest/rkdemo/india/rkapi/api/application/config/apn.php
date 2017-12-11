<?php
/*
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|| Apple Push Notification Configurations
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*/


/*
|--------------------------------------------------------------------------
| APN Permission file
|--------------------------------------------------------------------------
|
| Contains the certificate and private key, will end with .pem
| Full server path to this file is required.
|
*/

/* Development */
//$config['PermissionFile'] = realpath('lib/RK_PushCertificateKey.pem');

/*Production */
$config['PermissionFile'] = realpath('lib/RK_Dist_Push_PHP.pem');
/*
|--------------------------------------------------------------------------
| APN Private Key's Passphrase
|--------------------------------------------------------------------------
*/
/* Development */
//$config['PassPhrase'] = '1234';

/*Production */
$config['PassPhrase'] = 'Saritha@123';

/*
|--------------------------------------------------------------------------
| APN Services
|--------------------------------------------------------------------------
*/
$config['Sandbox'] = false;
$config['PushGatewaySandbox'] = 'ssl://gateway.sandbox.push.apple.com:2195';
$config['PushGateway'] = 'ssl://gateway.push.apple.com:2195';

$config['FeedbackGatewaySandbox'] = 'ssl://feedback.sandbox.push.apple.com:2196';
$config['FeedbackGateway'] = 'ssl://feedback.push.apple.com:2196';


/*
|--------------------------------------------------------------------------
| APN Connection Timeout
|--------------------------------------------------------------------------
*/
$config['Timeout'] = 60;


/*
|--------------------------------------------------------------------------
| APN Notification Expiry (seconds)
|--------------------------------------------------------------------------
| default: 86400 - one day
*/
$config['Expiry'] = 86400;