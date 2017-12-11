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
   function saveLocation($data_location){
        $this->db->insert("vehicle_locations",$data_location);
        return $this->db->affected_rows();
    }
    function getVehicleStudentLocation($sid,$travelType){
        
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
            AND (vs.travelType='DROP' OR vs.travelType='BOTH') ";
        }else{
            $sql.="ON stv.pickupVehicleId=vs.vehicleId 
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
function getLeavesData($studentId)
    {
        //SELECT * FROM `dt_tb` WHERE dt BETWEEN BETWEEN '$dt1' AND '$dt2'
        //$sql="SELECT * FROM `student_leave` WHERE dt BETWEEN BETWEEN fromDate AND toDate and studentId='$studentId' and approvalStatus='ACCEPT'";
        $sql="SELECT * FROM `student_leave` WHERE fromDate<=toDate and studentId='$studentId' and approvalStatus='ACCEPT'";
        $query = $this->db->query($sql);
        return $query;
    }
    
}
