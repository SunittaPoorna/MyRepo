<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class apilib{

	
	function apilib(){
		date_default_timezone_set('Asia/Calcutta');
		if (!class_exists("phpmailer")) {
			include('lib/class.phpmailer.php');
		}
	}
	function nocache() 
	{
	    header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
	    header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
	    header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
	    header("Cache-Control: post-check=0, pre-check=0", false);
	    header("Pragma: no-cache");
	}
	
	/*
	 * Generate Unique APIKey
	 */
	function gen_sha1_id(){
		return  sha1( uniqid() );
	}
	
	function escapespecialchrs($text){
		return str_replace("'","''",$text);
	}
	
	function sendmail($from,$fromtxt,$to,$cc,$sub,$txt){
		
		
		$CI =& get_instance();
		$sett=$CI->jsadminmodel->getsettings(1);
		
		$mail = new PHPMailer();
//		
		$mail->IsSMTP(); // set mailer to use SMTP
		
//		$mail->SMTPSecure ="ssl";
//		
		$mail->Host = $sett->row()->host; // specify main and backup server
		
		$mail->Port=$sett->row()->port;
//		
		$mail->SMTPAuth = true; // turn on SMTP authentication
//		
		$mail->Username = $sett->row()->hostUsername; // SMTP username
//		
		$mail->Password = $sett->row()->hostPassword; // SMTP password
//		
		$mail->From = $from==""?$sett->row()->from:$from;
//		
		$mail->FromName = $fromtxt==""?$sett->row()->fromText:$fromtxt;
//		
		$address=explode(",",$to);
//		
		foreach ($address as $t){
			$mail->AddAddress($t); // Email on which you want to send mail
		}
		
		if($cc!=""){
			$addresscc=explode(",",$cc);
	//		
			foreach ($addresscc as $tcc){
				$mail->AddCC($tcc); 
			}
		}
//		
//		
		$mail->AddReplyTo('info@juegostudio.com', 'Info-Juego Studio'); //optional
//		
		$mail->IsHTML(true);
//		
		$mail->Subject = $sub;
//		
		$mail->Body = $txt;
//		
		return $mail->Send();
		
		
	}
	
	function sendmailattachments($from,$fromtxt,$to,$sub,$txt,$path){
		//include('lib/class.phpmailer.php');
		if (!class_exists("phpmailer")) {
			include('lib/class.phpmailer.php');
		}
		$mail = new PHPMailer();
		
		$mail->IsSMTP(); // set mailer to use SMTP
		
		$mail->Host = 'mail.classictelco.com.au'; // specify main and backup server
		
		$mail->SMTPAuth = true; // turn on SMTP authentication
		
		$mail->Username = 'info@classictelco.com.au'; // SMTP username
		
		$mail->Password = 'classic123'; // SMTP password
		
		$mail->From = $from;
		
		$mail->FromName = $fromtxt;
		
		$address=explode(",",$to);
		
		foreach ($address as $t){
			$mail->AddAddress($t); // Email on which you want to send mail
		}
		
		
		$mail->AddReplyTo('info@classictelco.com.au', 'Info'); //optional
		
		$mail->IsHTML(true);
		
		$mail->Subject = $sub;
		
		$mail->Body = $txt;
		
		$mail->AddAttachment($path);
		
		return $mail->Send();

	}
	function getCustomDate($dateFormat,$date){
		
            if(is_nan($date)){
                    //date_default_timezone_set('UTC');
                return mdate($dateFormat,strtotime(trim($date)));
            }else{
                return mdate($dateFormat,trim($date));
            }
		
	}
	
}