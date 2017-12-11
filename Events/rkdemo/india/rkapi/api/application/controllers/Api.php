<?php
class api extends CI_Controller{
    /*
     * Constructor
     */
    function __construct(){
        parent::__construct();
        $this->load->model("apimodel","",true);
        $this->date=$this->apilib->getCustomDate("%Y-%m-%d",now());
        $query=$this->apimodel->getacademic($this->date);
        if($query->num_rows()>0)
        {
            foreach($query->result() as $val)
            {
                $this->startDate=$val->startDate;
                $this->academicId=$val->academicId;
            }
        }
    }
    /*
     * Index
     */
     /**
     * Welcome json  
     *
     * @param       None
     * @return     View page
     */
    function index()
    {
        $value=array(
            'errorCode'=>0,
            'msg'=>'Welcome to Rakasha Kids API...'
        );
        echo json_encode($value);
    }
    
    function createUserSchools()
    {
        $schoolId = $this->input->get_post("schoolId");
        
        $url = $this->input->get_post("url");
        
        $result = $this->apimodel->createUserSchools($schoolId,$url);
        
        echo $result;
        
    }
    /*
     * Check APIKey is valid
     */
    function checkAPIKey($APIKey)
    {
        $result['errorCode']=1;
        $result['msg']="Invalid APIKey";
        $result['user']='';
        if($APIKey!="")
        {
            $user=$this->apimodel->getusersessiondetails($APIKey);
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
    
   
    function userResetPassword()
    {    
        $email =  $this->input->get_post("email");
        
        $errorCode="1";
        
        $msg="Failed!!!";
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "students"=>$students
        );

        echo json_encode($value);     
    }
    
     /**
     * Gives list of students attendance details in teacher app
     *
     * @param      staffId
     * @return     Json array
     */
    function getStaffStudentsAttendance()
    {    
        $staffId=  $this->input->get_post("staffId");
        
        $dt = $this->input->get_post("dt");
        
        if($dt!="")
        {
            $dt = $this->apilib->getCustomDate("%Y-%m-%d",  strtotime($dt));    
        } 
        else {
        
            $dt = $this->apilib->getCustomDate("%Y-%m-%d",now());
            
        }
        $studentsQ=$this->apimodel->getStaffStudents($staffId);
        $errorCode="1";
        $msg="Failed!!!";
        $students=array();
        
        foreach ($studentsQ->result() as $rowStudent){
            
            $studentId = $rowStudent->studentId;
            
            $attendance = array(
                "attendanceId" => "0",
                "attendanceDate" => "",
                "inTime"=>"",
                "outTime"=>"",
                "updatedTime"=>"",
                "attendance"=>"",
                "notes"=>""
                
            );
            
            $attendanceQ = $this->apimodel->getAttendance($studentId,$dt);
            
            if($attendanceQ->num_rows()>0){
                
                $attendance=array(
                    "attendanceId" => $attendanceQ->row()->attendanceId,
                    "attendanceDate" => $this->apilib->getCustomDate("%d-%M",  strtotime($attendanceQ->row()->logDate)),
                    "attendance"=>"",
                    "inTime"=>"",
                    "outTime"=>"",
                    "updatedTime"=>"",
                    "notes"=>""
                );


                foreach ($attendanceQ->result() as $row){

                    if($row->logType == "ENTRY"){
                        
                        $attendance['attendance'] = $row->attendance;
                        
                        $attendance['notes'] = $row->notes;

                        $attendance['inTime'] = $this->apilib->getCustomDate("%h:%i %A",  strtotime($row->logDate));
                        $attendance['updatedTime']=$this->apilib->getCustomDate("%h:%i %A",  strtotime($row->updatedDate));

                    } else {

                        $attendance['outTime'] = $this->apilib->getCustomDate("%h:%i %A",  strtotime($row->logDate));

                    }


                }
            }
            

            $students[] = array(
                "studentId"=>$rowStudent->studentId,
                "implementationType" => "",
                "admissionNo"=>$rowStudent->admissionNo,
                "studentName"=>$rowStudent->name,
                "photo"=>$rowStudent->photo,
                "classId"=>$rowStudent->classId,
                "standard"=>$rowStudent->standardName,
                "section"=>$rowStudent->sectionName,
                "attendance" => $attendance
//                "schoolName"=>$rowStudent->schoolName,
//                "fatherName"=>$rowStudent->fatherName,
//                "motherName"=>$rowStudent->motherName,
//                "fatherPhone"=>$rowStudent->fatherPhone,
//                "motherPhone"=>$rowStudent->motherPhone,
//                "schoolStatus"=>$rowStudent->schoolStatus
            );
            
            $errorCode="0";
            $msg="Success!!!";
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "students"=>$students
        );

        echo json_encode($value);
        
        
        
    }


      function getStaffStudentLeaves(){
        
        $staffId=  $this->input->get_post("staffId");
        $studentsQ=$this->apimodel->getStaffStudentLeaves($staffId);
        $errorCode="1";
        $msg="Failed!!!";
        $students=array();
        
        foreach ($studentsQ->result() as $rowStudent){

            $students[] = array(
                "studentId"=>$rowStudent->studentId,
                "implementationType" => "",
                "heading"=>$rowStudent->heading,
                "reason"=>$rowStudent->reason,
                "details"=>$rowStudent->detail,
		"fromDate"=>$rowStudent->fromDate,
                "toDate"=>$rowStudent->toDate,
                "classId"=>$rowStudent->classId,
                "standard"=>$rowStudent->standardName,
                "section"=>$rowStudent->sectionName,
                "schoolName"=>$rowStudent->schoolName,
                "schoolStatus"=>$rowStudent->schoolStatus
            );
            
            $errorCode="0";
            $msg="Success!!!";
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "students"=>$students
        );

        echo json_encode($value);
        
        
        
    }
























    
    /**
     * Gives list of students in particular class
     *
     * @param      StaffId
     * @return     Json array
     */
    function getStaffStudents(){
        
        $staffId=  $this->input->get_post("staffId");
        $studentsQ=$this->apimodel->getStaffStudents($staffId);
        $errorCode="1";
        $msg="Failed!!!";
        $students=array();
        
        foreach ($studentsQ->result() as $rowStudent){

            $students[] = array(
                "studentId"=>$rowStudent->studentId,
                "implementationType" => "",
                "admissionNo"=>$rowStudent->admissionNo,
                "name"=>$rowStudent->name,
                "photo"=>$rowStudent->photo,
                "classId"=>$rowStudent->classId,
                "standard"=>$rowStudent->standardName,
                "section"=>$rowStudent->sectionName,
                "schoolName"=>$rowStudent->schoolName,
                "fatherName"=>$rowStudent->fatherName,
                "motherName"=>$rowStudent->motherName,
                "fatherPhone"=>$rowStudent->fatherPhone,
                "motherPhone"=>$rowStudent->motherPhone,
                "schoolStatus"=>$rowStudent->schoolStatus
            );
            
            $errorCode="0";
            $msg="Success!!!";
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "students"=>$students
        );

        echo json_encode($value);
        
        
        
    }
    
    /**
     * Gives list of students 
     *
     * @param      StudentId
     * @return     Json array
     */
    function getStudentDetails(){
        
        $studentId = $this->input->get_post("studentId");
        
        $errorCode="1";
        
        $msg="Failed!!!";
        
        $from = $this->startDate;
        
        $to = $this->apilib->getCustomDate("%Y-%m-%d",now());
        
        $studentQ = $this->apimodel->getStudent($studentId);
        
        $student = array();
        
        $attendancesQ = $this->apimodel->getStudentAttendance($studentId,$from,$to,1);
        
        $attendance = array(
            "attendanceId" => "",
            "studentName" => "",
            "inTime"=>"",
            "outTime"=>""
        );
        
        $totalAttendanceQ = $this->apimodel->getTotalAttendance($studentId,$from,$to);
        
        foreach ($studentQ->result() as $row){
            
            $student = array (
                
                "implementationType"=>"BOTH",
                "studentId" => $row->studentId,
                "name" => $row->name,
                "classId"=>$row->classId,
                "class" => $row->standardName ." ".$row->sectionName,
                "photo" => $row->photo,
                "totalWorkingDays" => 200,
                "totalAttendance" => $totalAttendanceQ->num_rows(),
                "attendances" => "",
                "busAttendance"=>"",
                "notifications"=>array(),
                "messages" => array()
                
            );
            
            $errorCode="0";
            
            $msg="Success!!!";
            
        }   
        
        $travelDate = $this->apilib->getCustomDate("%Y-%m-%d",now());
        
        $pickupResult =  $this->apimodel->getKidTravel($studentId,$travelDate,"PICKUP");
        
        $pickupInTime ="";
        
        $pickupInLocation = "";
        
        $pickupOutTime ="";
        
        $pickupOutLocation = "";
        
        foreach ($pickupResult->result() as $row){
                
            $pickupInTime = $row->inTime;
            
            if($row->outTime=="00:00:00" || $row->outTime == NULL){
                $pickupOutTime ="";
            }else{
                $pickupOutTime = $this->apilib->getCustomDate("%H:%i",strtotime($row->outTime));
            }
            
            $pickupInLocation = $row->inLocation;
            
            $pickupOutLocation = $row->outLocation;
            
        }
        
        $dropResult =  $this->apimodel->getKidTravel($studentId,$travelDate,"DROP");
        
        $dropInTime ="";
        
        $dropInLocation = "";
        
        $dropOutTime ="";
        
        $dropOutLocation = "";
        
        foreach ($dropResult->result() as $row){
                
            $dropInTime = $row->inTime;
            
            if($row->outTime=="00:00:00" || $row->outTime == NULL){
                $dropOutTime ="";
            }else{
                $dropOutTime = $this->apilib->getCustomDate("%H:%i",strtotime($row->outTime));
            }
            
            $dropInLocation = $row->inLocation;
            
            $dropOutLocation = $row->outLocation;
        }
        
        $busAttendance = array(
            
            "pickupInTime" =>$pickupInTime,
            
            "pickupInLocation" => $pickupInLocation,
            
            "pickupOutTime" =>$pickupOutTime,
            
            "pickupOutLocation" => $pickupOutLocation,
            
            "dropInTime" => $dropInTime,
            
            "dropInLocation" => $dropInLocation,
            
            "dropOutTime" => $dropOutTime,
            
            "dropOutLocation" => $dropOutLocation
        );
        
        
        $notificationsQ = $this->apimodel->getNotifications($studentId,$from,$to,2);
        
        $notifications = array();
        
        foreach ($notificationsQ->result() as $rowNotification) {
            $notification = array(
              
                "heading"=>$rowNotification->heading,
                "content"=>$rowNotification->content,
                "notificationDate"=>  $this->apilib->getCustomDate("%d %M %Y",  strtotime($rowNotification->sentDate)),
                "notificationTime"=>$this->apilib->getCustomDate("%h:%i %A",strtotime($rowNotification->sentDate))
                
            );
            
            $notifications[] = $notification;
        }
        
        $messagesQ = $this->apimodel->getMessages($studentId,$from,$to,2);
        
        $messages = array();
        
        foreach ($messagesQ->result() as $rowMessage) {
            $message = array(
              
                "heading"=>$rowMessage->heading,
                "content"=>$rowMessage->content,
                "messageDate"=>  $this->apilib->getCustomDate("%d %M %Y",  strtotime($rowMessage->sentDate)),
                "messageTime"=>$this->apilib->getCustomDate("%h:%i %A",strtotime($rowMessage->sentDate))
                
            );
            
            $messages[] = $message;
        }
        
        foreach ($attendancesQ->result() as $rowAttendance){
            
            $b=true;
            
            $dt = $this->apilib->getCustomDate("%d %M %Y",strtotime($rowAttendance->logDate));
            
            $attendanceQ = $this->apimodel->getAttendance($rowAttendance->studentId,
                    $this->apilib->getCustomDate("%Y-%m-%d",strtotime($rowAttendance->logDate)));
            
            $attendance=array(
                "attendanceId" => $rowAttendance->attendanceId,
                "studentName" => $rowAttendance->name,
                "inTime"=>"",
                "outTime"=>""
            );
            
            
            foreach ($attendanceQ->result() as $row){
                
                if($row->logType == "ENTRY"){
                    
                    $attendance['inTime'] = $this->apilib->getCustomDate("%d %M %Y %h:%i %A",  strtotime($row->logDate));
                    
                } else {
                    
                    $attendance['outTime'] = $this->apilib->getCustomDate("%d %M %Y %h:%i %A",  strtotime($row->logDate));
                    
                }
            
            
            }
            
            
        }
        
        $student['attendances'] =$attendance;
        
        $student['busAttendance'] = $busAttendance;
        
        $student['notifications'] = $notifications;
        
        $student['messages'] = $messages;
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "student"=>$student,
        );

        echo json_encode($value);
        
    }
    
    /**
     * Gives student attendance details for parent app
     *
     * @param      StudentId
     * @return     Json array
     */
    function getStudentAttendance(){
        
        $studentId = $this->input->get_post("studentId");
        $from = $this->startDate;
        $to = $this->apilib->getCustomDate("%Y-%m-%d",  now());
        
        $errorCode="1";
        $msg="Failed!!!";
        
        $attendancesQ = $this->apimodel->getStudentAttendance($studentId,$from,$to,"");
        $attendances = array();
        foreach ($attendancesQ->result() as $rowAttendance){
            $b=true;
            $dt = $this->apilib->getCustomDate("%d-%M-%Y",strtotime($rowAttendance->logDate));
            $heading = array(
                "headingId" => $rowAttendance->attendanceId,
                "logDate" => $dt,
                "count" => 1,
                "attendance" => array()
            );
            $attendanceQ = $this->apimodel->getAttendance($rowAttendance->studentId,
                    $this->apilib->getCustomDate("%Y-%m-%d",strtotime($rowAttendance->logDate)));
            $attendance=array(
                "attendanceId" => $rowAttendance->attendanceId,
                "studentName" => $rowAttendance->name,
                "attendanceDate" => $this->apilib->getCustomDate("%d-%M-%Y",  strtotime($rowAttendance->logDate)),
                "attendance"=>"",
                "inTime"=>"",
                "outTime"=>"",
                "notes"=>"",
                "updatedTime"=>$this->apilib->getCustomDate("%h:%i %A",  strtotime($rowAttendance->updatedDate))
            );
            
            
            foreach ($attendanceQ->result() as $row){
                
                if($row->logType == "ENTRY"){
                    
                    $attendance['attendance'] = $row->attendance;
                        
                    $attendance['notes'] = $row->notes;
                    
                    $attendance['inTime'] = $this->apilib->getCustomDate("%h:%i %A",strtotime($row->logDate));
                    
                } else {
                    
                    
                    
                    $attendance['outTime'] = $this->apilib->getCustomDate("%h:%i %A",strtotime($row->logDate));
                    
                }
            
            
            }
            //$products[]=$product;
            $heading['attendance'][] = $attendance;
                
            $attendances[] = $heading;
            $errorCode="0";
            $msg="Success!!!";
            
        }
        
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "attendances"=>$attendances,
            "c"=>$to
        );

        echo json_encode($value);
    }
    
     /*
     * Update Attendance
     */
    
    function updateAttendance(){
        
        $studentId = $this->input->get_post("studentId");
        
        $attendanceId = $this->input->get_post("attendanceId");
        
        $staffId=  $this->input->get_post("staffId");
        
        $logType = $this->input->get_post("logType");
        
        $attendance = $this->input->get_post("attendance");
        
        $notes=  $this->input->get_post("notes");
        
        $updatedDate = $this->input->get_post("updatedDate");
        
        $status = $this->input->get_post("status");
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $heading = "";
        
        $updatedDate = $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",$updatedDate);
        
        $notification = "";
        
        $stids = explode(",",$studentId);
        
        $aids = explode(",",$attendanceId);
        
        $sids = explode(",",$status);
        
        $i = 0;
        
        foreach ($stids as $v){
            
            $attendanceId = $aids[$i];
            
            $status = $sids[$i];
            
            $studentId = $v;
            
            switch ($status) {
                
                case "1":
                    
                    $logType = "ENTRY";
                    
                    $attendance = "PRESENT";
                    
                    $notes = "Manual Entry";

                    break;
                
                case "2":
                    
                    $logType = "EXIT";
                    
                    $attendance = "PRESENT";
                    
                    $notes = "Manual Exit";

                    break;
                
                case "3":
                    
                    $attendance = "ABSENT";
                    
                    $notes = "Sorry to inform you that your ward is not present in the class so marked as absent";

                    break;

                default:
                    break;
            }
            if($status == "1" or $status=="2")
            {
                $attendanceId="0";
            }
            $data = array(
                "attendanceId"=>$attendanceId,
                "studentId"=>$v,
                "staffId"=>$staffId,
                "logType" => $logType,
                "logDate" => $updatedDate,
                "attendance" => $attendance,
                "notes"=>$notes,
                "updatedDate"=>$updatedDate,
                "status"=>1
            );
            

            if($attendanceId=="0"){

                $data['logType'] = $logType;

                $data['logDate'] = $updatedDate;

                $data['attendance'] = $attendance;

                $data['gateName'] = "MANUAL";

            } else if($status == "3") {
                
                unset($data['logType']);
                unset($data['logDate']);
                
            }

            
            $i++;
            
            $result = $this->apimodel->saveAttendance($data);
	
             //echo $result;die;

            if($result>0){

                $errorCode = "0";

                $msg = "Success";

                $message="";

                $travelType =  "";

    //            $deviceQ= $this->apimodel->getUsers($studentId);
                $deviceIds=array();

                $userDetails = $this->apimodel->getUsers($studentId);
                $url = str_replace("/rkapi/", "", base_url());
                $imType="GATE";
                $type="alert";
    //            foreach ($deviceQ->result() as $rowUser){
                foreach ($userDetails as  $rowUser) {
                    $studentName = $rowUser['studentName'];
                    $deviceType= $rowUser['deviceType'];
                    $deviceId = $rowUser['deviceId'];
                    if($deviceId!=""){
                        $deviceIds[]=$deviceId;

                        $time = $this->apilib->getCustomDate("%h:%i %A",  strtotime($updatedDate));


                        $heading = "Attendance";

                        $message = $studentName ." is ".$attendance;
                        
                        if($status === 3 ){
                            
                            $message = $studentName ."'s attendance revoked to ".$attendance;
                            
                        }

                        if($deviceType == "iOS" && $deviceId!="nil"){

        //                    $travelType="PICKUP";

                            

                            $notification=$this->appleapn($deviceId,$message,$url,$studentId,$imType,$type);

                        } else {

                            

                            if(count($deviceIds)>0 && $message!=""){
                                $payload = array(
                                    "sid"=>$studentId,
                                    "url"=>$url,
                                    "imType"=>$imType,
                                    "type"=>$type,
                                    "message" => $message
                                    );
                                $notification = ($this->send_notification($deviceIds, $payload));

                                unset($deviceIds); 
                            }

                        }
                    }
                }

    //            $dataNoti = array(
    //                "studentId" => $studentId,
    //                "typeId" =>1,
    //                "heading" => $heading,
    //                "content" => $message,
    //                "sentDate"=>$updatedDate,
    //                "status"=>1
    //            );

                //$this->apimodel->saveNotification($dataNoti);
            }
        
        }
        
        $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg,
            "notification"=>$notification
        );
        
        echo json_encode($value);
        
    }
    
     /*
     * Save Attendance
     */
    
    function saveAttendance(){
        
//        date_default_timezone_set('Asia/Calcutta');
        
        $studentId = $this->input->get_post("studentId");
        
        $gateName=  $this->input->get_post("gateName");
        
        $logType=  $this->input->get_post("logType");
        
        $timestamp = $this->input->get_post("logDate");

        $swipeType = $this->input->get_post("swipeType");
        
        $dt = gmdate("%Y-%m-%d %H:%i:%s", $timestamp);
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $notification = "";
        
        if($studentId!=""){
        
            $logDate = $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  strtotime($dt));

            $data = array(
                "attendanceId" => "0",
                "studentId"=>$studentId,
                "gateName"=>$gateName,
                "logType"=>$logType,
                "logDate"=>$logDate,
                "attendance"=>"",
                "status"=>1
            );

            if($logType == "ENTRY"){

                $data['attendance'] = "PRESENT";

            }


            if(strtolower($swipeType)=="s")
            {
                $result = $this->apimodel->saveAttendance($data);
            }
	    
            else if(strtolower($swipeType)=="o")
            {
                $result=0;
                $data['staffId']=$data['studentId'];
                unset($data['studentId']);
                unset($data['attendanceId']);
                $result1=$this->apimodel->saveStaffAttendance($data);
                if($result1>0)
                {
                    $errorCode = "0";

                    $msg = "Success";

                    $message="";
                }

            }
            

            if($result>0){

                $errorCode = "0";

                $msg = "Success";

                $message="";

                $travelType =  "";

                $userDetails = $this->apimodel->getUsers($studentId);
                $url = str_replace("/rkapi/", "", base_url());
                $imType="GATE";
                $type="alert";
    //            foreach ($deviceQ->result() as $rowUser){
                foreach ($userDetails as  $rowUser) {
                    $studentName = $rowUser['studentName'];
                    $deviceType= $rowUser['deviceType'];
                    $deviceId = $rowUser['deviceId'];
                    if($deviceId!=""){
                        $deviceIds[]=$deviceId;


                        $heading = "";

                        $time = $this->apilib->getCustomDate("%h:%i %A",  strtotime($logDate));

                        if($logType=="ENTRY"){

                            $heading = "Attendance";

                            $message = $studentName ." has reached school at ".$time;

                        } else {

                            $heading = "Attendance";

                            $message = $studentName ." has left the school at ".$time;

                        }

                        if($deviceType == "iOS" && $deviceId!="nil"){

        //                    $travelType="PICKUP";

                            $notification=$this->appleapn($deviceId,$message,$url,$studentId,$imType,$type);

                        } else {
                            
                            

                            if(count($deviceIds)>0 && $message!=""){
                                $payload = array(
                                    "sid"=>$studentId,
                                    "url"=>$url,
                                    "imType"=>$imType,
                                    "type"=>$type,
                                    "message" => $message
                                    );
                                $notification = ($this->send_notification($deviceIds, $payload));

                                unset($deviceIds); 
                            }
                        }

                    }
                }

    //            $dataNoti = array(
    //                "studentId" => $studentId,
    //                "typeId" =>1,
    //                "heading" => $heading,
    //                "content" => $message,
    //                "sentDate"=>$logDate,
    //                "status"=>1
    //            );

                //$this->apimodel->saveNotification($dataNoti);
            }
        }
        
        $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg,
            "notification"=>$notification
        );
        
        echo json_encode($value);
        
    }
    
    /**
     * Gives stuents travel detail for full academic
     *
     * @param       None
     * @return     Json array
     */
    
    function getStudentTravel(){
        
        $studentId=  $this->input->get_post("studentId");
        $travelDate=  $this->input->get_post("travelDate");
        $travelType=  $this->input->get_post("travelType");
        $errorCode="1";
        $msg="Failed!!!";
        $travelDate=  $this->apilib->getCustomDate("%Y-%m-%d",  strtotime($travelDate));
        $result=  $this->apimodel->getKidTravel($studentId,$travelDate,$travelType);
        $students=array();
        foreach ($result->result() as $row){
            if($travelType=="PICKUP"){
                $dt = $row->travelDate ." ". $row->inTime;
            }else{
                $dt = $row->travelDate ." ". $row->inTime;
            }
            
            if($row->outTime=="00:00:00" || $row->outTime == NULL){
                $outTime ="";
            }else{
                $outTime = $this->apilib->getCustomDate("%H:%i",strtotime($row->outTime));
            }
            
            $locationsQ=  $this->apimodel->getVehicleLocations($row->staffId,$dt,$travelType);
            $locations=array();
            foreach ($locationsQ->result() as $rowLocation){
                $locationTime = $this->apilib->getCustomDate("%H:%i",  strtotime($rowLocation->travelDate));
                if($outTime!="" && strtotime($locationTime)<=strtotime($outTime)){
                    $location=  array(
                        "location"=>$rowLocation->location,
                        "travelDate"=>$locationTime,
                        "latitude"=>$rowLocation->lat,
                        "longitude"=>$rowLocation->lng
                    );
                    $locations[]=$location;
                } else {
                    $location=  array(
                        "location"=>$rowLocation->location,
                        "travelDate"=>$locationTime,
                        "latitude"=>$rowLocation->lat,
                        "longitude"=>$rowLocation->lng
                    );
                    $locations[]=$location;
                }
            }
            
            
            $student=array(
                "studentId"=>$row->studentId,
                "schoolName"=>$row->schoolName,
                "admissionNo"=>trim($row->admissionNo),
                "name"=>$row->name,
                "photo"=>$row->photo,
                "staffId"=>$row->staffId,
                "staffName"=>$row->firstName ." ".$row->lastName,
                "phone"=>$row->phone,
                "travelDate"=>$row->travelDate,
                "travelType"=>$row->travelType,
                "inTime"=>$this->apilib->getCustomDate("%H:%i",strtotime($row->inTime)),
                "outTime"=>$outTime,
                "inLocation"=>$row->inLocation,
                "outLocation"=>$row->outLocation,
                "locations"=>$locations
            );
            
            $students[]=$student;
            $errorCode="0";
            $msg="Success!!!";
        }
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "students"=>$students
        );

        echo json_encode($value);
    }
    
    /**
     * Gives stuents Locations of traveled for full academic
     *
     * @param       None
     * @return     Json array
     */
    function getTravelHistory(){
        
        $studentId = $this->input->get_post("studentId");
        
        $travelType = $this->input->get_post("travelType");
        
        $from = $this->startDate;
        
        $to = $this->apilib->getCustomDate("%Y-%m-%d",  now());
        
        $errorCode="1";
        
        $msg="Failed!!!";
        
        $travelDate = "";
        
        $pickupInTime ="";
        
        $pickupInLocation = "";
        
        $pickupOutTime ="";
        
        $pickupOutLocation = "";
        
        $dropInTime ="";
        
        $dropInLocation = "";
        
        $dropOutTime ="";
        
        $dropOutLocation = "";
        
        $attendanceQ = $this->apimodel->getTravelHistory($studentId,$from,$to,$travelType);
        
        $busAttendances = array();
        
        foreach ($attendanceQ->result() as $row){
            
            $travelDate = $this->apilib->getCustomDate("%d-%M-%Y",strtotime($row->travelDate));
            
            if($travelType == "PICKUP"){
            
                $pickupInTime = $this->apilib->getCustomDate("%H:%i",strtotime($row->inTime));

                if($row->outTime=="00:00:00" || $row->outTime == NULL){
                    $pickupOutTime ="";
                }else{
                    $pickupOutTime = $this->apilib->getCustomDate("%H:%i",strtotime($row->outTime));
                }

                $pickupInLocation = $row->inLocation;

                $pickupOutLocation = $row->outLocation;
                
            }
                
            if($travelType == "DROP"){
                
                $dropInTime = $this->apilib->getCustomDate("%H:%i",strtotime($row->inTime));

                if($row->outTime=="00:00:00" || $row->outTime == NULL){
                    $dropOutTime ="";
                }else{
                    $dropOutTime = $this->apilib->getCustomDate("%H:%i",strtotime($row->outTime));
                }

                $dropInLocation = $row->inLocation;

                $dropOutLocation = $row->outLocation;
            
            }
            
            $busAttendances[] = array(
            
                "travelDate" => $travelDate,

                "pickupInTime" =>$pickupInTime,

                "pickupInLocation" => $pickupInLocation,

                "pickupOutTime" =>$pickupOutTime,

                "pickupOutLocation" => $pickupOutLocation,

                "dropInTime" => $dropInTime,

                "dropInLocation" => $dropInLocation,

                "dropOutTime" => $dropOutTime,

                "dropOutLocation" => $dropOutLocation
            );
            
            $errorCode = "0";
            
            $msg = "Success";
            
        }
        
        
        
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "busAttendances"=>$busAttendances,
        );

        echo json_encode($value);
    }
    
    
    function testDate(){
        
        $timestamp = $this->input->get_post("logDate");
        
        $dt = gmdate("%Y-%m-%d %H:%i:%s", $timestamp);
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $logDate = $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  strtotime($dt));
        
        echo $logDate;
        
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
    
    /*
     * Get Kids
     */
    
    function getKids(){
        $email=  $this->input->get_post("email");
        $errorCode="1";
        $msg="Failed!!!";
        $kids=  $this->_getKids($email);
        if(count($kids)>0){
            $errorCode="0";
            $msg="Success";
        }
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "kids"=>$kids
        );

        echo json_encode($value);
    }
    
    /*
     * Get Notifications
     */
    
    function getNotifications(){
        
        $studentId=  $this->input->get_post("studentId");
        $from=  $this->input->get_post("from");
        $to=  $this->input->get_post("to");
        $errorCode="1";
        $msg="Failed!!!";
        $notificationsQ = $this->apimodel->getNotifications($studentId,$from,$to,"");
        
        $notifications = array();
        
        foreach ($notificationsQ->result() as $rowNotification) {
            
            $errorCode="0";
            
            $msg="Success";
            
            $notification = array(
              
                "heading"=>$rowNotification->heading,
                "content"=>$rowNotification->content,
                "notificationDate"=>  $this->apilib->getCustomDate("%d %M %Y",  strtotime($rowNotification->sentDate)),
                "notificationTime"=>$this->apilib->getCustomDate("%h:%i %A",strtotime($rowNotification->sentDate))
                
            );
            
            $notifications[] = $notification;
        }
        
        $value = array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "notifications"=>$notifications
        );
        
        echo json_encode($value);
    }
    
    /*
     * Get Messages
     */
    
    function getMessages(){
        
        $studentId=  $this->input->get_post("studentId");
        $from=  $this->input->get_post("from");
        $to=  $this->input->get_post("to");
        $errorCode="1";
        $msg="Failed!!!";
        $messagesQ = $this->apimodel->getMessages($studentId,$from,$to,"");
        
        $messages = array();
        
        foreach ($messagesQ->result() as $rowMessage) {
            
            $errorCode="0";
            
            $msg="Success";
            
            $message = array(
              
                "heading"=>$rowMessage->heading,
                "content"=>$rowMessage->content,
                "messageDate"=>  $this->apilib->getCustomDate("%d %M %Y",  strtotime($rowMessage->sentDate)),
                "messageTime"=>$this->apilib->getCustomDate("%h:%i %A",strtotime($rowMessage->sentDate))
                
            );
            
            $messages[] = $message;
        }
        
        $value = array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "messages"=>$messages
        );
        
        echo json_encode($value);
    }
    
    /*
     * Save Message
     */
    
    function saveMessage(){
        
        $studentId =  $this->input->get_post("studentId");
        $staffId =  $this->input->get_post("staffId");
        $subject =  $this->input->get_post("subject");
        $message =  $this->input->get_post("message");
        
        $q = 0;
        
        if($studentId == ""){
            
            $studentsQ=$this->apimodel->getStaffStudents($staffId);
            $errorCode="1";
            $msg="Failed!!!";
            $students=array();

            foreach ($studentsQ->result() as $rowStudent){

                $studentId = $rowStudent->studentId;
                
                $data=array(
                    "messageId"=>"",
                    "staffId"=>$staffId,
                    "studentId"=>$studentId,
                    "heading"=>$subject,
                    "content" => $message,
                    "typeId" => 1,
                    "sentDate"=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
                    "status"=>1
                );
                
                $q=$this->apimodel->saveMessage($data);
                
                $this->notification($studentId,"Message");
                
            }
            
        } else {
        
            $data=array(
                "messageId"=>"",
                "staffId"=>$staffId,
                "studentId"=>$studentId,
                "heading"=>$subject,
                "content" => $message,
                "typeId" => 1,
                "sentDate"=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
                "status"=>1
            );
            $q=$this->apimodel->saveMessage($data);
            
            $this->notification($studentId,"Message");
        }
        
        $errorCode = "1";
        
        $msg = "Failed";

        if($q>0){
            $errorCode="0";
            $msg="Message Sent Successfully";
        }

        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg
        );

        echo json_encode($value);
        
    }
    
    
    
    /*
     * Get Daily Timetable
     */
    
    function getDailyTimetable(){
        
        // $schoolId = $this->input->get_post("schoolId");
        
        // $studentId = $this->input->get_post("studentId");
        
        $classId = $this->input->get_post("classId");
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $timeTable = "";
       
            
            
            
            $timeTableQ = $this->apimodel->getDailyTimeTable($classId,1);
            
            if($timeTableQ->num_rows()>0){
                
                $timeTable = $timeTableQ->row()->timeTable;
                $errorCode="0";
                $msg="Success";
            
            
            
            
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "timeTable" => $timeTable
        );

        echo json_encode($value);
        
    }
    
    /**
     * Gets comaplete diary events
     *
     * @param       None
     * @return     Json array
     */
    function getDiary(){
        
        // $schoolId = $this->input->get_post("schoolId");
        
        $studentId = $this->input->get_post("studentId");
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $events = array();
        
        // if($schoolId!=""){
            
            $errorCode="0";
            $msg="Success";
            
            $eventsQ = $this->apimodel->getEvents($this->academicId);
           
            foreach ($eventsQ->result() as $rowEvent){
                $banner=array();
                $event = array(
                    "eventId"=>$rowEvent->eventId,
                
                    "date" => $this->apilib->getCustomDate("%m/%d/%Y",strtotime($rowEvent->eventDate)),
                    
                    "eventName" => $rowEvent->eventName,
                    "eventImages"=>"", 
                    "eventVideos"=>"",
                    "details" => $rowEvent->eventName

                );
                $eventVideos=array();
                $eventImages=array();
                $query=$this->apimodel->getEventBanners($rowEvent->eventId);
                if($query->num_rows()>0)
                {
                    foreach($query->result() as $rowBanner)
                    {
                        if($rowBanner->bannerImage)
                        {
                            $ext=explode(".",$rowBanner->bannerImage);
                            if(count($ext)==2)
                            {
                                if(strtolower($ext[1])=="mp4")
                                {
                                     $eventVideos[]=array(
                                    'eventBannerId'=>$rowBanner->eventBannerId,
                                    'bannerVideo'=>$rowBanner->bannerImage,
                                    'size'=>$this->sizeCalculate("../images/events/",$rowBanner->bannerImage)
                                    );
                                }
                                else
                                {
                                    $eventImages[]=array(
                                    'eventBannerId'=>$rowBanner->eventBannerId,
                                    'bannerImage'=>$rowBanner->bannerImage
                                    );
                                }
                            }
                        }
                       
                    }
                }
                $event['eventImages']=$eventImages;
                $event['eventVideos']=$eventVideos;
                
                $events[] = $event;
                
            }
            
//            $event = array(
//                
//                "date" => "09/01/2016",
//                
//                "details" => "Annual Sports Junior School"
//                
//            );
//            
//            $events[] = $event;
//            
//            $event = array(
//                
//                "date" => "09/01/2016",
//                
//                "details" => "Annual Sports Junior School"
//                
//            );
//            
//            $events[] = $event;
//            
//            $event = array(
//                
//                "date" => "09/15/2016",
//                
//                "details" => "First Term Exam Begins"
//                
//            );
//            
//            $events[] = $event;
//            
//            $event = array(
//                
//                "date" => "09/30/2016",
//                
//                "details" => "School Closes for Dasara"
//                
//            );
            
            
            
        // }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "events" => $events
        );

        echo json_encode($value);
        
    }
    
    /**
     * send push notifications 
     *
     * @param       studentId , type
     * @return     Json array
     */
    function notification($studentId,$type){
         $deviceIds=array();
            
        $userDetails = $this->apimodel->getUsers($studentId);

//            foreach ($deviceQ->result() as $rowUser){
        foreach ($userDetails as  $rowUser) {
            $studentName = $rowUser['studentName'];
            $deviceType= $rowUser['deviceType'];
            $deviceId = $rowUser['deviceId'];
            if($deviceId!=""){
                $deviceIds[]=$deviceId;
                $url = str_replace("/rkapi/", "", base_url());
                $imType = "GATE";

                
                switch ($type) {
                    
                    case "Message":

                        $message = " You got a message about ".$studentName;
                        
                        $imType = "MESSAGE";

                        break;
                    
                    case "Notification":
                        
                        $message = " You got a notification from ".$studentName."'s school";
                        
                        $imType = "NOTIFICATION";
                        
                        break;

                    default:
                        break;
                }

                if($deviceType == "iOS" && $deviceId!="nil"){
                    
                     $notification=$this->appleapn($deviceId,$message,$url,$studentId,$imType,"alert");

                } else {
                    
                    

                    if(count($deviceIds)>0 && $message!=""){
                        $payload = array(
                            "sid"=>$studentId,
                            "url"=>$url,
                            "imType"=>$imType,
                            "type"=>"alert",
                            "message" => $message
                            );
                        $notification = ($this->send_notification($deviceIds, $payload));

                        unset($deviceIds); 
                    }

//                    if(count($deviceIds)>0 && $message!=""){
//                        $payload = array(
//                            "sid"=>$studentId,
//                            "imType"=>$imType,
//                            "type"=>"alert",
//                            "message" => $message
//                            );
//                        $notification = ($this->send_notification($deviceIds, $payload));
//                        
//                        unset($deviceIds); 
//                    }
                }
            }
        }
        
    }
    
    function saveToken(){
        
        $email = $this->input->get_post("email");
        
        $token = $this->input->get_post("token");
        
        $result = $this->apimodel->saveToken($email,$token);
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        if($result > 0 ){
            
            $errorCode = "0";
        
            $msg = "Success";
            
            
            
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg
        );

        echo json_encode($value);
        
    }
    
    
    
    /*
     * Get Vehicle Students
     */
    
    function getVehicleStudents(){
        $staffId=  $this->input->get_post("staffId");
        $travelType=  $this->input->get_post("travelType");
        $assignedDate=  $this->input->get_post("assignedDate");
        $dt=  $this->apilib->getCustomDate("%Y-%m-%d",  strtotime($assignedDate));
        $result=$this->apimodel->getVehicleStudents($staffId,$dt,$travelType);
        $errorCode="1";
        $msg="Failed!!!";
        $students=array();
        foreach ($result->result() as $row){
            $travelDate="";
            $inTime="";
            $outTime="";
            $inLocation="";
            $outLocation="";
            $travelDetailsQ=  $this->apimodel->getTravelDetails($row->studentId,$staffId,$dt,$travelType);
            foreach ($travelDetailsQ->result() as $rowDetail){
                $travelDate = $this->apilib->getCustomDate("%d-%m-%Y",  strtotime($rowDetail->travelDate));
                $inTime=$this->apilib->getCustomDate("%H:%i",  strtotime($rowDetail->inTime));
                $outTime=$rowDetail->outTime==NULL?"":$this->apilib->getCustomDate("%H:%i",strtotime($rowDetail->outTime));
                $inLocation=$rowDetail->inLocation;
                $outLocation=$rowDetail->outLocation;
            }
            $student=array(
                "studentId"=>$row->studentId,
                "admissionNo"=>trim($row->admissionNo),
                "cardNo"=>$row->vehicleCardNo,
                "name"=>$row->name,
                "photo"=>$row->photo,
                "standard"=>$row->standard,
                "section"=>$row->section,
                "schoolName"=>$row->schoolName,
                "fatherName"=>$row->fatherName,
                "motherName"=>$row->motherName,
                "fatherPhone"=>$row->fatherPhone,
                "motherPhone"=>$row->motherPhone,
                "travelType"=>$travelType,
                "travelDate"=>$travelDate,
                "vehicleId"=>$row->vehicleId,
                "registrationNo"=>$row->registrationNo,
                "vehicleNo"=>$row->vehicleNo,
                "inTime"=>$inTime,
                "outTime"=>$outTime,
                "inLocation"=>$inLocation,
                "outLocation"=>$outLocation,
                "staffStatus"=>$row->staffStatus,
                "schoolStatus"=>$row->schoolStatus
//                "locations"=>$locations
            );
            $students[]=$student;
            $errorCode="0";
            $msg="Success!!!";
        }
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "students"=>$students
        );

        echo json_encode($value);
    }
    
     
  
    /*
     * Save Travel Details
     */

    function saveTravelDetails(){
        $detailsId=  $this->input->get_post("detailsId");
        $staffId=  $this->input->get_post("staffId");
        $studentId=  $this->input->get_post("studentId");
        $vehicleId=  $this->input->get_post("vehicleId");
        $travelType=  $this->input->get_post("travelType");
        $travelDate=  $this->input->get_post("travelDate");
        $inTime=  $this->input->get_post("inTime");
        $outTime=  $this->input->get_post("outTime");
        $inLocation=  $this->input->get_post("inLocation");
        $outLocation=  $this->input->get_post("outLocation");
        $isManual=  $this->input->get_post("isManual");
        $comments=  $this->input->get_post("comments");
//        $lat=  $this->input->get_post("lat");
//        $lng=  $this->input->get_post("lng");
        $location=  $this->input->get_post("location");
        $errorCode="1";
        $msg="Failed!!!";
        $data=array(
            "detailsId"=>$detailsId,
            "staffId"=>$staffId,
            "vehicleId"=>$vehicleId,
            "studentId"=>$studentId,
            "travelType"=>$travelType,
            "travelDate"=>$this->apilib->getCustomDate("%Y-%m-%d",  now()),
            "inTime"=>$inTime,
            "outTime"=>$outTime,
            "inLocation"=>$inLocation,
            "outLocation"=>$outLocation,
            "isManual"=>$isManual,
            "comments"=>$comments,
            "status"=>1
        );
        
        $q=$this->apimodel->saveTravelDetails($data);
//        $q = 1;
        $notification="";
        
        $imType = "VEHICLE";
        $url = str_replace("/rkapi/", "", base_url());
        $type="alert";

        if($q>0){
            $errorCode="0";
            $msg="Travel Details Saved Successfully";
//            $deviceQ= $this->apimodel->getUsers($studentId);
//            $deviceIds=array();
//            $message="";
            $userDetails = $this->apimodel->getUsers($studentId);

//            foreach ($deviceQ->result() as $rowUser){
            foreach ($userDetails as  $rowUser) {
                $studentName = $rowUser['studentName'];
                $deviceType= $rowUser['deviceType'];
                $deviceId = $rowUser['deviceId'];
                if($deviceId!=""){
                    $deviceIds[]=$deviceId;

                    if($inTime!=""){
                        $message = $studentName ." has checked in from ".$inLocation;
                    }
                    if($outTime!=""){
                        $message = $studentName ." has checked out from ".$outLocation;
                    }

                    if($deviceType == "iOS" && $deviceId!="nil"){

                        $travelType="PICKUP";

                        $notification=$this->appleapn($deviceId,$message,$url,$studentId,$imType,$type);

                    } else {
                        
                        

                        if(count($deviceIds)>0 && $message!=""){
                            $payload = array(
                                "sid"=>$studentId,
                                "url"=>$url,
                                "imType"=>$imType,
                                "type"=>$type,
                                "message" => $message
                                );
                            $notification = ($this->send_notification($deviceIds, $payload));

                            unset($deviceIds); 
                        }
//
////                        if($deviceId!="" && $deviceId!="nil" && $message!=""){
////                            $message = array(
////                                "sid"=>$studentId,
////                                "type"=>"alert",
////                                "message" => $message
////                                );
////                            $notification = ($this->send_notification($deviceIds, $message));
////                        }
                    }
                }
            }
            
            
            
//            if(count($deviceIds)>0 && $message!=""){
//                $message = array(
//                    "sid"=>$studentId,
//                    "type"=>"alert",
//                    "message" => $message
//                    );
//                $gcmResult = ($this->send_notification($deviceIds, $message));
//            }
        }

        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "studentId"=>$studentId
//            "deviceType"=>$deviceType,
//            "deviceId" => $deviceId,
//            "notification"=>$notification
        );

        echo json_encode($value);
    }

    /*
     * Save Travel
     */

    function saveTravel(){
        $detailsId=  $this->input->get_post("detailsId");
        $staffId=  $this->input->get_post("staffId");
        $studentId=  $this->input->get_post("studentId");
        $vehicleId=  $this->input->get_post("vehicleId");
        $travelType=  $this->input->get_post("travelType");
        $travelDate=  $this->input->get_post("travelDate");
        $inTime=  $this->input->get_post("inTime");
        $outTime=  $this->input->get_post("outTime");
//        $inLocation=  $this->input->get_post("inLocation");
//        $outLocation=  $this->input->get_post("outLocation");
        $isManual=  $this->input->get_post("isManual");
        $comments=  $this->input->get_post("comments");
        $lat=  $this->input->get_post("lat");
        $lng=  $this->input->get_post("lng");
        $location=  $this->input->get_post("location");
        $errorCode="1";
        $msg="Failed!!!";
        $data=array(
            "detailsId"=>$detailsId,
            "staffId"=>$staffId,
            "vehicleId"=>$vehicleId,
            "studentId"=>$studentId,
            "travelType"=>$travelType,
            "travelDate"=>$this->apilib->getCustomDate("%Y-%m-%d",  now()),
            "inTime"=>$inTime,
            "outTime"=>$outTime,
            "inLocation"=>"",
            "outLocation"=>"",
            "isManual"=>$isManual,
            "comments"=>$comments,
            "status"=>1
        );
        $data_location=array(
            "staffId"=>$staffId,
            "vehicleId"=>$vehicleId,
            "travelDate"=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
            "travelType"=>$travelType,
            "lat"=>$lat,
            "lng"=>$lng,
            "location"=>$location,
            "status"=>1
        );
        $q=$this->apimodel->saveTravel($data,$data_location);
        
        $gcmResult="";

        if($q>0){
            $errorCode="0";
            $msg="Travel Details Saved Successfully";
            $deviceQ= $this->apimodel->getUsers($studentId);
            $deviceIds=array();
            $url = str_replace("/rkapi/", "", base_url());
            $imType="VEHICLE";
            $type="alert";
            $message="";
            foreach ($deviceQ->result() as $rowUser){
                $studentName = $rowUser->studentName;
                $deviceType= $rowUser->deviceType;
                $deviceId = $rowUser->deviceId;
                if($deviceId!=""){
                    $deviceIds[]=$deviceId;
                }
                if($inTime!=""){
                    $message = $studentName ." has checked in from ".$location;
                }else{
                    $message = $studentName ." has checked out from ".$location;
                }
            }
            
            if($deviceType == "iOS" && $deviceId!="nil"){
                
                $travelType="PICKUP";
                
                $notification=$this->appleapn($deviceId, $msg, $studentId,$travelType);
                
            } else {
            
                if(count($deviceIds)>0 && $message!=""){
                    $message = array(
                        "sid"=>$studentId,
                        "type"=>$type,
                        "message" => $message
                        );
                    $notification = ($this->send_notification($deviceIds, $message));
                }
            }
        }

        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "notification"=>$notification
        );

        echo json_encode($value);
    }
    
    /*
     * save location
     */
    
    function saveLocation(){
        $staffId=  $this->input->get_post("staffId");
        $vehicleId=  $this->input->get_post("vehicleId");
        $travelType=  $this->input->get_post("travelType");
        $lat=  $this->input->get_post("lat");
        $lng=  $this->input->get_post("lng");
        $location=  $this->input->get_post("location");
        
        $data_location=array(
            "staffId"=>$staffId,
            "vehicleId"=>$vehicleId,
            "travelDate"=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
            "travelType"=>$travelType,
            "lat"=>$lat,
            "lng"=>$lng,
            "location"=>$location,
            "status"=>1
        );
        $q=$this->apimodel->saveLocation($data_location);
        
        $errorCode = "1";
        
        $msg = "Failed";

        if($q>0){
            $errorCode="0";
            $msg="Travel Details Saved Successfully";
        }

        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg
        );

        echo json_encode($value);
    }
    
    

    function clean($string) {
        //$string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

        return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
     }
     
     
    function testgcm(){
        $deviceId[]=$this->input->get_post("deviceId");
        $message=$this->input->get_post("message");
        $type = $this->input->get_post("type");
        
        $sid = 1;
        
        $ids = array($this->input->get_post("deviceId"));
        //$type = "alert";
//        $message = array("sid"=>$sid,"type"=>$type,"message" => $message);
        
        $payload = array(
            "sid"=>$sid,
            "imType"=>$type,
            "type"=>"alert",
            "message" => $message
            );
//        $notification = ($this->send_notification($deviceIds, $payload));
    
        echo json_encode($this->send_notification($ids, $payload));
    }
    
    
    function test(){
        echo $this->apilib->getCustomDate("%d-%M-%Y %h:%i %A",  now());
    }
    
    function testappleapn(){
$deviceToken = $this->input->get_post("dt");
        
        $dt=$deviceToken==""?"717E6A3FD8A2F4F757B5C3CF151A191655A5DF487ADC7356039E092800FFD1C4":$deviceToken;
        $msg="Jonathan Rex Varghese has checked in from Anniah Layout";
        $studentId=1;
        $travelType="PICKUP";
//        $email = "rexkalloor@gmail.com";
//        $q=$this->apimodel->getuserdetails($email);
//        if($q->num_rows()>0){
//            $value['errorCode']=0;
//            $value['msg']='Success';
//            if($q->row()->status==0){
//                $value['errorCode']=1;
//                $value['msg']="Poked User is logged out";
//            }else{
//                $deviceType=$q->row()->deviceType;
//                $deviceTokens=$q->row()->deviceId;
//                if($deviceTokens=="NoPush"){
//                    $value['errorCode']=1;
//                    $value['msg']="No Device Id";
//                }else{
//                    $result=$this->appleapn($deviceTokens, $msg, $studentId,$travelType);
//                }
//            }
//        }
        
        $url = str_replace("/rkapi/", "", "http://52.36.13.169/rkdemo/india/");
        
        $result=$this->appleapn($dt, $msg,$url, $studentId,'Notification','alert');


        print_r($result);
    }
    
    /*
    * Apple APN
    */

     /*
    * Apple APN
    */

    function appleapn($deviceToken,$msg,$surl,$studentId,$imType,$type){
    
    $ch = curl_init("https://fcm.googleapis.com/fcm/send");

    //The device token.
    $token = $deviceToken; //token here 

    //Title of the Notification.
    $title = $type;

    //Body of the Notification.
    $body = $msg;

    //Creating the notification array.
    $notification= array(
            'badge' => +1,
            'text' => $body,
            'sound' => 'default',
            'url' => $surl,
            'sid' => $studentId,
            'imType'=>$imType,
            'type' =>$type
        );
    
    //This array contains, the token and the notification. The 'to' attribute stores the token.
    $arrayToSend = array('to' => $token, 'notification' => $notification,'priority'=>'high');

    //Generating JSON encoded string form the above array.
    $json = json_encode($arrayToSend);
    //Setup headers:
    $headers = array();
    $headers[] = 'Content-Type: application/json';
    $headers[] = 'Authorization: key=AAAAgLhClbE:APA91bHV9pJhXyAm6pOYwMj1cKPyePYDJA6fai07RTcUYs9FvKFYpRm12DnuLkWedHH5KjSwUY6XbHUIu1335o5E2Tsqa9BcHxATQ2JHXT8wJGBpLrMObbBK4rfYcxKob78VUq-j4ltIUc9hrbxFEmxe0HPi0qQZMg'; // key here

    //Setup curl, add headers and post parameters.
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);                                                                     
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);       

    //Send the request
    $response = curl_exec($ch);

    //Close request
    curl_close($ch);
   
        
        $message=$msg;
        $value['errorCode']=0;
        $value['msg']="Success";
        

        if (!$response){
            $value['errorCode']=1;
            $value['msg']='Message not delivered';      
        }    
        else{
            $value['errorCode']=0;
            $value['msg']='Message successfully delivered';
        }
        

        return $value;
        exit();
    }
            
    /**
     * Sending Push Notification
     */
    public function send_notification($ids, $message) {

        // Set POST variables
        $url = 'https://android.googleapis.com/gcm/send';

        $fields = array(
            'registration_ids' => $ids,
            'data' => $message,
        );

        $googleapi=$this->config->item('GOOGLE_GCM_SERVER_API');
        $headers = array(
            'Authorization: key=' . $googleapi,
            'Content-Type: application/json'
        );
        // Open connection
        $ch = curl_init();

        // Set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);

        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Disabling SSL Certificate support temporarly
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));

        // Execute post
        $result = curl_exec($ch);
        if ($result === FALSE) {
            die('Curl failed: ' . curl_error($ch));
        }

        // Close connection
        curl_close($ch);
        return $result;
    }	
    
    function testURL(){
        
        echo str_replace("/rkapi/", "", base_url());
        
    }
    /**
     * Gets list of marks card
     *
     * @param       None
     * @return     Json array
     */
    function getMarksCards()
    {
        $studentId = $this->input->get_post("studentId");
        
        $errorCode="1";
        
        $msg="Failed!!!";
        $marksCardQ=$this->apimodel->getMarkscards($studentId);
        if($marksCardQ->num_rows()>0)
        {
            $errorCode="0";
            $msg="Success!!!";
        }
        $marksCard=$marksCardQ->result_array();
        $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg,
            "studentId"=>$studentId,
            "marksCard"=>$marksCard
        );
        
        echo json_encode($value);
    }

    /**
     * Gets list of student leave letter
     *
     * @param       None
     * @return     Json array
     */
    function getLeaveLetter()
    {
        $studentId=$this->input->get_post("studentId");
        $errorCode="1";
        $msg="Failed!!!";
        $leave=$this->apimodel->getLeaves($studentId);
        if($leave->num_rows()>0)
        {
             $errorCode="0";
            $msg="Success!!!";
        }
        $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg,
            "studentId"=>$studentId,
            "leave"=>$leave->result_array()
        );
        echo json_encode($value);
    }

    /**
     * Gets list of student leave letter
     *
     * @param       None
     * @return     Json array
     */
    function getLeavesdata()
    {
        
        $staffId=$this->input->get_post("staffId");
	$classId=$this->input->get_post("classId");
        $errorCode="1";
        $msg="Failed!!!";
        $leave=$this->apimodel->getLeavedata($staffId,$classId);
        if($leave->num_rows()>0)
        {
             $errorCode="0";
            $msg="Success!!!";
        }
        $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg,
            "staffId"=>$staffId,
	     "classId"=>$classId,
            "leave"=>$leave->result_array()
        );
        echo json_encode($value);
    }



    /**
     * Saves student letter sends from parent app
     *
     * @param       None
     * @return     Json array
     */
    function saveLeaveLetter()
    {
        $errorCode="1";
        $msg="Failed!!!";
        $studentId=$this->input->get_post("studentId");
        $heading="Leave Letter";
        $reason=$this->input->get_post("reason");
        $details=$this->input->get_post("details");
        $from=$this->input->get_post("fromDate");
        $to=$this->input->get_post("toDate");
        $data["leaveId"]="";
        $data["studentId"]=$studentId;
        $data["heading"]=$heading;
        $data["reason"]=$reason;
        $data["details"]=$details;
        $data['fromDate'] = $this->apilib->getCustomDate("%Y-%m-%d",strtotime($from));
        $data['toDate'] = $this->apilib->getCustomDate("%Y-%m-%d",strtotime($to));
        $data['approvalStatus']="PENDING";
        $data['added_on']=$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",now());
        $result = $this->apimodel->saveLeave($data);
        if($result!="")
        {
            $errorCode="0";
            $msg="Success!!!";
        }
         $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg
        );
        echo json_encode($value);

    }
    /**
     * Calculates size of the file
     *
     * @param       file path, file name
     * @return     Json array
     */
    function sizeCalculate($f,$file)
    {
        $path=str_replace("\\", "/",realpath($f));
        
        $totalsize = 0;
        $totalcount = 0;
        $dircount = 0;
      if ($handle = opendir ($path))
      {
        
          $nextpath = $path . '/' . $file;
          if ($file != '.' && $file != '..' && !is_link ($nextpath))
          {
            if (is_dir ($nextpath))
            {
              $dircount++;
              $result = $this->sizeCalculate($nextpath);
              $totalsize += $result['size'];
              $totalcount += $result['count'];
              $dircount += $result['dircount'];
            }
            elseif (is_file ($nextpath))
            {
              $totalsize += filesize ($nextpath);
              $totalcount++;
            }
          }
        
      }
      
      $total['size'] = $totalsize;
      $total['count'] = $totalcount;
      $total['dircount'] = $dircount;
    
      return $this->sizeFormat($total['size']);
        
    }

    /**
     * Update leave status
     *
     * @param       None
     * @return     Json array
     */
    function updateApprovalStatus()
    {
        $errorCode="1";
        $msg="Failed!!!";
        $data['id'] = $this->input->get_post("leaveId");
        $status=$this->input->get_post("approvalStatus");
        if($status=="0")
        {
           $data['approvalStatus']="ACCEPT"; 
        }
        else
        {
            $data['approvalStatus']="REJECT"; 
        }
        $result = $this->apimodel->updateLeave($data);
        if($result!="")
        {
            $errorCode="0";
            $msg="Success!!!";
        }
         $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg
        );
        echo json_encode($value);
    }
    /**
     * Size format
     *
     * @param       None
     * @return     Json array
     */
     function sizeFormat($size)
    {
        if($size<1024)
        {
            return $size." bytes";
        }
        else if($size<(1024*1024))
        {
            $size=round($size/1024,1);
            return $size." KB";
        }
        else if($size<(1024*1024*1024))
        {
            $size=round($size/(1024*1024),1);
            return $size." MB";
        }
        else
        {
            $size=round($size/(1024*1024*1024),1);
            return $size." GB";
        } 
    }

    /**
     * Send notification to the parent and admin regarding reader problem
     *
     * @param      None
     * @return     Json array
     */
    function readerAlert()
    {
        // $time=date("H:i a",strtotime("12:40 PM"));
        // $end=date("H:i a", strtotime('+30 minutes', strtotime("12:40 PM")));
        // $current=date("H:i a",now());
        // if($time<=$current and $end>=$current)
        // {
        //     echo "yes";
        // }
        // else
        // {
        //     echo "no";
        // }
        $attendance=$this->apimodel->checkAttendance($this->date);
        if($attendance->num_rows()<1)
        {
            $schoolDetails=$this->apimodel->getSchoolDetails();
            $schoolId=$this->apimodel->getSchoolId();
            if($schoolDetails->num_rows()>0 and $schoolId)
            {
                $day=date('N', strtotime(date('l')));
                $startTime=$schoolDetails->row()->startTime;
                $endTime=$schoolDetails->row()->endTime;
                $startWorkingDay=$schoolDetails->row()->startWorkingDay;
                $endWorkingDay=$schoolDetails->row()->endWorkingDay;
                $proceed=0;
                $currentTime=date("H:i a",now());
        
                if($startWorkingDay<=$day and $endWorkingDay>=$day)
                {
                    $sStartTime=date("H:i a",strtotime($startTime));
                    $sEndTime=date("H:i a", strtotime('+30 minutes', strtotime($startTime)));
                    if($sStartTime<=$currentTime and $sEndTime>=$currentTime)
                    {
                        $time=$startTime;
                        $proceed=1;
                    }
                    $eStartTime=date("H:i a",strtotime($endTime));
                    $eEndTime=date("H:i a", strtotime('+30 minutes', strtotime($endTime)));
                    if($eStartTime<=$currentTime and $eEndTime>=$currentTime)
                    {
                        $time=$endTime;
                        $proceed=1;
                    }
                    if($proceed==1)
                    {
                        echo "success";
                        $users = $this->apimodel->getTotalUsers($schoolId);
                            
                        $heading = "Attendance Reader alert";
                        $url = substr_replace(base_url() ,"",-1);
                        $imType = "READER";
                        $message = 'Attendance reader not turned ON in your kid\'s school '.$schoolDetails->row()->schoolName.', so today you will not get notification regarding attendance' ;
                        $msg='Attendance+reader+not+turned+ON+in+your+school+'.str_replace(" ","+",$schoolDetails->row()->schoolName).',+Please+check+once+and+make+sure+its+working+fine.';
                        $phone=$schoolDetails->row()->contactPhone;
                        $reader=$this->apimodel->saveReaderAlert($heading,$msg,$this->date,$time);
                        if($reader==1)
                        {

                            foreach ($users as $value) {
                                
                                
                                $value['deviceId'];
                                $ids[]= $value['deviceId'];
                                
               
                                if($value['deviceType'] == "iOS" && $value['deviceId']!="nil")
                                {

                                    $notification=$this->appleapn($value['deviceId'],$message,$url,$value['studentId'],$imType,"");
                                        
                                } 
                                else {
                                
                                    $payload = array(
                                    "sid"=>$value['studentId'],
                                    "url"=>$url,
                                    "imType"=>$imType,
                                    "type"=>"alert",
                                    "message" => $message
                                    );

                                    echo $re=$this->send_notification($ids, $payload);
                                    
                                    
                                }
                                 unset($ids);
                                
                            }

                            // $url="http://sms.skillvent.com/API/WebSMS/Http/v1.0a/index.php?username=poornaapps&password=Saritha@123&sender=RAKSHA&to=$phone&message=$msg&reqid";
                            // $ch = curl_init();

                            // // set URL and other appropriate options
                            // curl_setopt($ch, CURLOPT_URL, $url);
                            // curl_setopt($ch, CURLOPT_HEADER, 0);
                            // curl_exec($ch);
                            // curl_close($ch);
            
                            // grab URL and pass it to the browser
                           

                            // close cURL resource, and free up system resources
            
                            
                        }    
                        
                    }
                    else
                    {
                        echo "fail";
                    }
                }
                else
                {
                    echo "not working day";
                }
            }
            else
            {
                echo "no school details";
            }
        }
        else
        {
            echo "attendance exist";
        }

    }
    // function testPath()
    // {
    //     echo base_url()."<br>";
    //     echo str_replace("://", "", base_url())."<br>";
    //     echo realpath("../images/events");

    // }
    
}
