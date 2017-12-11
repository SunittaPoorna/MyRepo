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
            'msg'=>'Welcome to Rakasha Kids API...'
        );
        echo json_encode($value);
    }
    
    
    /*
     * Check APIKey is valid
     */
    function checkAPIKey($APIKey){
        $result['errorCode']=1;
        $result['msg']="Invalid APIKey";
        $result['user']='';
        if($APIKey!=""){
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
    
    /*
     * SignIn
     */
    
    function signIn(){
        $username=$this->input->get_post("username");
        $password=$this->input->get_post("password");
        $data['username']=$username;
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
    
    /*
     * Get Students
     */
    
    function getStudents(){
        $staffId=  $this->input->get_post("staffId");
        $travelType=  $this->input->get_post("travelType");
        $assignedDate=  $this->input->get_post("assignedDate");
        $dt=  $this->apilib->getCustomDate("%Y-%m-%d",  strtotime($assignedDate));
        $result=$this->apimodel->getStudents($staffId,$dt,$travelType);
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
                "name"=>$row->name,
                "photo"=>$row->photo,
                "standard"=>$row->standard,
                "section"=>$row->section,
                "schoolName"=>$row->schoolName,
                "fatherName"=>$row->fatherName,
                "motherName"=>$row->motherName,
                "fatherPhone"=>$row->fatherPhone,
                "motherPhone"=>$row->motherPhone,
                "travelType"=>$row->travelType,
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
    
    function getStaffStudentsAttendance(){
        
        $staffId=  $this->input->get_post("staffId");
        
        $dt = $this->input->get_post("dt");
        
        if($dt!=""){
            
            $dt = $this->apilib->getCustomDate("%Y-%m-%d",  strtotime($dt));
            
        } else {
        
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
                "attendance"=>"",
                "notes"=>""
                
            );
            
            $attendanceQ = $this->apimodel->getAttendance($studentId,$dt);
            
            if($attendanceQ->num_rows()>0){
                
                $attendance=array(
                    "attendanceId" => $attendanceQ->row()->attendanceId,
                    "attendanceDate" => $this->apilib->getCustomDate("%d-%M",  strtotime($attendanceQ->row()->logDate)),
                    "inTime"=>"",
                    "outTime"=>""
                );


                foreach ($attendanceQ->result() as $row){

                    if($row->logType == "ENTRY"){
                        
                        $attendance['attendance'] = $row->attendance;
                        
                        $attendance['notes'] = $row->notes;

                        $attendance['inTime'] = $this->apilib->getCustomDate("%h:%i %A",  strtotime($row->logDate));

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
                "standard"=>$rowStudent->standard,
                "section"=>$rowStudent->section,
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
                "standard"=>$rowStudent->standard,
                "section"=>$rowStudent->section,
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
    
    function getStudentDetails(){
        
        $studentId = $this->input->get_post("studentId");
        
        $errorCode="1";
        
        $msg="Failed!!!";
        
        $from = "2016-06-01";
        
        $to = "2017-07-31";//$this->apilib->getCustomDate("%Y-%m-%d",  now());
        
        $studentQ = $this->apimodel->getStudent($studentId);
        
        $student = array();
        
        $attendancesQ = $this->apimodel->getStudentAttendance($studentId,$from,$to,1);
        
        $attendance = array();
        
        $totalAttendanceQ = $this->apimodel->getTotalAttendance($studentId,$from,$to);
        
        foreach ($studentQ->result() as $row){
            
            $student = array (
                
                "studentId" => $row->studentId,
                "name" => $row->name,
                "class" => $row->standard ." ".$row->section,
                "photo" => $row->photo,
                "totalWorkingDays" => 200,
                "totalAttendance" => $totalAttendanceQ->num_rows(),
                "attendances" => array(),
                "notifications"=>array(),
                "messages" => array()
            );
            $errorCode="0";
            $msg="Success!!!";
        }        
        
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
        
        $student['notifications'] = $notifications;
        
        $student['messages'] = $messages;
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "student"=>$student,
        );

        echo json_encode($value);
        
    }
    
    
    function getStudentAttendance(){
        
        $studentId = $this->input->get_post("studentId");
        
        $from = "2016-06-01";
        
        $to = "2017-03-31";//$this->apilib->getCustomDate("%Y-%m-%d",  now());
        
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
                "inTime"=>"",
                "outTime"=>""
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
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $heading = "";
        
        $updatedDate = $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",$updatedDate);
        
        $notification = "";
        
        $data = array(
            "attendanceId"=>$attendanceId,
            "studentId"=>$studentId,
            "staffId"=>$staffId,
            "attendance" => $attendance,
            "notes"=>$notes,
            "updatedDate"=>$updatedDate,
            "status"=>1
        );
        
        if($attendanceId=="0"){
            
            $data['logType'] = $logType;
            
            $data['logDate'] = $updatedDate;
            
//            $data['attendance'] = $attendance;
            
            $data['gateName'] = "MANUAL";
            
        }
        
        $result = $this->apimodel->saveAttendance($data);
        
        if($result>0){
            
            $errorCode = "0";
        
            $msg = "Success";
            
            $message="";
            
            $travelType =  "";
            
            $deviceQ= $this->apimodel->getUsers($studentId);
            $deviceIds=array();
            
            foreach ($deviceQ->result() as $rowUser){
                $studentName = $rowUser->studentName;
                $deviceType= $rowUser->deviceType;
                $deviceId = $rowUser->deviceId;
                if($deviceId!=""){
                    $deviceIds[]=$deviceId;
                
                    $time = $this->apilib->getCustomDate("%h:%i %A",  strtotime($updatedDate));


                    $heading = "Attendance";

                    $message = $studentName ." is ".$attendance;

    //                if($logType=="ENTRY"){
    //                    
    //                    $heading = "Attendance";
    //
    //                    $message = $studentName ." has reached school at ".$time;
    //
    //                } else {
    //                    
    //                    $heading = "Attendance";
    //
    //                    $message = $studentName ." has left the school at ".$time;
    //
    //                }

                    if($deviceType == "iOS" && $deviceId!="nil"){

    //                    $travelType="PICKUP";

                        $notification=$this->appleapn($deviceId, $message, $studentId,$travelType);

                    } else {

                        if(count($deviceIds)>0 && $message!=""){
                            $payload = array(
                                "sid"=>$studentId,
                                "imType"=>"GATE",
                                "type"=>"alert",
                                "message" => $message
                                );
                            $notification = ($this->send_notification($deviceIds, $payload));
                        }
                    }
                }
            }
            
            $dataNoti = array(
                "studentId" => $studentId,
                "typeId" =>1,
                "heading" => $heading,
                "content" => $message,
                "sentDate"=>$updatedDate,
                "status"=>1
            );

            //$this->apimodel->saveNotification($dataNoti);
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
        
        $dt = gmdate("%Y-%m-%d %H:%i:%s", $timestamp);
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $logDate = $this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  strtotime($dt));
        
        $data = array(
            "attendanceId" => "0",
            "studentId"=>$studentId,
            "gateName"=>$gateName,
            "logType"=>$logType,
            "logDate"=>$logDate,
            "status"=>1
        );
        
        if($logType == "ENTRY"){
            
            $data['attendance'] = "PRESENT";
            
        }
        
        
        
        $result = $this->apimodel->saveAttendance($data);
        
        if($result>0){
            
            $errorCode = "0";
        
            $msg = "Success";
            
            $message="";
            
            $travelType =  "";
            
            $deviceQ= $this->apimodel->getUsers($studentId);
            $deviceIds=array();
            
            foreach ($deviceQ->result() as $rowUser){
                $studentName = $rowUser->studentName;
                $deviceType= $rowUser->deviceType;
                $deviceId = $rowUser->deviceId;
                if($deviceId!=""){
                    $deviceIds[]=$deviceId;
                }
                
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

                    $notification=$this->appleapn($deviceId, $message, $studentId,$travelType);

                } else {

                    if(count($deviceIds)>0 && $message!=""){
                        $payload = array(
                            "sid"=>$studentId,
                            "imType"=>"GATE",
                            "type"=>"alert",
                            "message" => $message
                            );
                        $notification = ($this->send_notification($deviceIds, $payload));
                    }
                }
            }
            
            $dataNoti = array(
                "studentId" => $studentId,
                "typeId" =>1,
                "heading" => $heading,
                "content" => $message,
                "sentDate"=>$logDate,
                "status"=>1
            );

            //$this->apimodel->saveNotification($dataNoti);
        }
        
        $value = array(
            
            "errorCode" => $errorCode,
            "msg" => $msg,
            "notification"=>$notification
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

        if($q>0){
            $errorCode="0";
            $msg="Travel Details Saved Successfully";
            $deviceQ= $this->apimodel->getUsers($studentId);
            $deviceIds=array();
            $message="";
            foreach ($deviceQ->result() as $rowUser){
                $studentName = $rowUser->studentName;
                $deviceType= $rowUser->deviceType;
                $deviceId = $rowUser->deviceId;
                if($deviceId!=""){
                    $deviceIds[]=$deviceId;
                }
                if($inTime!=""){
                    $message = $studentName ." has checked in from ".$inLocation;
                }
                if($outTime!=""){
                    $message = $studentName ." has checked out from ".$outLocation;
                }
                
                if($deviceType == "iOS" && $deviceId!="nil"){
                
                    $travelType="PICKUP";

                    $notification=$this->appleapn($deviceId, $message, $studentId,$travelType);

                } else {
            
                    if($deviceId!="" && $deviceId!="nil" && $message!=""){
                        $message = array(
                            "sid"=>$studentId,
                            "type"=>"alert",
                            "message" => $message
                            );
                        $notification = ($this->send_notification($deviceIds, $message));
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
            "deviceType"=>$deviceType,
            "deviceId" => $deviceId,
            "notification"=>$notification
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
                        "type"=>"alert",
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
    
   
    
    function resetTravel(){
        
        $studentId = $this->input->get_post("studentId");
        
        $staffId=  $this->input->get_post("staffId");
        
        $vehicleId=  $this->input->get_post("vehicleId");
        
        $dt = $this->input->get_post("travelDate");
        
        $travelType=  $this->input->get_post("travelType");
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $dt = $this->apilib->getCustomDate("%Y-%m-%d", strtotime($dt));
        
        $delLocation = $this->apimodel->delVehicleLocations($staffId,$dt,$travelType);
        
        $delTravelDetails = $this->apimodel->delTravelDetails($studentId,$staffId,$dt,$travelType);
        
        if ($delTravelDetails>0){
            
            $errorCode = "0";
            
            $msg = "Reset Successfully";
            
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg
        );

        echo json_encode($value);
    }
    
    /*
     * User SignIn
     */
    
    function userSignin(){
        $email=  $this->input->get_post("email");
        $passCode=  $this->input->get_post("passCode");
        $deviceType=  $this->input->get_post("deviceType");
        $deviceId=  $this->input->get_post("deviceId");
        $status=  $this->input->get_post("status");
        $errorCode="1";
        $msg="Failed!!!";
        $q=  $this->apimodel->userSignin($email);
        $name="";
        //$kids=array();
        if($q->num_rows()>0){
            $errorCode="0";
            $msg="Success";
            
            $status=$status==""?1:$status;
            $pc=$q->row()->passCode;
            if($pc!=$passCode){
                $errorCode="1";
                $msg="Wrong Passcode. Kindly check your email!!!";
            }else{
                $data=array(
                    "deviceType"=>$deviceType,
                    "deviceId"=>$deviceId,
                    "status"=>$status
                );
                $this->apimodel->updateUser($email,$data);
                //$kids=  $this->_getKids($email);
                $name=$q->row()->name;
            }
            
            
        }else{
            $msg="Sorry!!! Your Kid's school has not implemented Raksha Kids.";
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "name"=>$name
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
                "standard"=>$row->standard,
                "section"=>$row->section,
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
                    "studentId"=>$studentId,
                    "heading"=>$subject,
                    "content" => $message,
                    "typeId" => 1,
                    "sentDate"=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
                    "status"=>1
                );
                
                $q=$this->apimodel->saveMessage($data);
                
            }
            
        } else {
        
            $data=array(
                "messageId"=>"",
                "studentId"=>$studentId,
                "heading"=>$subject,
                "content" => $message,
                "typeId" => 1,
                "sentDate"=>$this->apilib->getCustomDate("%Y-%m-%d %H:%i:%s",  now()),
                "status"=>1
            );
            $q=$this->apimodel->saveMessage($data);
        }
        
        $errorCode = "1";
        
        $msg = "Failed";

        if($q>0){
            $errorCode="0";
            $msg="Message Saved Successfully";
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
        
        $schoolId = $this->input->get_post("schoolId");
        
        $studentId = $this->input->get_post("studentId");
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $timeTable = "";
        
        if($schoolId!=""){
            
            $errorCode="0";
            $msg="Success";
            
            $timeTable = "time_table3.jpg";
            
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "timeTable" => $timeTable
        );

        echo json_encode($value);
        
    }
    
    function getDiary(){
        
        $schoolId = $this->input->get_post("schoolId");
        
        $studentId = $this->input->get_post("studentId");
        
        $errorCode = "1";
        
        $msg = "Failed";
        
        $events = array();
        
        if($schoolId!=""){
            
            $errorCode="0";
            $msg="Success";
            
            $event = array(
                
                "date" => "09/01/2016",
                
                "details" => "Annual Sports Junior School"
                
            );
            
            $events[] = $event;
            
            $event = array(
                
                "date" => "09/01/2016",
                
                "details" => "Annual Sports Junior School"
                
            );
            
            $events[] = $event;
            
            $event = array(
                
                "date" => "09/15/2016",
                
                "details" => "First Term Exam Begins"
                
            );
            
            $events[] = $event;
            
            $event = array(
                
                "date" => "09/30/2016",
                
                "details" => "School Closes for Dasara"
                
            );
            
            $events[] = $event;
            
        }
        
        $value=array(
            "errorCode"=>$errorCode,
            "msg"=>$msg,
            "events" => $events
        );

        echo json_encode($value);
        
    }
    
    /*
     * Get Kid Travel
     */
    
    function getKidTravel(){
        $email=  $this->input->get_post("email");
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
                        "travelDate"=>$locationTime
                    );
                    $locations[]=$location;
                } else {
                    $location=  array(
                        "location"=>$rowLocation->location,
                        "travelDate"=>$locationTime
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
                "standard"=>$row->standard,
                "section"=>$row->section,
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
            "kids"=>$students
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
        $message = array("sid"=>$sid,"type"=>$type,"message" => $message);
    
        echo json_encode($this->send_notification($ids, $message));
    }
    
    function test(){
        echo $this->apilib->getCustomDate("%d-%M-%Y %h:%i %A",  now());
    }
    
    function testappleapn(){
//		$dt=$deviceToken==""?"c6841cec95ff54199140cf7e0daae0c80a4e7e8bc8b3f77c34a3fa4df995309b":$deviceToken;
        $msg="Jonathan Rex Varghese has checked in from Anniah Layout";
        $studentId=1;
        $travelType="PICKUP";
        $email = "rexkalloor@gmail.com";
        $q=$this->apimodel->getuserdetails($email);
        if($q->num_rows()>0){
            $value['errorCode']=0;
            $value['msg']='Success';
            if($q->row()->status==0){
                $value['errorCode']=1;
                $value['msg']="Poked User is logged out";
            }else{
                $deviceType=$q->row()->deviceType;
                $deviceTokens=$q->row()->deviceId;
                if($deviceTokens=="NoPush"){
                    $value['errorCode']=1;
                    $value['msg']="No Device Id";
                }else{
                    $result=$this->appleapn($deviceTokens, $msg, $studentId,$travelType);
                }
            }
        }
//		$deviceTokens=array(
//			$dt
//		);


        print_r($result);
    }
    
    /*
    * Apple APN
    */

    function appleapn($deviceTokens,$msg,$studentId,$travelType){

        $passphrase=$this->config->item('PassPhrase');
        $ctx = stream_context_create();
        stream_context_set_option($ctx, 'ssl', 'local_cert', $this->config->item('PermissionFile'));
        stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

//		echo "Secret".$passphrase ."<br>";
//		echo "Permission".$this->config->item('PermissionFile') ."<br>";
        $url=$this->config->item('PushGateway');
        if($this->config->item('Sandbox')){
            $url=$this->config->item('PushGatewaySandbox');
        }
        $fp = stream_socket_client($url, 
            $err, 
            $errstr, 
            60, 
            STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, 
            $ctx);

        $message=$msg;
        $value['errorCode']=0;
        $value['msg']="Success";
        if (!$fp){
                $value['errorCode']=1;
                $value['msg']="Failed to connect : $err $errstr";
//			exit("Failed to connect amarnew: $err $errstr" . PHP_EOL);
        }
//		echo 'Connected to APNS' . PHP_EOL;

        // Create the payload body
        $body['aps'] = array(
            'badge' => +1,
            'alert' => $message,
            'sound' => 'default',
            'sid' => $studentId,
            'type'=>$travelType
        );
//        $body['studentId']=$studentId;
//        $body['travelType']=$travelType;
        $payload = json_encode($body);

//		$deviceToken="2e012ba6d94031cfb44022c9208d1cc8703c5d90fa3702381443ad0ec79017b2";
//		$deviceToken="b2d1a6e33e604c13341b7b4dc074149a06b821ff367ff277be101a70b32fd2d3";

        // Build the binary notification
        $m = chr(0) . pack('n', 32) . pack('H*', $deviceTokens) . pack('n', strlen($payload)) . $payload;

        // Send it to the server
        $result = fwrite($fp, $m, strlen($m));

        if (!$result){
            $value['errorCode']=1;
            $value['msg']='Message not delivered';		
        }    
        else{
            $value['errorCode']=0;
            $value['msg']='Message successfully delivered';
        }
        // Close the connection to the server
        fclose($fp);

        return $value;
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
}