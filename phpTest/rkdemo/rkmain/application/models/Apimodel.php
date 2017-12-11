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
     * Gets otp setup
     *
     * @param      settingdId
     * @return     otp
     */
	function otpUpdate($email,$otpcode){
        
        $sql="UPDATE users SET otp='".$otpcode."' WHERE email = '".$email."'";
        $query=$this->rk->query($sql);

        return $otpcode;
	}
	
    
    /**
     * Gets admin setting for email smtp
     *
     * @param      settingdId
     * @return     query string
     */
    function getSettings($id){
        
        $this->db->where("settingId",$id);
        $this->db->where("status",1);
        
        $result = $this->db->get("admin_settings");
        
        return $result;
        
    }
    
    /**
     * Creates a password for user 
     *
     * @param       None
     * @return     affested rows
     */
    function createPassCodes(){
        
        $sql = "SELECT * FROM users 
            WHERE email!=''";
        
        $query = $this->db->query($sql);
        
        foreach ($query->result() as $rowUser){
            
            $passCode = random_string('numeric', 6);
            
            $data = array(
                "email"=>$rowUser->email,
                "passCode" =>$passCode
            );
            $this->db->where("userId",$rowUser->userId);
            $this->db->update("users",$data);
            
        }
        
        return $this->db->affected_rows();
        
    }
    
    /**
     * Gets email template to be send for user
     *
     * @param       Template id
     * @return     query string
     */
    function getEmailTemplate($id){
        
        $this->db->where("templateId",$id);
        $this->db->where("status",1);
        
        $result = $this->db->get("email_templates");
        
        return $result;
        
    }
    
    
    /**
     * finds user email Id using schoolId
     *
     * @param       SchoolId
     * @return      query string
     */
    function getUsersEmail($schoolId){
        
        $sql = "SELECT u.userId,u.email,u.name,u.passCode,u.status,u.phone
            FROM users u 
            INNER JOIN user_schools us 
            ON u.email = us.email 
            WHERE us.schoolId=$schoolId
            AND u.status=1";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    /**
     * Gets emails pending to be send
     *
     * @param       sentId,status,schoolId
     * @return      query string
     */
    function getMail($id,$status,$schoolId){
        
        if($id!=""){
            
            $this->db->where("sentId",$id);
            
        }
       
        $this->db->where("status",$status);
        $this->db->where("schoolId",$schoolId);
        
        $result = $this->db->get("sent_email");
        
        return $result;
        
    }

    /**
     * Gets msges pending to be send
     *
     * @param       msgId,status,schoolId
     * @return      query string
     */
    function getMsg($id,$status,$schoolId){
        
        if($id!=""){
            
            $this->db->where("msgId",$id);
            
        }
       
        $this->db->where("status",$status);
        $this->db->where("schoolId",$schoolId);
        
        $result = $this->db->get("sent_msg");
        
        return $result;
        
    }
    
    /**
     * Saves mail to be send
     *
     * @param       data
     * @return      affested rows
     */
    function sentMail($data){

        $this->db->where("email",$data['email']);
        $this->db->where("schoolId",$data['schoolId']);
        $this->db->where("subject",$data['subject']);
        $query=$this->db->get("sent_email");
        if($query->num_rows()<1)
        {
            $this->db->insert("sent_email",$data);
            return $this->db->affected_rows();
        }
        {
            return 0;
        }
        
    }
    /**
     * Saves msg to be sent
     *
     * @param       data
     * @return      affested rows
     */
    function sentMsg($data){

        $this->db->where("phone",$data['phone']);
        $this->db->where("schoolId",$data['schoolId']);
        $this->db->where("message",$data['message']);
        $query=$this->db->get("sent_msg");
        if($query->num_rows()<1)
        {
            $this->db->insert("sent_msg",$data);
            
            return $this->db->affected_rows();
        }
        else
        {
            return 0;
        }
        
    }
    /**
     * Modifies sent mails
     *
     * @param       data
     * @return      affected rows
     */
    function updateSentMail($data){
        
        $this->db->where("sentId",$data['sentId']);
        
        $this->db->update("sent_email",$data);
        
        return $this->db->affected_rows();
        
    }
    /**
     * Update msges 
     *
     * @param       data
     * @return      affected rows
     */
    function updateSentMsg($data){
        
        $this->db->where("msgId",$data['msgId']);
        
        $this->db->update("sent_msg",$data);
        
        return $this->db->affected_rows();
        
    }
    
    /*
     * Versions
     */
    
    function getVersion(){
        
        $sql = "SELECT * FROM versions
            WHERE status=1 
            ORDER BY updatedDate DESC LIMIT 1";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    /*
     * Sign In
     */
    
    function signIn($data){
        $email=$data['email'];
        $password=$data['password'];
        $this->db->select("*");
        $this->db->from("staffs st");
        $this->db->join("schools s","st.schoolId=s.schoolId");
        $this->db->where("st.email",$email);
        $this->db->where("st.password",$password);
        $this->db->where("s.status",1);
        $this->db->where("st.status",1);
        $query=$this->db->get();
        $result=$query->num_rows();
        $msg="Email or Password is wrong";
        $staff_data=array();
        if($result>0){
            foreach ($query->result() as $row){
                $students = array();
                $staff_data=array(
                    "staffId"=>$row->staffId,
                    "email" => $row->email,
                    "firstName"=>$row->firstName,
                    "lastName"=>$row->lastName,
                    "phone" => $row->phone,
                    "students"=>$students,
                    "url" => $row->url,
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
    
   /**
     * Gets staff details based on email id
     *
     * @param       email Id
     * @return      query string
     */
    function getStaffDetails($email){
        
        $this->db->where("email",$email);

        $query = $this->db->get("staffs");
        
        return $query;
        
    }
    

    /**
     * Validate user login
     *
     * @param       Email
     * @return      query string
     */
    function userSignin($email){
        
        $sql="SELECT email,name,passCode,status,otp
            FROM users
            WHERE email='".$email."' and status=1";
        $query=  $this->db->query($sql);
        
        return $query;
    }
    
    /**
     * Gets url to be continued next
     *
     * @param       None
     * @return      query string
     */
    function getKidsURLDetails($email)
    {
        $this->db->select("*");
        $this->db->from("user_schools us");
        $this->db->join("schools s","us.schoolId=s.schoolId and s.status=1");
        $this->db->where("us.status",1);
        $this->db->where("us.email",$email);
        $query=$this->db->get();
        return $query;
        
    }
    
    /**
     * Gets parent details using studentId
     *
     * @param      StudentId
     * @return      query string
     */
    function getUsers($sid)
    {
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
    
    /**
     * Update user details
     *
     * @param       email,data
     * @return      affested rows
     */
    function updateUser($email,$data){
        
        $this->db->where("email",$email);
        $this->db->update("users",$data);
        
        return $this->db->affected_rows();
    }

    /**
     * Update staff details
     *
     * @param       email,$data
     * @return      affested rows
     */
    function updateStaff($email,$data){
        
        $this->db->where("email",$email);
        $this->db->update("staffs",$data);
        
        return $this->db->affected_rows();
    }
    /**
     * Save registered school details
     *
     * @param       data
     * @return      query string
     */
    function registerSchool($data)
    {
        $this->db->where("schoolEmail",$data["schoolEmail"]);
        $this->db->where("websiteUrl",$data["websiteUrl"]);
        $query=$this->db->get("registered_schools");
        if($query->num_rows()<1)
        {
            $id=$data['registeredSchoolId'];

            if($id!="")
            {
                $this->db->where("registeredSchoolId",$id);
                $this->db->update("registered_schools",$data);
                $msg="Updated Successfully";
            }
            else
            {
                unset($data['registeredSchoolId']);
                $this->db->insert("registered_schools",$data);
                $id=$this->db->insert_id();
                if($id)
                {
                    $msg="Thank you for registering with us!! we will get back to you as soon as poosible";
                }
                else
                {
                    $msg="Error occur please try again!!";
                }
            }
        }
        else
        {
            $msg="School already added or check your website url and schoolEmail";
        }
        return $msg;
        
    }
    
    
    
    
}
