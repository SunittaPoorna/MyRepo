<?php
class apimodel extends CI_Model{
    
    public $rk;
    
    public function __construct(){
        
        // Call the CI_Model constructor
        parent::__construct();
        
        $this->load->helper('string');
        
        $this->rk = $this->load->database("rk",TRUE);
        
    }
    /**
     * Gets current academic details
     *
     * @param      date
     * @return     query string
     */
    function getacademic($date)
    {
        $sql="SELECT * from school_academics 
            WHERE startDate<='".$date."' and endDate>='".$date."' and status=1";
        $query = $this->db->query($sql);
        return $query;
    }
    /**
     * Get school details
     *
     * @param      date
     * @return     query string
     */
    function getSchoolDetails()
    {
        $sql="SELECT * from school_details where status=1";
        $query = $this->db->query($sql);
        return $query;
    }
     /**
     * Get school Id
     *
     * @param       user input username and password
     * @return      returns query
     */
    function getSchoolId()
    {
        $schoolDetails=$this->db->get("school_details");
        $this->rk->where("status",1);
        $this->rk->where("email",$schoolDetails->row()->email);
        $this->rk->select("schoolId");
        $schoolId=$this->rk->get("schools");
        return $schoolId->row()->schoolId;
    }
    function createUserSchools($schoolId,$url){
        
        $sql = "SELECT fatherEmail,fatherName,fatherPhone,schoolId 
            FROM school_students 
            WHERE fatherEmail REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$'
            GROUP BY fatherEmail";
        
        $query = $this->db->query($sql);
        
        foreach ($query->result() as $rowUser){
            
            $passCode = random_string('numeric', 6);
            
            $dataUser = array(
                
                "email" => $rowUser->fatherEmail,
                
                "name" => $rowUser->fatherName,
                
                "phone" => $rowUser->fatherPhone,
                
                "passCode" => $passCode,
                
                "status" => 1
                
            );
            
            $this->rk->where("email",$rowUser->fatherEmail);
            
            $result1 = $this->rk->get("users");
            
            if($result1->num_rows()==0){
            
                $this->rk->insert("users",$dataUser);
            
            }
            
            $data = array(
                "schoolId" => $schoolId,
                "email"=>$rowUser->fatherEmail,
                "db"=>"db",
                "url"=>$url,
                "status"=>1
            );
            
            $this->rk->insert("user_schools",$data);
            
        }
        
        $sql2 = "SELECT motherEmail,motherName,motherPhone,schoolId 
            FROM school_students 
            WHERE motherEmail REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' 
            GROUP BY motherEmail";
        
        $query2 = $this->db->query($sql2);
        
        foreach ($query2->result() as $rowUser){
            
            $passCode = random_string('numeric', 6);
            
            $dataUser = array(
                
                "email" => $rowUser->motherEmail,
                
                "name" => $rowUser->motherName,
                
                "phone" => $rowUser->motherPhone,
                
                "passCode" => $passCode,
                
                "status" => 1
                
            );
            
            $this->rk->where("email",$rowUser->motherEmail);
            
            $result2 = $this->rk->get("users");
            
            if($result2->num_rows()==0){
            
                $this->rk->insert("users",$dataUser);
            
            }
            
            $data = array(
                "schoolId" => $schoolId,
                "email"=>$rowUser->motherEmail,
                "db"=>"db",
                "url"=>$url,
                "status"=>1
            );
            
            $this->rk->insert("user_schools",$data);
            
        }
        
        return $this->rk->affected_rows();
        
    }
    
    
   
    /**
     * Gets user details based on email
     *
     * @param      email Id
     * @return     query string
     */
    function getUserDetails($email){
        
        $this->rk->where("email",$email);
        $this->rk->where("status",0);
        $query = $this->rk->get("users");
        
        return $query;
        
    }
    
    /**
     * saves user mobile token
     *
     * @param      settingdId
     * @return     query string
     */
    function saveToken($email,$token){
        
        $this->rk->where("email",$email);
        
        $this->rk->update("users",array(
           
            "deviceId" => $token
            
        ));
        
        return $this->rk->affected_rows();
        
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
    
    /**
     * Gets list of staff students
     *
     * @param      settingdId
     * @return     query string
     */
    function getStaffStudents($staffId){
        $sql="SELECT (SELECT schoolName from school_details) as schoolName,
        (select status from school_details) as schoolStatus,
            ss.studentId,ss.admissionNo,ss.name,ss.photo,
            stc.classId,std.standardName,sec.sectionName,
            ss.fatherName,ss.fatherPhone,
            ss.motherName,ss.motherPhone
            FROM school_students ss 
            INNER JOIN student_classes stc 
            ON ss.studentId = stc.studentId
            INNER JOIN school_classes sc
            ON stc.classId = sc.classId
            INNER JOIN standards std 
            ON std.standardId = sc.standardId
            INNER JOIN sections sec
            ON sec.sectionId = sc.sectionId
            INNER JOIN class_staffs cs
            ON cs.classId = stc.classId
            WHERE cs.staffId=$staffId 
            AND ss.status=1";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }


function getStaffStudentLeaves($staffId){
        $sql="SELECT (SELECT schoolName from school_details) as schoolName, (select status from school_details) as schoolStatus, ss.studentId,ss.heading,ss.reason,ss.details,ss.fromDate,ss.toDate,ss.approvalStatus, stc.classId,std.standardName,sec.sectionName FROM student_leave ss INNER JOIN student_classes stc ON ss.studentId = stc.studentId INNER JOIN school_classes sc ON stc.classId = sc.classId INNER JOIN standards std ON std.standardId = sc.standardId INNER JOIN sections sec ON sec.sectionId = sc.sectionId INNER JOIN class_staffs cs ON cs.classId = stc.classId WHERE cs.staffId=$staffId AND ss.status =1";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    // function getAllStudents($schoolId){
    //     $sql="SELECT s.schoolName,s.status as schoolStatus,
    //         ss.studentId,ss.admissionNo,ss.name,ss.photo,
    //         stc.classId,std.standardName,sec.sectionName,
    //         ss.fatherName,ss.fatherPhone,
    //         ss.motherName,ss.motherPhone
    //         FROM school_students ss 
    //         INNER JOIN student_classes stc 
    //         ON ss.studentId = stc.studentId
    //         INNER JOIN school_classes sc
    //         ON stc.classId = sc.classId
    //         INNER JOIN standards std 
    //         ON std.standardId = sc.standardId
    //         INNER JOIN sections sec
    //         ON sec.sectionId = sc.sectionId
    //         INNER JOIN student_staffs sstf
    //         ON sstf.studentId = ss.studentId
    //         INNER JOIN schools s
    //         ON s.schoolId = ss.schoolId
    //         WHERE s.schoolId=$schoolId ";
        
    //     $query=  $this->db->query($sql);
        
    //     return $query;
    // }
    
    /**
     * gets vehicle students
     *
     * @param      staffId,date,travel type
     * @return     query string
     */
    function getVehicleStudents($sid,$dt,$travelType){
//        $sql="SELECT * FROM staff_students sts 
//            INNER JOIN school_students scs 
//            ON sts.studentId=scs.studentId 
//            INNER JOIN staffs sst 
//            ON sst.staffId=sts.staffId 
//            WHERE sts.staffId=$sid
//            AND sts.assignedDate='".$dt."'";
        
        $sql = "SELECT (SELECT schoolName from school_details) as schoolName,
        (select status from school_details) as schoolStatus,
            ss.studentId,ss.admissionNo,ss.name,ss.photo,
            std.standardName as standard,sec.sectionName as section,
            ss.fatherName,ss.fatherPhone,
            ss.motherName,ss.motherPhone,vs.travelType, 
            vs.assignedDate,vs.vehicleId,vs.staffId,vs.status as staffStatus,
            sv.vehicleId,sv.registrationNo,sv.vehicleNo,ss.vehicleCardNo
            FROM vehicle_staffs vs 
            INNER JOIN student_vehicles stv ";
        if($travelType=="DROP"){
            $sql.="ON stv.dropVehicleId=vs.vehicleId 
            AND date(vs.assignedDate)<='".$dt."' 
            AND (vs.travelType='DROP' OR vs.travelType='BOTH') ";
        }else{
            $sql.="ON stv.pickupVehicleId=vs.vehicleId 
            AND date(vs.assignedDate)<='".$dt."' 
            AND (vs.travelType='PICKUP' OR vs.travelType='BOTH') ";
        }
            $sql.="INNER JOIN school_vehicles sv
            ON sv.vehicleId=vs.vehicleId
            INNER JOIN school_students ss 
            ON ss.studentId=stv.studentId
            INNER JOIN student_classes stc
            ON stc.studentId = stv.studentID
            INNER JOIN school_classes sc
            ON sc.classId = stc.classId
            INNER JOIN standards std 
            ON std.standardId = sc.standardId
            INNER JOIN sections sec
            ON sec.sectionId = sc.sectionId
            WHERE vs.staffId='".$sid ."'
            AND vs.status=1 AND ss.status=1";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    /**
     * Gets travel history
     *
     * @param      staffId,studentId,date,travel type
     * @return     query string
     */
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
    
    /**
     * Gets travel details of student
     *
     * @param      studentId,date,travel type
     * @return     query string
     */
    function getTravelHistory($studentId,$from,$to,$travelType){
        
        $sql="SELECT * FROM travel_details td
             WHERE td.studentId=$studentId
             AND date(travelDate) BETWEEN '".$from."'
             AND '".$to."'    
             AND travelType='".$travelType."'    
             ORDER BY travelDate DESC";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    /**
     * 
     * Gets kids travel details
     * @param      staffId,date,travel type
     * @return     query string
     */
    function getKidTravel($studentId,$travelDate,$travelType){
        
        $sql="SELECT (SELECT schoolName from school_details) as schoolName,
            ss.studentId,ss.admissionNo,
            ss.name,ss.photo,
            sf.staffId,sf.firstName,sf.lastName,sf.phone,
            td.travelType,td.travelDate,
            td.inTime,td.outTime,
            td.inLocation,td.outLocation
            FROM school_students ss
            INNER JOIN travel_details td
            ON ss.studentId=td.studentId
            INNER JOIN staffs sf
            ON sf.staffId=td.staffId
            WHERE td.studentId=$studentId
            AND td.travelDate='".$travelDate."'  
            AND td.travelType='".$travelType."'
            ";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    /**
     * Gets vehicle locations
     *
     * @param      staffId,date,travel type
     * @return     query string
     */
    function getVehicleLocations($sid,$dt,$travelType){
        
        $sql="SELECT * FROM vehicle_locations
             WHERE staffId=$sid 
             AND travelDate >='".$dt."'
             AND travelType ='".$travelType."'    
             ORDER BY travelDate DESC";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    /**
     * Saves travel details of students
     *
     * @param      data
     * @return     affected rows
     */
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
	
    /**
     * Saves travel details
     *
     * @param      data, data locations 
     * @return     affected rows
     */
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
        return $this->db->affected_rows();
    }
//    
//    function delVehicleLocations($sid,$dt,$travelType){
//        
//        $sql="DELETE FROM vehicle_locations
//             WHERE staffId=$sid 
//             AND travelDate >='".$dt."'
//             AND travelType ='".$travelType."'";
//        
//        $query=  $this->db->query($sql);
//        
//        return $this->db->affected_rows();
//    }
//    
//    function delTravelDetails($studentId,$staffId,$dt,$travelType){
//        
//        $sql="DELETE FROM travel_details td
//             WHERE td.studentId=$studentId
//             AND td.staffId=$staffId
//             AND travelDate='".$dt."'
//             AND travelType='".$travelType."'";
//        
//        $query=  $this->db->query($sql);
//        
//        return $this->db->affected_rows();
//    }
//    
    /**
     * Gets student travel details
     *
     * @param      Email
     * @return     query string
     */
    function getStudentTravel($email){
        $sql="SELECT * 
            FROM school_students scs 
            INNER JOIN travel_details td 
            ON scs.studentId=td.studentId 
            WHERE scs.fatherEmail='".$email."'
            AND scs.status=1";
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    /**
     * validate user signIn
     *
     * @param      email
     * @return     query string
     */
    function userSignin($email){
        
        $sql="SELECT email,name,passCode,status
            FROM users
            WHERE email='".$email."'";
        $query=  $this->rk->query($sql);
        
        return $query;
    }
    
    /**
     * Gets user details
     *
     * @param      studentId
     * @return     query string
     */
    function getUsers($sid){
//        $sql="SELECT u.email,u.name,u.deviceType,u.deviceId,u.status,
//            ss.name as studentName
//            FROM users u
//            INNER JOIN school_students ss 
//            ON ss.fatherEmail = u.email
//            OR ss.motherEmail = u.email
//            WHERE ss.studentId='".$sid."'";
        
        $users = array();
        
        $sql="SELECT ss.name,ss.fatherEmail,ss.motherEmail,ss.status
            FROM school_students ss 
            WHERE ss.studentId='".$sid."' AND ss.status=1";
        
        $query=  $this->db->query($sql);
        
        foreach ($query->result() as $row){
            
            if($row->fatherEmail!=""){
            
                $this->rk->where("email",$row->fatherEmail);

                $query1 = $this->rk->get("users");

                if($query1->num_rows()>0){

                    $user['studentName'] = $query->row()->name;

                    $user["email"] = $query1->row()->email;

                    $user["name"] = $query1->row()->name;

                    $user["deviceType"] = $query1->row()->deviceType;

                    $user["deviceId"] = $query1->row()->deviceId;

                    $users[] = $user;

                }
            }
            
            if($row->motherEmail!=""){
            
                $this->rk->where("email",$row->motherEmail);

                $query2 = $this->rk->get("users");

                if($query2->num_rows()>0){

                    $user['studentName'] = $query->row()->name;

                    $user["email"] = $query2->row()->email;

                    $user["name"] = $query2->row()->name;

                    $user["deviceType"] = $query2->row()->deviceType;

                    $user["deviceId"] = $query2->row()->deviceId;

                    $users[] = $user;

                }
            }
            
            
        }
        
        return $users;
    }

    /**
     * Gets user's details based on schoolId
     *
     * @param       schoolId
     * @return      List of users
     */
    function getTotalUsers($schoolId)
    {
        
        $sql = "SELECT us.email,u.deviceType,u.deviceId
            FROM user_schools us 
            INNER JOIN users u
            ON u.email = us.email
            WHERE us.schoolId= $schoolId 
            AND us.status=1";
        
        $query = $this->rk->query($sql);
        
        $users = array();
        
        foreach ($query->result() as $rowUser){
            
           $sql1 = "SELECT (SELECT schoolName from school_details) as schoolName,studentId,name FROM
                school_students
                WHERE fatherEmail='".$rowUser->email."'
                OR motherEmail='".$rowUser->email."'"; 
           
           $query1 = $this->db->query($sql1);
           
           foreach ($query1->result() as $rowUser1){
               
               $users [] = array(
                   
                   "deviceType" => $rowUser->deviceType,
                   "deviceId" => $rowUser->deviceId,
                   "studentId" => $rowUser1->studentId,
                   "schoolName" => $rowUser1->schoolName,
                   "studentName" => $rowUser1->name
                   
               );
               
           }
            
        }
        
        return $users;
        
    }
    
    /**
     * Update user
     *
     * @param      email , data
     * @return     affected rows
     */
    function updateUser($email,$data){
        
        $this->rk->where("email",$email);
        $this->rk->update("users",$data);
        
        return $this->rk->affected_rows();
    }
    
    /**
     * Gets students 
     *
     * @param      email
     * @return     query string
     */
    function getKids($email){
        
        $sql="SELECT (SELECT schoolName from school_details) as schoolName,
            (SELECT implementationType from school_details) as implementationType,
            stc.classId,std.standardName,sec.sectionName,
            ss.studentId,ss.admissionNo,ss.name,ss.photo
            FROM school_students ss
            INNER JOIN student_classes stc 
            ON ss.studentId = stc.studentId
            INNER JOIN school_classes sc
            ON stc.classId = sc.classId
            INNER JOIN standards std 
            ON std.standardId = sc.standardId
            INNER JOIN sections sec
            ON sec.sectionId = sc.sectionId
            WHERE ss.fatherEmail='".$email."'
            OR ss.motherEmail='".$email."'    
            AND ss.status=1";
        
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    
    /**
     * Gets student details 
     *
     * @param      studentId
     * @return     query string
     */
    function getStudent($studentId){
        
        $sql="SELECT (SELECT schoolName from school_details) as schoolName,
            ss.studentId,ss.admissionNo,
            ss.name,stc.classId,std.standardName,sec.sectionName,ss.photo
            FROM school_students ss
            INNER JOIN student_classes stc 
            ON ss.studentId = stc.studentId
            INNER JOIN school_classes sc
            ON stc.classId = sc.classId
            INNER JOIN standards std 
            ON std.standardId = sc.standardId
            INNER JOIN sections sec
            ON sec.sectionId = sc.sectionId
            WHERE ss.studentId=$studentId
            AND ss.status=1";
        
        $query=  $this->db->query($sql);
        
        return $query;
        
    }
    
    /**
     * Gets student attendance
     *
     * @param      staffId,fromdate,todate,row limit
     * @return     query string
     */
    
    function getStudentAttendance($sid, $from, $to,$limit){
        
        $sql = "SELECT max(a.attendanceId) as attendanceId,
            a.studentId,ss.photo,ss.name, 
            MAX(a.logDate) as logDate,a.updatedDate 
            FROM attendance a 
            INNER JOIN school_students ss 
            ON a.studentId = ss.studentId 
            WHERE a.studentId=$sid AND date(a.logDate) 
            BETWEEN '".$from."' AND '".$to."'
            AND ss.status=1 
            GROUP BY date(a.logDate)
            ORDER BY max(a.logDate) DESC ";
        if ($limit!=""){
            $sql .= "LIMIT $limit";
        }
        
        $query=  $this->db->query($sql);
        
        return $query;
        
    }
    
     /**
     * Gets complete student attendance
     *
     * @param      staffId,fromdate,todate,row limit
     * @return     query string
     */
    function getTotalAttendance($sid,$from,$to){
        
        $sql = "SELECT a.attendanceId as attendanceId,a.logType,
            a.studentId,a.logDate
            FROM attendance a 
            WHERE a.studentId=$sid
            AND a.logType='ENTRY' 
            AND a.attendance='PRESENT'
            AND date(a.logDate) 
            BETWEEN '".$from."' AND '".$to."' 
            GROUP BY date(a.logDate)
            ORDER BY max(date(a.logDate)) DESC ";
        
        $query=  $this->db->query($sql);
        
        return $query;
        
        
    }
    
     /**
     * Gets student attendance for particular date
     *
     * @param      studentId,date
     * @return     query string
     */
    function getAttendance($sid,$dt){
        
        $sql = "SELECT a.attendanceId,a.attendance,a.notes,a.logDate,a.logType,a.updatedDate 
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

    /**
     * Gets student attendance for particular date
     *
     * @param      studentId,date
     * @return     query string
     */
    function checkAttendance($dt){
        
        $sql = "SELECT a.attendanceId 
            FROM attendance a 
            WHERE date(a.logDate) = '$dt'";
        
//       
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
     /**
     * Saves student attendance
     *
     * @param      data
     * @return     query string
     */
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

    /**
     * Saves staff attendance
     *
     * @param      data
     * @return     query string
     */
    function saveStaffAttendance($data)
    {
        
        $result = 0;  
        $this->db->where("staffId",$data['staffId']);
        $this->db->where("date(logDate)", date("Y-m-d",strtotime($data["logDate"])));
        $this->db->where("logType",$data['logType']);
        $query=$this->db->get("staff_attendance");
        if($query->num_rows()>0)
        {
            $result=0;
        }
        else
        {      
            $this->db->insert("staff_attendance",$data);
            $result = $this->db->affected_rows();
        }        
        return $result;
                
    }
    
    /*
     * Notifications
     */
    
    function getNotifications($studentId,$from,$to,$limit){
        
        $sql = "SELECT *
            FROM notifications ";
        
        if($from!=""){
            
            $sql.="WHERE date(sentDate) BETWEEN
            '".$from."' AND '".$to."'";
            
        }
         
        $sql.="ORDER BY sentDate DESC ";
        
        
        if($limit!=""){
            
            $sql.="LIMIT $limit";
            
        }
            
           
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    /**
     * Saves notifications
     *
     * @param      data
     * @return     affected rows
     */
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
            
            $sql.="AND date(sentDate) BETWEEN
            '".$from."' AND '".$to."'";
            
        }
         
        $sql.="ORDER BY sentDate DESC ";
        
        
        if($limit!=""){
            
            $sql.="LIMIT $limit";
            
        }
            
           
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    /**
     * Saves messages
     *
     * @param      data
     * @return     affected rows
     */
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
    
    /*
     * Diary
     */
    
    /**
     * gets full events details
     *
     * @param      data
     * @return     query string
     */
    function getEvents($id){
        
        $sql = "SELECT * 
            FROM diary_events
            WHERE academicId=$id
            ORDER BY eventDate ASC";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    // --------------------------------------------------------------------

    /**
     * Get Event banners based on EventId
     *
     * @param       Int eventId
     * @return      query result
     */
    function getEventBanners($eventId){
        
        $sql = "SELECT *
            FROM diary_event_banners eb
            WHERE eb.eventId=$eventId AND eb.status=1";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    /*
     * Daily Time Table
     */
    
    function getDailyTimeTable($cid,$id){
        
        $sql = "SELECT * 
            FROM time_table_classes
            WHERE classId=$cid
            AND academicId=$id AND status=1";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    /**
     * Get one markscard details based on studentId
     *
     * @param       int $studentId
     * @return      query result
     */
    function getMarkscards($studentId){

        $sql = "SELECT markscardId,marksCard,examType
                FROM student_marks_card          
                WHERE studentId = $studentId AND status=1";

        return $this->db->query($sql);

    }
    /*Leave*/
   
    /**
     * Get leave 
     *
     * @return      returns the result as query
     */
    function getLeaves($studentId)
    {

        $sql = "SELECT sl.leaveId,sl.reason,
            sl.details,DATE_FORMAT(sl.fromDate, '%d-%m-%Y') as fromDate, 
            DATE_FORMAT(sl.toDate, '%d-%m-%Y') as toDate,sl.approvalStatus,
            sl.status, sl.studentId
            FROM student_leave sl
            WHERE sl.studentId=$studentId
            ORDER BY sl.leaveId DESC";

        return $this->db->query($sql);

    }
    /*Leave*/
   
    /**
     * Get leave data 
     *
     * @return      returns the result as query
     */
	  function getLeavedata($staffId,$classId)
	    {

		$sql = "SELECT student_leave.heading,student_leave.reason,student_leave.details,student_leave.fromDate,student_leave.toDate,student_staffs.studentId,student_staffs.staffId, student_classes.studentId,student_classes.classId
			FROM student_leave
			JOIN student_classes ON student_leave.studentId = student_classes.studentId
			JOIN student_staffs ON student_classes.studentId = student_staffs.studentId WHERE student_staffs
			.staffId=$staffId AND student_classes
			.classId=$classId";

		return $this->db->query($sql);

	    }


    /**
     * Save save or update marks card details
     *
     * @param       Int markscardId,studentId,examType
     * @return      query result
     */
    function saveLeave($data){
        $leaveId = $data['leaveId'];

        if($leaveId!=""){

            $this->db->where("leaveId",$leaveId);

            $this->db->update("student_leave",$data);

        } else {
            unset($data['leaveId']);
            $this->db->insert("student_leave",$data);

            $leaveId = $this->db->insert_id();

        }

        return $leaveId;;

    }
    /**
     * Update leave
     *
     * @param       array data
     * @return      query result
     */
    function updateLeave($data){

     $leaveId=$data['id'];
     unset($data['id']);
     $this->db->where("leaveId",$leaveId);
     $this->db->update("student_leave",$data);
     return $leaveId;

    }

    /**
     * save reader alert
     *
     * @param       array data
     * @return      query result
     */
    function saveReaderAlert($heading,$msg,$date,$time)
    {
        $this->db->where("date",$date);
        $this->db->where("time",$time);
        $query=$this->db->get("reader_alert");
        if($query->num_rows()>0)
        {
            return 1;
        }
        else
        {
            $data=array("heading"=>$heading,"message"=>$msg,"date"=>$date,"time"=>$time);
            $this->db->insert("reader_alert",$data);
            return 1;
        }
    }
    
}
