<?php

/**
 * Students Class
 *
 * @package     Rakshakids
 * @subpackage  Admin
 * @category    Students
 * @author      Nalini
 * @link        Https://www.rakshakids.com
 */
class Students extends CI_Controller{
    
    function __construct(){
            parent::__construct();
            $this->load->model("adminmodel","",true);
            if($this->session->userdata('rk_adminid')==null){ // Function to check Session is set or not    
                    if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH'])=='xmlhttprequest')
                    {
                            $value=array(
                                    'session'=>'false'
                            );          
                            echo json_encode($value);
                            exit();
                    }else{
                            redirect('login');
                    }
            }
            $this->admin->nocache(); 
            
        $this->load->library('csvimport');
        $this->rdb="";
    }

    /**
     * Loads students page
     *
     * @param       None
     * @return     View page
     */
    function index()
    {
        $uid=$this->session->userdata("rk_adminid");
        $data['title']="Raksha Kids Admin | Dashboard";
        $data['sidemenu']=$this->load->view("sidemenuview",$data,true);
        $data['schoolsQ'] = $this->adminmodel->getSchools();
        $data['content']=$this->load->view('students/schoolstudents', $data,true);
//        $email = 'laira.reebayahoo.in';
//        if(filter_var($email,FILTER_VALIDATE_EMAIL)){
//        echo "This ($email) email address is considered valid.\n";
//        }
//        else {
//          log_message('error','invalid mail',false );
//        }
        $this->load->view("headerbodyview",$data);
    }

    /**
     * Dynamic db load
     *
     * @param       None
     * @return     View page
     */    

    function setDb($db)
    {
        
        $config['hostname'] = 'rk-dev.cpsuy7weyndq.us-west-2.rds.amazonaws.com';
        $config['username'] = 'admin';
        $config['password'] = 'admin123';
        $config['database'] = $db;
        $config['dbdriver'] = 'mysqli';
        $config['dbprefix'] = '';
        $config['pconnect'] = FALSE;
        $config['db_debug'] = TRUE;
        $config['cache_on'] = FALSE;
        $config['cachedir'] = '';
        $config['char_set'] = 'utf8';
        $config['dbcollat'] = 'utf8_general_ci';
        
        $this->rdb=$this->load->database($config,TRUE);
        return $this->rdb;
    }

    /**
     * check for current academic data is there or not
     *
     * @param       None
     * @return     View page
     */
    function getAcademic($rdb)
    {
        $academicId="";
        $this->date=$this->admin->getCustomDate("%Y-%m-%d",now());
        $query=$this->adminmodel->getacademic($this->date,$rdb);
        if($query->num_rows()>0)
        {
            foreach($query->result() as $val)
            {
                $startDate=$val->startDate;
                $academicId=$val->academicId;
            }
        }
        return $academicId;
    }

    /**
     * Loads students list
     *
     * @param       None
     * @return     View page
     */
    function getStudents()
    {
        $schoolId=$this->input->get_post("id");
        $academicId="";
        if($schoolId!=0)
        {
            $schoolQ=$this->adminmodel->getSchool($schoolId);
            $this->rdb=$this->setDb($schoolQ->row()->db);
            $data['rdb']=$this->rdb;
            $data['schoolId']=$schoolId;
            $data['schoolName']=$schoolQ->row()->schoolName;
            $data['noOfStudents']=$schoolQ->row()->noOfStudents;
            $str=$this->load->view('students/studentsview', $data,true);
            $academicId=$this->getAcademic($this->rdb);
        }
        else
        {
            $str="";
        }
       
        $value = array(
            
            "str"=>$str,
            "academicId"=>$academicId
        );
        
        echo json_encode($value);

    }

    /**
     * Imports students basic details to database
     *
     * @param       None
     * @return     View page
     */
    function importCsv()
    {
        $error=0;
        $schoolId=$this->input->get_post("schoolId");
        $schoolQ=$this->adminmodel->getSchool($schoolId);
        $this->rdb=$this->setDb($schoolQ->row()->db);
        $academicId=$this->getAcademic($this->rdb);
        $data['students'] = $this->adminmodel->get_studentDetails($this->rdb);
        $data['error'] = '';
        $config['upload_path'] = './assets/';
        $config['allowed_types'] = 'csv';
        $config['max_size'] = '1000';
        $this->load->library('upload', $config);

        if (!$this->upload->do_upload()) {
            $data['error'] = $this->upload->display_errors();
            $error=1;
            $msg="No file found";
        } else {
            $file_data = $this->upload->data();
            $file_path = './assets/' . $file_data['file_name'];

            if ($this->csvimport->get_array($file_path)) 
            {
                $csv_array = $this->csvimport->get_array($file_path);
                $i=0;
                
                foreach ($csv_array as $row) 
                {

                    $flag=0;
                    
                    if ($row['AdmissionNo*'] != "") 
                    {
                        $insertData['admissionNo'] = $row['AdmissionNo*'];
                    } 
                    else 
                    {
                        $flag=1;
                        $insertData['admissionNo']="";
                        log_message('error', 'Empty admissionNo in row '.$i, false);
                    }
                    if ($row['FirstName*'] != "") 
                    {
                        $insertData['Name'] = $row['FirstName*'];
                    } 
                    else 
                    {
                        $flag=1;
                        $insertData['Name'] = "";
                        log_message('error', 'Empty firstname in row '.$i, false);
                    }
                    if ($row['LastName*'] != "") 
                    {
                        $insertData['Name'] .= " ".$row['LastName*'];
                    } 
                    else 
                    {

                        $insertData['Name'] .="";
                        log_message('error', 'Empty lastname in row '.$i, false);
                    }
                    if ($row['Standard*'] != "") 
                    {
                       
                        $standardData['standardName'] = $row['Standard*'];
                        $standardData['status'] = 1;
                    } 
                    else 
                    {
                        $flag=1;
                        $standardData['standardName']="";
                        $standardData['status'] = 1;
                        log_message('error', 'Empty standard in row '.$i, false);
                    }
                    if ($row['Section*'] != "") 
                    {
                        $sectionData['sectionName'] = $row['Section*'];
                        $sectionData['status'] = 1;
                    } 
                    else 
                    {
                        $flag=1;
                        $sectionData['sectionName'] = "";
                        $sectionData['status'] = 1;
                        log_message('error', 'Empty section in row '.$i, false);
                    }

                    if ($row['FatherName*'] != "") 
                    {
                        $insertData['fatherName'] = $row['FatherName*'];
                    } 
                    else 
                    {
                        $flag=1;
                        $insertData['fatherName'] = "";
                        log_message('error', 'Empty Father Name in row '.$i, false);
                    }
                    if ($row['FatherEmail*'] != "" and filter_var($row['FatherEmail*'], FILTER_VALIDATE_EMAIL)) 
                    {
                        $insertData['fatherEmail'] = $row['FatherEmail*'];
                    } 
                    else 
                    {
                        $flag=1;
                        $insertData['fatherEmail'] ="";
                        log_message('error', 'Invalid Father Email in row '.$i, false);
                    }
                    
                    if ($row['FatherPhone*'] != "" and preg_match("([0-9]{10})", $row['FatherPhone*'])) 
                    {
                        $insertData['fatherPhone'] = $row['FatherPhone*'];
                    } 
                    else 
                    {
                        $flag=1;
                        $insertData['fatherPhone']="";
                        log_message('error', 'Invalid Father phone number in row '.$i, false);
                    }
                    if ($row['MotherName'] != "") 
                    {
                        $insertData['motherName'] = $row['MotherName'];
                    } 
                    else 
                    {
                        $insertData['motherName']="";
                        log_message('error', 'Empty Mother name in row '.$i, false);
                    }
                    if ($row['MotherEmail'] != "" and filter_var($row['MotherEmail'], FILTER_VALIDATE_EMAIL)) 
                    {
                        $insertData['motherEmail'] = $row['MotherEmail'];
                    } 
                    else 
                    {
                        $insertData['motherEmail']="";
                        log_message('error', 'Invalid Mother Email in row '.$i, false);
                    }
                        
                    if ($row['MotherPhone'] != "" and preg_match("([0-9]{10})", $row['MotherPhone'])) 
                    {
                        $insertData['motherPhone'] = $row['MotherPhone'];
                    } 
                    else 
                    {
                        $insertData['motherPhone'] ="";
                        log_message('error', 'Invalid Mother phone number in row '.$i, false);
                    }
                       
                    if ($row['Photo*'] != "") 
                    {
                        $insertData['photo'] = $row['Photo*'];
                    } 
                    else 
                    {
                        $flag=1;
                        $insertData['photo']="";
                        log_message('error', 'Empty photo field in row '.$i, false);
                    }

                    if($flag!=1)
                    {
                        $studentId=$this->adminmodel->insertStudents($insertData,$this->rdb);
                        
                        $sectionId=$this->adminmodel->insertSection($sectionData,$this->rdb);
                        $standardId =  $this->adminmodel->insertStandard($standardData,$this->rdb);
                        $classData=array(
                            "standardId"=>$standardId,
                            "sectionId"=>$sectionId,
                            "status"=>1);
                        $classId =  $this->adminmodel->insertClass($classData,$this->rdb);
                        $studentData=array(
                            "studentId"=>$studentId,
                            "classId"=>$classId,
                            "academicId"=>$academicId,
                            "status"=>1);
                        $studentClass =  $this->adminmodel->insertStudentClass($studentData,$this->rdb);
                        $userData=array(
                            "email"=>$insertData['fatherEmail'],
                            "name"=>$insertData['fatherName'],
                            "phone"=>$insertData['fatherPhone'],
                            "passCode"=>mt_rand(100000,999999),
                            "status"=>1);
                        $userId=  $this->adminmodel->insertUser($userData);
                        $userSchool= array(
                            "email"=>$insertData['fatherEmail'],
                            "schoolId"=>$schoolId,
                            "status"=>1);
                        $mappingId=  $this->adminmodel->insertUserSchool($userSchool);
                    }
                    else
                    {
                        $error=1;
                    }
                    $i++;
                }
                if($error==0 and $studentId)
                {
                   

                
                    $msg='Csv Data Imported Succesfully';
                }
                else
                {
                    $msg="Some errors occured while import!!, check log folder for more information";
                }
                // $this->session->set_flashdata('success', 'Csv Data Imported Succesfully');
                // redirect(base_url() . 'csv');
                // $this->load->view('csvIndexView', $data);
            }
            else
            {
                $msg= "Error occured";
                $error=1;
            }
            
        }
        $value=array("result"=>$error,"msg"=>$msg);
            echo json_encode($value);
    }

    /**
     * Send messages and mails to the students parents email id
     *
     * @param       None
     * @return     View page
     */
    function sendMailMsg()
    {

        
        $result=0;
        $result1=0;
        $schoolId=$this->input->get_post("schoolId");
        $mailCount=$this->input->get_post("emailCount");
        $msg=$this->input->get_post("msg");
        if($msg)
        {
            $msgCount=$mailCount;
        }
        else
        {
            $msgCount=$this->input->get_post("msgCount");         
        }
        $templateId=$this->input->get_post("templateId");
        $url="https://www.rakshakids.com/rk/rkmain/api/saveToSendEmail/?schoolId=$schoolId&templateId=$templateId";
                    $ch = curl_init();

                    // set URL and other appropriate options
                    curl_setopt($ch, CURLOPT_URL, $url);
                    curl_setopt($ch, CURLOPT_HEADER, 0);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_exec($ch);                                 
                    curl_close($ch);
        $url="https://www.rakshakids.com/rk/rkmain/api/sendEmail/?schoolId=$schoolId&count=$mailCount";
        $ch = curl_init();

        // set URL and other appropriate options
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        if(curl_exec($ch))
        {
            $result=1;
        }                                 
        curl_close($ch);
        $url="https://www.rakshakids.com/rk/rkmain/api/sendMsg/?schoolId=$schoolId&count=$msgCount";
        $ch = curl_init();

        // set URL and other appropriate options
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        if(curl_exec($ch))
        {
            $result1=1;
        }                                 
        curl_close($ch);
        $value=array("mail"=>$result,"msg"=>$result1);
        echo json_encode($value);
    }
        
        
}

