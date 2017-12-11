<?php

    $eventId = "";
    
    $eventName = "";
    
    $details = "";
    
    $eventDate = "";
    
    $eventBanner="";

    $status = 1;
    
    
?>
<div class="col-md-12">
    <!-- BEGIN VALIDATION STATES-->
    <div class="portlet light portlet-fit portlet-form bordered">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-settings font-red"></i>
                <span class="caption-subject font-red sbold uppercase">Add/Edit Event</span>
            </div>
<!--            <div class="actions">
                <div class="btn-group btn-group-devided" data-toggle="buttons">
                    <label class="btn btn-transparent red btn-outline btn-circle btn-sm active">
                        <input type="radio" name="options" class="toggle" id="option1">Actions</label>
                    <label class="btn btn-transparent red btn-outline btn-circle btn-sm">
                        <input type="radio" name="options" class="toggle" id="option2">Settings</label>
                </div>
            </div>-->
        </div>
        <div class="portlet-body">
            <!-- BEGIN FORM-->
            <form action="#" id="eventfrm" class="form-horizontal" enctype= multipart/form-data>
                <div class="form-body">
                    <div class="alert alert-danger display-hide">
                        <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
                    <div class="alert alert-success display-hide">
                        <button class="close" data-close="alert"></button>Event Added Successfully! </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Event Name
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-4">
                            <input type="hidden" name="eventId" class="form-control" />
                            
                            <input type="text" name="eventName" data-required="1" class="form-control" />
                            
                            
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-md-3">Event Date
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-4">
                            
                            <input type="text" name="eventDate" data-required="1" class="form-control date-picker" /> </div>
                    </div>
                    
                    
                    
                    <div class="form-group">
                        <label class="control-label col-md-3">Details
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-4">
                            
                            <textarea class="form-control" name="details"><?php echo $details ?></textarea>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Event banner
                        </label>
                        <div class="col-md-8 dropzone dropzone-file-area" id="image" >
                            <h3 class="sbold">Drop file here or click to upload</h3>
                        </div>
                        <input type="hidden" name="eventBanner"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Status
                            <span class="required"> * </span>
                        </label>
                        <div class="col-md-4">
                            <select class="form-control" name="status">
                                <option value="1">Active</option>
                                <option value="0">In Active</option>
                            </select>
                        </div>
                    </div>                    
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" name="submit" id="submit" class="btn green submit mt-ladda-btn ladda-button" data-style="expand-left" data-spinner-color="#333">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- END FORM-->
        </div>
    </div>
    <!-- END VALIDATION STATES-->
    </div>