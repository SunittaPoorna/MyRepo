<?php
class api extends CI_Controller{
    /*
     * Constructor
     */
    function __construct(){
        parent::__construct();
        $this->load->model("apimodel","",true);
    }
    /*
     * Index
     */
    function index(){
        $value=array(
            'errorCode'=>0,
            'msg'=>'Welcome to Raksha Kids API...'
        );
        echo json_encode($value);
    }
    
//    function createUserSchools(){
//        
//        $result = $this->apimodel->createUserSchools(1);
//        
//        echo $result;
//        
//    }
//    
//    function createPassCodes(){
//        
//        $result = $this->apimodel->createPassCodes();
//        
//        echo $result;
//        
//    }

    /**
     * Sends mobile msgs to parents, 
     *
     * @param      Count to be sent, schoolId
     * @return     Json array
     */
   function sendMsg()
    {
        $max=$this->input->get_post("count");
        $schoolId=$this->input->get_post("schoolId");
        $usersMsgQ = $this->apimodel->getMsg("",2,$schoolId);
        $i=0;
        foreach ($usersMsgQ->result() as $row)
        {
            $i++;
            if($i>$max)
            {
                break;
            }
            $message=$row->message;
            $to=$row->phone;
            $url="http://sms.skillvent.com/API/WebSMS/Http/v1.0a/index.php?username=poornaapps&password=Saritha@123&sender=RAKSHA&to=$to&message=$message&reqid";
            $ch = curl_init();

            // set URL and other appropriate options
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HEADER, 0);

            // grab URL and pass it to the browser
           

            // close cURL resource, and free up system resources
            
            $data = array(
                "msgId" => $row->msgId,
                "sentDate" => $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
                "status" => 1
            );
            

            if( curl_exec($ch)){
                
                $this->apimodel->updateSentMsg($data);

//                echo "Sent Mail<br>";
                
            }
            curl_close($ch);
            
        }
        echo $i;
    }
    
    /**
     * Sends emails to the parents 
     *
     * @param       None
     * @return     Json array
     */
    function saveToSendEmail(){
        
        // $to = "lairapoornapp@gmail.com";
        
        $schoolId = $this->input->get_post("schoolId");
        
        $templateId = $this->input->get_post("templateId");
        
        $cc = "";
        
        $count = 0;
        
        $usersEmailQ = $this->apimodel->getUsersEmail($schoolId);
        
        foreach ($usersEmailQ->result() as $row){
        
    //        $sub = "Test";
    //        
    //        $txt = "Hi Test from RK";
            $email = $row->email;
            $passCode=$row->passCode;
            $phone=$row->phone;
    //        $subject="Test";
    //        $txt="Test";
            $templateQ=  $this->apimodel->getEmailTemplate($templateId);
            $subject=$templateQ->row()->subject;
            $content=$templateQ->row()->content;
            $msg=$templateQ->row()->msg;
            $patterns = array();
            $patterns[0] = '/\[email\]/';
            $patterns[1] = '/\[passcode\]/';
            $replacements = array();
            $replacements[0] = $email;
            $replacements[1] = $passCode;
    //        $replacements[2] = base_url()."uploads/";
            $text= preg_replace($patterns, $replacements, $content);    
    //        $signature= preg_replace($patterns, $replacements, $signature);
    //        $txt=str_replace("\n", "<br/>",str_replace("\r", "<br/>",$text));
    //        $txt=$txt.str_replace("\n", "<br/>",str_replace("\r", "<br/>",$signature));
            
            $dataMail['email'] = $email;
            
            $dataMail['message'] = $text;
            $dataMail['schoolId']=$schoolId;
            
            $dataMail['subject'] = $subject;
            
            $dataMail['sentDate'] = $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now());
            
            $dataMail['status'] = 2;
            
            $this->apimodel->sentMail($dataMail);
            if($msg)
            {

                $dataMsg['phone'] = $phone;
            
                $dataMsg['message'] = $msg;
                $dataMsg['schoolId']=$schoolId;
            
                $dataMsg['sentDate'] = $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now());
            
                $dataMsg['status'] = 2;
                $this->apimodel->sentMsg($dataMsg);
            }

//            if($this->apilib->sendmail("","",$to,"",$subject,$text)){
//
//                echo "Sent Mail";
//    //            $dataMail['templateId']=1;
//    //            $dataMail['customerId']=$customerId;
//    //            $dataMail['message']=$txt;
//    //            $dataMail['sentDate']=$this->admin->getCustomDate("%Y-%m-%d %H:%i:%s",  now());
//    //            $dataMail['status']=1;
//    //            $this->usermodel->sentMail($dataMail);
//            }
        
            $count++;
//            break;
        }
        
        echo $count;
        
//        echo $this->apilib->sendmail("","",$to,$cc,$sub,$txt);
        
    }
    
    /**
     * Saves email to be send
     *
     * @param       None
     * @return     Json array
     */
    function sendEmail()
    {
            
        $to = "info@poornapp.com";
        
        $cc = "";
        
        $count = 0;
        $max=$this->input->get_post("count");
        $schoolId=$this->input->get_post("schoolId");
        
        $usersEmailQ = $this->apimodel->getMail("",2,$schoolId);
        
        foreach ($usersEmailQ->result() as $row)
        {
            $count++;
            if($count>$max){
                
                break;
                
            }
            $email = $row->email;
            
            $subject=$row->subject;
            
            $text=$row->message;

            $data = array(
                "sentId" => $row->sentId,
                "sentDate" => $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
                "status" => 1
            );
            

            if($this->apilib->sendmail("","",$email,"",$subject,$text)){
                
                $this->apimodel->updateSentMail($data);

//                echo "Sent Mail<br>";
                
            }
            
        
           
            
        }
        
        echo $count;
    }


    /*
     * Check APIKey is valid
     */
    function checkAPIKey(){
        $APIKey=$this->input->get_post("token");
        $email=$this->input->get_post("email");
        $result['errorCode']=1;
        $result['msg']="Invalid APIKey";
        $result['user']='';
        if($APIKey!=""){
            $user=$this->apimodel->getusersessiondetails($APIKey,$email);
            if($user->num_rows()>0){
                if($user->row()->status==0){
                    $result['errorCode']=1;
                    $result['msg']="APIKey session out!!!";
                }else{
                    $result['errorCode']=0;
                    $result['user']=$user;
                }
            }
        }
        return $result;
    }
    
    /**
     * SignIn validation for school staffs
     *
     * @param       None
     * @return     Json array
     */
    
    function signIn(){
        $email=$this->input->get_post("email");
        $password=$this->input->get_post("password");
        $data['email']=$email;
        $data['password']=$password;
        $errorCode="1";
        $msg="Failed!!!";
        $q=$this->apimodel->signIn($data);
        if($q['result']>0){
            $errorCode="0";
            $msg="Sign In Successfully";
        }else{
            $msg=$q['msg'];
        }

        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "staffData"=>$q['staffData']
        );

        echo json_encode($value);
        
    }
    
    
    
    
    
    /**
     * Parent sign in validation
     *
     * @param       None
     * @return     Json array
     */
    
    function userSignin(){
        $email=  $this->input->get_post("email");
        $passCode=  $this->input->get_post("passCode");
        $deviceType=  $this->input->get_post("deviceType");
        $deviceId=  $this->input->get_post("deviceId");
        $status=  $this->input->get_post("status");
	//OTP generation
    	//$string = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    	//$string_shuffled = str_shuffle($string);
    	//$otp = substr($string_shuffled, 1, 7);
    	//$otpcode = base64_encode($otp);
	$otpcode = rand(100000,999999);
	$query=  $this->apimodel->otpUpdate($email,$otpcode);
	

        $errorCode="1";
        $msg="Failed!!!";
        $q=  $this->apimodel->userSignin($email);


        $name="";
        //$kids=array();
        $kidsURLDetails = array();
	
        if($q->num_rows()>0){
            $errorCode="0";
            $msg="Success";
            $status=$status==""?1:$status;
            $pc=$q->row()->passCode;
	    $otpNo=$q->row()->otp;
            if($pc!=$passCode){
                $errorCode="1";
                $msg="Wrong Passcode. Kindly check your email!!!";
            }elseif($otpNo!=""){
                $kidsURLDetailsQ = $this->apimodel->getKidsURLDetails($email);
                if($kidsURLDetailsQ->num_rows()>0){
                
                    $data=array(
                        "deviceType"=>$deviceType,
                        "deviceId"=>$deviceId,
                        "status"=>$status
                    );
                    $this->apimodel->updateUser($email,$data);
                    //$kids=  $this->_getKids($email);
                    $name=$q->row()->name;



                    foreach ($kidsURLDetailsQ->result() as $rowDetails)
                    {

                        $kidsURLDetail = array(

                            "schoolId" =>$rowDetails->schoolId,

                            "db" => $rowDetails->db,

                            "url" => $rowDetails->url

                        );

                        $kidsURLDetails[] = $kidsURLDetail;

                    }
                } else {
                    
                    $errorCode="1";
                    
                    $msg="Sorry!!! Please contact your school.";
                    
                }
            }
            
            
        }else{
            $msg="Sorry!!! Your Kid's school has not implemented Raksha Kids.";
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "name"=>$name,
            //"count"=>$kidsURLDetailsQ->num_rows(),
            "kidsURLDetails" =>$kidsURLDetails
        );
        
        echo json_encode($value);
    }
    
    /*
     * Get Kids
     */
    
    function _getKids($email){
        
        $result=  $this->apimodel->getKids($email);
        $kids=array();
        foreach ($result->result() as $row){
            
            $kid=array(
                "studentId"=>$row->studentId,
                "schoolName"=>$row->schoolName,
                "implementationType"=>$row->implementationType,
                "admissionNo"=>trim($row->admissionNo),
                "name"=>$row->name,
                "classId"=>$row->classId,
                "standard"=>$row->standardName,
                "section"=>$row->sectionName,
                "photo"=>$row->photo
            );
            
            $kids[]=$kid;
        }

        return $kids;
    }

    /**
     * Adds school data in database
     *
     * @param       None
     * @return     Json array
     */
    function saveRemoteSchools()
    {
       
        $data=array(
            'registeredSchoolId'=>"",
            'schoolName'=>$this->input->get_post("schoolName"), 
            'websiteUrl'=>$this->input->get_post("website"), 
            'contactName'=>$this->input->get_post("hmName"), 
            'contactPhone'=>$this->input->get_post("hmPhone"), 
            'contactEmail'=>$this->input->get_post("hmEmail"), 
            'drName'=>$this->input->get_post("hmEmail"), 
            'drPhone'=>$this->input->get_post("hmEmail"), 
            'vehicleStudents'=>$this->input->get_post("vehicleStudents"), 
            'noOfVehicles'=>$this->input->get_post("noOfVehicles"), 
            'noOfStudents'=>$this->input->get_post("strength"),
            'noOfStaffs'=>$this->input->get_post("noOfTeachers"),
            'implementationType'=>$this->input->get_post("implementationType"),
            'Address'=>$this->input->get_post("address"), 
            'schoolEmail'=>$this->input->get_post("schoolEmail"), 
            'createdBy'=>"Poorna", 
            'createdDate'=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",now()), 
            'updatedBy'=>"Poorna", 
            'updatedDate'=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",now()), 
            'country'=>"", 
            'status'=>0);
        
        $msg=$this->apimodel->registerSchool($data);
        echo json_encode($msg);
     }
    
    /**
     * Reset password for staffs
     *
     * @param       None
     * @return     Json array
     */
    function userResetPassword()
    {    
        $email =  $this->input->get_post("email");
        $userData=$this->apimodel->getStaffDetails($email);
        if($userData->num_rows()>0)
        {
            if($userData->row()->status==1)
            {
                $password=mt_rand(100000,999999);
                $name=ucfirst($userData->row()->firstName)." ".ucfirst($userData->row()->lastName);
                $subject="Reset your Password";
                $data=array("password"=>$password);
                $this->apimodel->updateStaff($email,$data);
                $text="<!DOCTYPE html><html><head>    <title>Raksha Kids</title></head><body>
                        <div style = \"max-width: 500px;
                            background: #eeeeee;
                            padding:10px;
                            margin: 0px auto;
                            overflow: hidden;
                            border-radius:5px;
                            font-family:sans-serif;\">
                        <img style=\"max-width: 100%;width:70px;height:70px;padding-left:40%;\" src = \"http://35.160.140.119/rk/images/icon.png\" align= \"middle\">
                        <p style=\"font-family:Times New Roman;margin:20px;font-size:14px;\">
                        Hi <b>$name</b>,<br><br>You recently requested to reset your password for your Raksha account. Following is your password <b>'Password :$password'</b>. Kindly make use this to login to your Raksha application.<br><br>For security, If you did not request a password reset, please ignore this email or reply us if you have questions.<br><br><br>Thanks,<br>Poorna App Systems pvt ltd</p>
                    </body>
                    </html>";
                if($this->apilib->sendmail("","",$email,"",$subject,$text)){
                
                    $errorCode="0";
                    $msg="Message sent Successfully";
                }
                else
                {
                    $errorCode="2";
                    $msg="Error occured!! Please try again";
                }
            }   
            else
            {
                $errorCode="1";
                $msg="Your currently deactivated!!!";
            }         
        }
        else
        {
            $errorCode="1";
            $msg="Email Not found!!!";
        }
        
       
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg
        );

        echo json_encode($value);     
    }
    
}
