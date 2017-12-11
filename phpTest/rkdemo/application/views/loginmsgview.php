<?php 
	$class="error";
	$alertmessage="User Name or Password is wrong!!!";
	if($result==1){
		$alertmessage="Successfully Logged in!!!";
		$class="";
	}else if($result==-1){
		$class="error";
		$alertmessage="Your account is suspended!!!";
	}
	else if($result==2)
	{
		$class="error";
		$alertmessage="Captcha code was not match, please try again!!!";
	}
	else if($result==3)
	{
		$class="error";
		$alertmessage="Login attempt got over try again after 1 mins";
	}
?>
<?php echo $alertmessage?>