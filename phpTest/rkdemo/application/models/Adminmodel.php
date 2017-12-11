<?php
class adminmodel extends CI_Model{
    
    //public $rk;
    
    public function __construct()
    {    
        // Call the CI_Model constructor
        parent::__construct();
        
        //$this->rk = $this->load->database("rk",TRUE);
        
    }

    /**
     * Gets events based on academic
     *
     * @param       Int studentId,date $from,date $to,limit
     * @return      query result
     */
    function getEvents(){
        
        $sql = "SELECT e.eventId,e.eventName,e.details,
            e.eventDate,e.status
            FROM diary_events e
            WHERE e.status!=-1
            ORDER BY e.eventDate ASC";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    // --------------------------------------------------------------------

    /**
     * Gets Event based on EventId
     *
     * @param       Int eventId
     * @return      query result
     */
    function getEvent($eventId){
        
        $sql = "SELECT *
            FROM diary_events e
            WHERE e.eventId=$eventId";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    function deleteBanner($data)
    {
        $this->db->where("eventId",$data['id']);
        $this->db->where("bannerImage",$data['image']);
        $this->db->delete("diary_event_banners");
        return $this->db->affected_rows();
    }

    // --------------------------------------------------------------------

    /**
     * Gets Event based on EventId
     *
     * @param       Int eventId
     * @return      query result
     */
    function getEventBanner($eventId){
        
        $sql = "SELECT *
            FROM diary_event_banners eb
            WHERE eb.eventId=$eventId";
        
        $query = $this->db->query($sql);
        
        return $query;
        
    }
    
    // --------------------------------------------------------------------

    /**
     * Save event or update event details
     *
     * @param       Int studentId,date $from,date $to,limit
     * @return      query result
     */
    function saveEvent($data)
    {
        
        $eventId = $data['eventId'];

        unset($data['eventId']);
        $image=$data['eventBanner'];
        $images=explode(",",$image);
        unset($data['eventBanner']);
        
        if($eventId!=""){

            $this->db->where("eventId",$eventId);

            $this->db->update("diary_events",$data);
            foreach ($images as $pic) 
            {
                if($pic!="")
                {
                    $this->db->where("eventId",$eventId);
                    $this->db->where("bannerImage",$pic);
                    $query=$this->db->get("diary_event_banners");
                    if($query->num_rows()<1)
                    {
                        $imgdata=array(
                            "eventId"=>$eventId,
                            "bannerImage"=>$pic,
                            "status"=>1);
                        $this->db->insert("diary_event_banners",$imgdata);
                    }
                }
            }


        } else {

            $this->db->insert("diary_events",$data);

            $eventId = $this->db->insert_id();
            foreach ($images as $pic) 
            {
                if($pic!="")
                {
                    $imgdata=array(
                        "eventId"=>$eventId,
                        "bannerImage"=>$pic,
                        "status"=>1);
                    $this->db->insert("diary_event_banners",$imgdata);
                }
            }

        }

        return $eventId;
        
    }
    
    
     /*
     * Notifications
     */
    
//    function getNotifications($academicId){
//        
//        $sql = "SELECT e.notificationId,e.notificationName,e.details,
//            e.notificationDate,e.status
//            FROM notifications e
//            WHERE e.academicId=$academicId";
//        
//        $query = $this->db->query($sql);
//        
//        return $query;
//        
//    }
    // --------------------------------------------------------------------
}
