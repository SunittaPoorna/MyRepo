<?php
class apimodel extends CI_Model{
    
    /*
     * Sign In
     */
    
    function signIn($data){
        $username=$data['username'];
        $password=$data['password'];
        $this->db->where("username",$username);
        $this->db->where("password",$password);
        $query=$this->db->get("staffs");
        $result=$query->num_rows();
        $msg="Username or Password is wrong";
        $staff_data=array();
        if($result>0){
            foreach ($query->result() as $row){
                $staffType = $row->designationId;
                $students = array();
                switch ($staffType) {
                    case 1:


                        break;
                    
                    case 2 :
                        
                        break;
                    
                    case 3 :
                        
//                        $studentsQ = $this->apimodel->getStaffStudents($row->staffId);
//                    
//                        foreach ($studentsQ->result() as $rowStudent){
//
//                            $students[] = array(
//                                "studentId"=>$rowStudent->studentId,
//                                "admissionNo"=>$rowStudent->admissionNo,
//                                "name"=>$rowStudent->name,
//                                "photo"=>$rowStudent->photo,
//                                "standard"=>$rowStudent->standard,
//                                "section"=>$rowStudent->section,
//                                "schoolName"=>$rowStudent->schoolName,
//                                "fatherName"=>$rowStudent->fatherName,
//                                "motherName"=>$rowStudent->motherName,
//                                "fatherPhone"=>$rowStudent->fatherPhone,
//                                "motherPhone"=>$rowStudent->motherPhone,
//                                "schoolStatus"=>$rowStudent->schoolStatus
//                            );
//                        }
                        
                        break;

                    default:
                        break;
                }
//                if($staffType == "Security"){
//                    $studentsQ = $this->apimodel->getAllStudents($row->schoolId);
//                    
//                    foreach ($studentsQ->result() as $rowStudent){
//                        
//                        $students[] = array(
//                            "studentId"=>$rowStudent->studentId,
//                            "admissionNo"=>$rowStudent->admissionNo,
//                            "name"=>$rowStudent->name,
//                            "photo"=>$rowStudent->photo,
//                            "standard"=>$rowStudent->standard,
//                            "section"=>$rowStudent->section,
//                            "schoolName"=>$rowStudent->schoolName,
//                            "fatherName"=>$rowStudent->fatherName,
//                            "motherName"=>$rowStudent->motherName,
//                            "fatherPhone"=>$rowStudent->fatherPhone,
//                            "motherPhone"=>$rowStudent->motherPhone,
//                            "schoolStatus"=>$rowStudent->schoolStatus
//                        );
//                    }
//                }
                $staff_data=array(
                    "staffId"=>$row->staffId,
                    "staffType"=>$staffType,
                    "firstName"=>$row->firstName,
                    "lastName"=>$row->lastName,
                    "phone" => $row->phone,
                    "students"=>$students,
                    "updatedDate"=>  $this->apilib->getCustomDate("%d-%m-%Y",  now()),
                    "status"=>$row->status
                );
                
            }
            $msg="Signed Successfully!!!";
            
        }
        $value=array(
            "result"=>$result,
            "msg"=>$msg,
            "staffData"=>$staff_data
        );
        return $value;
    }
    
    function getUserDetails($email){
        
        $this->db->where("email",$email);
        $query = $this->db->get("users");
        
        return $query;
        
    }
    
//    function getStaffStudentsAttendance($staffId,$type,$dt){
//        $sql="SELECT s.schoolName,s.status as schoolStatus,
//            ss.studentId,ss.admissionNo,ss.name,ss.photo,
//            sd.standard,sd.section,ss.fatherName,ss.fatherPhone,
//            ss.motherName,ss.motherPhone,a.attendanceId,
//            a.logDate,a.logType,a.attendance,a.notes
//            FROM school_students ss 
//            INNER JOIN student_details sd
//            ON sd.studentId = ss.studentId
//            INNER JOIN student_staffs sstf
//            ON sstf.studentId = ss.studentId
//            INNER JOIN schools s
//            ON s.schoolId=ss.schoolId
//            INNER JOIN attendance a
//            ON a.studentId = ss.studentId
//            WHERE sstf.staffId=$staffId
//            AND date(a.logDate) = '".$dt ."'    
//            AND a.logType = '".$type."'";
//        
//        $query=  $this->db->query($sql);
//        
//        return $query;
//    }
    
    function getStaffStudents($staffId){
        $sql="SELECT s.schoolName,s.status as schoolStatus,
            ss.studentId,ss.admissionNo,ss.name,ss.photo,
            sd.standard,sd.section,ss.fatherName,ss.fatherPhone,
            ss.motherName,ss.motherPhone
            FROM school_students ss 
            INNER JOIN student_details sd
            ON sd.studentId = ss.studentId
            INNER JOIN student_staffs sstf
            ON sstf.studentId = ss.studentId
            INNER JOIN schools s
            ON s.schoolId=ss.schoolId
            WHERE sstf.staffId=$staffId ";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function getAllStudents($schoolId){
        $sql="SELECT s.schoolName,s.status as schoolStatus,
            ss.studentId,ss.admissionNo,ss.name,ss.photo,
            sd.standard,sd.section,ss.fatherName,ss.fatherPhone,
            ss.motherName,ss.motherPhone
            FROM school_students ss 
            INNER JOIN student_details sd
            ON sd.studentId = ss.studentId
            INNER JOIN schools s
            ON s.schoolId=ss.schoolId
            WHERE s.schoolId=$schoolId ";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function getStudents($sid,$dt,$travelType){
//        $sql="SELECT * FROM staff_students sts 
//            INNER JOIN school_students scs 
//            ON sts.studentId=scs.studentId 
//            INNER JOIN staffs sst 
//            ON sst.staffId=sts.staffId 
//            WHERE sts.staffId=$sid
//            AND sts.assignedDate='".$dt."'";
        
        $sql="SELECT s.schoolName,s.status as schoolStatus,
            ss.studentId,ss.admissionNo,ss.name,ss.photo,
            sd.standard,sd.section,ss.fatherName,ss.fatherPhone,
            ss.motherName,ss.motherPhone,vs.travelType, 
            vs.assignedDate,vs.vehicleId,vs.staffId,vs.status as staffStatus,
            sv.vehicleId,sv.registrationNo,sv.vehicleNo
            FROM vehicle_staffs vs 
            INNER JOIN student_details sd ";
        if($travelType=="DROP"){
            $sql.="ON sd.dropVehicleId=vs.vehicleId 
            AND date(vs.assignedDate)<='".$dt."' 
            AND vs.travelType='DROP' ";
        }else{
            $sql.="ON sd.pickupVehicleId=vs.vehicleId 
            AND date(vs.assignedDate)<='".$dt."' 
            AND vs.travelType='PICKUP' ";
        }
            $sql.="INNER JOIN school_vehicles sv
            ON sv.vehicleId=vs.vehicleId
            INNER JOIN school_students ss 
            ON ss.studentId=sd.studentId
            INNER JOIN schools s
            ON s.schoolId=ss.schoolId
            WHERE vs.staffId='".$sid ."'
            AND vs.status=1 ";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function getTravelDetails($studentId,$staffId,$dt,$travelType){
        
        $sql="SELECT * FROM travel_details td
             WHERE td.studentId=$studentId
             AND td.staffId=$staffId
             AND travelDate='".$dt."'
             AND travelType='".$travelType."'    
             ORDER BY travelDate DESC";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function getVehicleLocations($sid,$dt,$travelType){
        
        $sql="SELECT * FROM vehicle_locations
             WHERE staffId=$sid 
             AND travelDate >='".$dt."'
             AND travelType ='".$travelType."'    
             ORDER BY travelDate DESC";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function saveTravelDetails($data){
        $detailsId=$data['detailsId'];
        $staffId=$data['staffId'];
        $studentId=$data['studentId'];
        $travelDate=$data['travelDate'];
        $travelType=$data['travelType'];
        $inTime=$data['inTime'];
        $outTime=$data['outTime'];
        $this->db->where("studentId",$studentId);
        $this->db->where("travelType",$travelType);
        $this->db->where("travelDate",$travelDate);
        $query1=$this->db->get("travel_details");
        if($query1->num_rows()>0){
            $detailsId=$query1->row()->detailsId;
            $data['detailsId']=$detailsId;
            if($inTime==""){
                unset($data['inTime']);
                unset($data['inLocation']);
            }else{
//                $data['inLocation']=$data_location['location'];
            }
            if($outTime==""){
                $data['outTime']=NULL;
            }else{
                unset($data['inLocation']);
            }
            $this->db->where("detailsId",$detailsId);
            $this->db->update("travel_details",$data);
        }else{
            unset($data['detailsId']);
            $this->db->insert("travel_details",$data);
            $detailsId=  $this->db->insert_id();
        }
        
        return $detailsId;
    }
	
    function saveTravel($data,$data_location){
        $detailsId=$data['detailsId'];
        $staffId=$data['staffId'];
        $studentId=$data['studentId'];
        $travelDate=$data['travelDate'];
        $travelType=$data['travelType'];
        $inTime=$data['inTime'];
        $outTime=$data['outTime'];
        $this->db->where("studentId",$studentId);
        $this->db->where("travelType",$travelType);
        $this->db->where("travelDate",$travelDate);
        $query1=$this->db->get("travel_details");
        if($query1->num_rows()>0){
            $detailsId=$query1->row()->detailsId;
            $data['detailsId']=$detailsId;
            if($inTime==""){
                unset($data['inTime']);
                unset($data['inLocation']);
            }else{
//                $data['inLocation']=$data_location['location'];
            }
            if($outTime==""){
                $data['outTime']=NULL;
                $data['inLocation']=$data_location['location'];
            }else{
                unset($data['inLocation']);
                $data['outLocation']=$data_location['location'];
            }
            $this->db->where("detailsId",$detailsId);
            $this->db->update("travel_details",$data);
        }else{
            unset($data['detailsId']);
            $data['inLocation']=$data_location['location'];
            $this->db->insert("travel_details",$data);
            $detailsId=  $this->db->insert_id();
        }
        
        $this->db->insert("vehicle_locations",$data_location);
        return $detailsId;
    }
    
    function saveLocation($data_location){
        $this->db->insert("vehicle_locations",$data_location);
        return $this->db->get_affected_rows();
    }
    
    function delVehicleLocations($sid,$dt,$travelType){
        
        $sql="DELETE FROM vehicle_locations
             WHERE staffId=$sid 
             AND travelDate >='".$dt."'
             AND travelType ='".$travelType."'";
        
        $query=  $this->db->query($sql);
        
        return $this->db->affected_rows();
    }
    
    function delTravelDetails($studentId,$staffId,$dt,$travelType){
        
        $sql="DELETE FROM travel_details td
             WHERE td.studentId=$studentId
             AND td.staffId=$staffId
             AND travelDate='".$dt."'
             AND travelType='".$travelType."'";
        
        $query=  $this->db->query($sql);
        
        return $this->db->affected_rows();
    }
    
    function getStudentTravel($email){
        $sql="SELECT * 
            FROM school_students scs 
            INNER JOIN travel_details td 
            ON scs.studentId=td.studentId 
            WHERE scs.fatherEmail='".$email."'";
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function userSignin($email){
        
        $sql="SELECT email,name,passCode,status
            FROM users
            WHERE email='".$email."'";
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function getUsers($sid){
        $sql="SELECT u.email,u.name,u.deviceType,u.deviceId,u.status,
            ss.name as studentName
            FROM users u
            INNER JOIN school_students ss 
            ON ss.fatherEmail = u.email
            OR ss.motherEmail = u.email
            WHERE ss.studentId='".$sid."'";
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function updateUser($email,$data){
        
        $this->db->where("email",$email);
        $this->db->update("users",$data);
        
        return $this->db->affected_rows();
    }
    
    function getKids($email){
        
        $sql="SELECT s.schoolId,s.schoolName,s.implementationType,
            sd.standard,sd.section,
            ss.studentId,ss.admissionNo,ss.name,ss.photo
            FROM school_students ss
            INNER JOIN student_details sd
            ON sd.studentId=ss.studentId
            INNER JOIN schools s 
            ON ss.schoolId=s.schoolId
            WHERE ss.fatherEmail='".$email."'
            OR ss.motherEmail='".$email."'    
            ";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function getKidTravel($studentId,$travelDate,$travelType){
        
        $sql="SELECT s.schoolName,ss.studentId,ss.admissionNo,
            ss.name,sd.standard,sd.section,ss.photo,
            sf.staffId,sf.firstName,sf.lastName,sf.phone,
            td.travelType,td.travelDate,
            td.inTime,td.outTime,
            td.inLocation,td.outLocation
            FROM school_students ss
            INNER JOIN travel_details td
            ON ss.studentId=td.studentId
            INNER JOIN student_details sd
            ON sd.studentId=ss.studentId
            INNER JOIN staffs sf
            ON sf.staffId=td.staffId
            INNER JOIN schools s
            ON s.schoolId=ss.schoolId
            WHERE td.studentId=$studentId
            AND td.travelDate='".$travelDate."'  
            AND td.travelType='".$travelType."'
            ";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function getStudent($studentId){
        
        $sql="SELECT s.schoolName,ss.studentId,ss.admissionNo,
            ss.name,sd.standard,sd.section,ss.photo
            FROM school_students ss
            INNER JOIN student_details sd
            ON sd.studentId=ss.studentId
            INNER JOIN schools s
            ON s.schoolId=ss.schoolId
            WHERE ss.studentId=$studentId
            ";
        
        $query=  $this->db->query($sql);
        
        return $query;
        
    }
    
    /*
     * Attendance
     */
    
    function getStudentAttendance($sid, $from, $to,$limit){
        
        $sql = "SELECT max(a.attendanceId) as attendanceId,
            a.studentId,ss.photo,ss.name, 
            MAX(a.logDate) as logDate 
            FROM attendance a 
            INNER JOIN school_students ss 
            ON a.studentId = ss.studentId 
            WHERE a.studentId=$sid AND a.logDate 
            BETWEEN '".$from."' AND '".$to."' 
            GROUP BY date(a.logDate)
            ORDER BY max(a.logDate) DESC ";
        if ($limit!=""){
            $sql .= "LIMIT $limit";
        }
        
        $query=  $this->db->query($sql);
        
        return $query;
        
    }
    
    function getTotalAttendance($sid,$from,$to){
        
        $sql = "SELECT a.attendanceId as attendanceId,a.logType,
            a.studentId,a.logDate
            FROM attendance a 
            WHERE a.studentId=$sid
            AND a.logType='ENTRY' 
            AND a.attendance='PRESENT'
            AND a.logDate 
            BETWEEN '".$from."' AND '".$to."' 
            GROUP BY date(a.logDate)
            ORDER BY max(date(a.logDate)) DESC ";
        
        $query=  $this->db->query($sql);
        
        return $query;
        
        
    }
    
    function getAttendance($sid,$dt){
        
        $sql = "SELECT a.attendanceId,a.attendance,a.notes,a.logDate,a.logType 
            FROM (SELECT studentId,max(logDate) as logDate,logType 
            FROM attendance a 
            WHERE a.studentId= $sid
            AND date(a.logDate) = '$dt' 
            GROUP BY a.logType) as da 
            INNER JOIN attendance a 
            ON a.studentId = da.studentId 
            AND a.logDate = da.logDate";
        
//        $sql = "SELECT max(a.attendanceId)as attendanceId,
//            a.attendance,a.notes,a.logType,max(a.logDate)as logDate
//            FROM attendance a
//            WHERE a.studentId= $sid
//            AND date(a.logDate) = '$dt' 
//            GROUP BY date(a.logDate),a.logType ";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    function saveAttendance($data){
        
        $result = 0;
        
        $attendanceId = $data['attendanceId'];
        
        if($attendanceId!="0"){
            
            unset($data['attendanceId']);
            
            $this->db->where("attendanceId",$attendanceId);
            
            $this->db->update("attendance",$data);
            
            $result = $this->db->affected_rows();
            
        } else {
            
            if($data['attendance']=="ABSENT"){
                
                $result = 1;
                
            } else {
                
                $this->db->insert("attendance",$data);
                
                $result = $this->db->affected_rows();
                
            }
            
            return $result;
            
        }
        
        
        return $result;
        
    }
    
    /*
     * Notifications
     */
    
    function getNotifications($studentId,$from,$to,$limit){
        
        $sql = "SELECT *
            FROM notifications
            WHERE studentId= $studentId ";
        
        if($from!=""){
            
            $sql.="AND sentDate BETWEEN
            '".$from."' AND '".$to."'";
            
        }
         
        $sql.="ORDER BY sentDate DESC ";
        
        
        if($limit!=""){
            
            $sql.="LIMIT $limit";
            
        }
            
           
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    function saveNotification($data){
        
        $this->db->insert("notifications",$data);
        
        return $this->db->affected_rows();
    }
    
    
    /*
     * Messages
     */
    
    function getMessages($studentId,$from,$to,$limit){
        
        $sql = "SELECT *
            FROM messages
            WHERE studentId= $studentId ";
        
        if($from!=""){
            
            $sql.="AND sentDate BETWEEN
            '".$from."' AND '".$to."'";
            
        }
         
        $sql.="ORDER BY sentDate DESC ";
        
        
        if($limit!=""){
            
            $sql.="LIMIT $limit";
            
        }
            
           
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    function saveMessage($data){
        
        $messageId = $data['messageId'];
        
        if($messageId!=""){
            
            $this->db->where("messageId",$messageId);
            
            $this->db->update("messages",$data);
            
        } else {
            
            unset($data['messageId']);
            
            $this->db->insert("messages",$data);
            
        }
        
        return $this->db->affected_rows();
    }
    
    
}