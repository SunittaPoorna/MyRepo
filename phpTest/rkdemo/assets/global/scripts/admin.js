/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var Dashboard = function()//Loads dash board content styles and helps on actions in dashboard page
{

    return {

        
        initSparklineCharts: function() {
            
            if (!jQuery().sparkline) {
                return;
            }
            $("#sparkline_bar").sparkline([8, 9, 10, 11, 10, 10, 12, 10, 10, 11, 9, 12, 11, 10, 9, 11, 13, 13, 12], {
                type: 'bar',
                width: '100',
                barWidth: 5,
                height: '55',
                barColor: '#35aa47',
                negBarColor: '#e02222'
            });

            $("#sparkline_bar2").sparkline([9, 11, 12, 13, 12, 13, 10, 14, 13, 11, 11, 12, 11, 11, 10, 12, 11, 10], {
                type: 'bar',
                width: '100',
                barWidth: 5,
                height: '55',
                barColor: '#ffb848',
                negBarColor: '#e02222'
            });

            $("#sparkline_bar5").sparkline([8, 9, 10, 11, 10, 10, 12, 10, 10, 11, 9, 12, 11, 10, 9, 11, 13, 13, 12], {
                type: 'bar',
                width: '100',
                barWidth: 5,
                height: '55',
                barColor: '#35aa47',
                negBarColor: '#e02222'
            });

            $("#sparkline_bar6").sparkline([9, 11, 12, 13, 12, 13, 10, 14, 13, 11, 11, 12, 11, 11, 10, 12, 11, 10], {
                type: 'bar',
                width: '100',
                barWidth: 5,
                height: '55',
                barColor: '#ffb848',
                negBarColor: '#e02222'
            });

            $("#sparkline_line").sparkline([9, 10, 9, 10, 10, 11, 12, 10, 10, 11, 11, 12, 11, 10, 12, 11, 10, 12], {
                type: 'line',
                width: '100',
                height: '55',
                lineColor: '#ffb848'
            });

            $("#myInput").on("change",function()
            {
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("sample_6");
                tr = table.getElementsByTagName("tr");
                
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                    }          
                }
            });
            $("#myInput1").on("change",function()
            {
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput1");
                filter = input.value.toUpperCase();
                table = document.getElementById("sample_7");
                tr = table.getElementsByTagName("tr");
                
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                    }          
                }
            });
        },

        clearDB : function(){//clear attendace in db section for click action on attendance list
            
//            console.log("Clear");
            
            $(".clearDB").on("click",function(){
                
                $.post("dashboard/clearDB",function(data){
                    
                    if(data.result>0){
                        
                        window.location.reload();
                        
                    } else {
                        
                        alert("Today No Data ");
                        
//                        window.location.reload();
                        
                    }
                    
                },"json");
                
            });
            $(".send").on("click",function(){
                
                $.post("dashboard/clearDB",function(data){
                    
                    if(data.result>0){
                        
                        window.location.reload();
                        
                    } else {
                        
                        alert("Today No Data ");
                        
//                        window.location.reload();
                        
                    }
                    
                },"json");
                
            });
            
        },
         sendNotification : function(){//clear attendace in db section for click action on attendance list
            
//            console.log("Clear");
            
            
            $(".send").on("click",function(){
                
                $.post("dashboard/sendNotification",function(data){
                    
                    if(data.result>0){
                        
                        window.location.reload();
                        
                    } else {
                        
                        alert("Today No Data ");
                        
//                        window.location.reload();
                        
                    }
                    
                },"json");
                
            });
            
        },
        init: function() {
            
            this.clearDB();
            this.sendNotification();

//            this.initJQVMAP();
//            this.initCalendar();
//            this.initCharts();
//            this.initEasyPieCharts();
            this.initSparklineCharts();
//            this.initChat();
//            this.initDashboardDaterange();
//            this.initMorisCharts();
//
//            this.initAmChart1();
//            this.initAmChart2();
//            this.initAmChart3();
//            this.initAmChart4();
//
//            this.initWorldMapStats();
        }
    };

}();

var TableDatatablesManaged = function () {//

    var initTable1 = function (id) {

        var table = $('#'+id);

        // begin first table
        table.dataTable({

            // // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            // "processing": true, //Feature control the processing indicator.
            // "serverSide": true, //Feature control DataTables' server-side processing mode.
        

            // // Load data for the table's content from an Ajax source
            // "ajax": {
            //     "url": "dashboard/ajax_list",
            //     "type": "POST"
            //     },

            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Search:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },

            // Or you can use remote translation file
            //"language": {
            //   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
            //},

            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

            "columnDefs": [ {
                "targets": 0,
                "orderable": true,
                "searchable": false
            }],

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 5,            
            "pagingType": "bootstrap_full_number",
//            
            "order": [
                [0, "asc"]
            ], // set first column as a default sort by asc
            
        });

        var tableWrapper = jQuery('#sample_1_wrapper');

        table.find('.group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).prop("checked", true);
                    $(this).parents('tr').addClass("active");
                } else {
                    $(this).prop("checked", false);
                    $(this).parents('tr').removeClass("active");
                }
            });
        });

        table.on('change', 'tbody tr .checkboxes', function () {
            $(this).parents('tr').toggleClass("active");
        });
       
    }

    

    return {

        //main function to initiate the module
        init: function (id) {
            if (!jQuery().dataTable) {
                return;
            }

            initTable1(id);
        }

    };

}();

var academics = function() 
{
    
    var addEditAcademic = function(){
        
        
        
        $(".addEditAcademic").on("click",function(){
//            console.log("Academic Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("academics/addeditacademic",js,function(data){
                
                if(data.str!==""){
                    
                    $("#academicsdiv").html(data.str);
                    
                    saveAcademic();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        
        
        function saveAcademic(){
            
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#academicfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        academicYear: {
                            required: true
                        },
                        startDate: {
                            required: true
                        },
                        endDate: {
                            required: true
                        },
                        workingDays: {
                            required: true
                        },
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        var status = $("[name=status]").val();
                        var r = confirm("Are you sure? Do you want to deactivate Academic? Admin panel no more work for you after deactivate");
                        if (r == true) 
                        {
                        
                            $.post("academics/save",data,function(data){
                                
                                App.unblockUI();

                                if(data.result > 0){
                                    success1.show();
                                    error1.hide();
                                    window.location.reload();
                                } else {
                                    success1.hide();
                                    error1.show();
                                }   
                                
                            },"json");
                        }
                        else
                        {
                            App.unblockUI();
                        }
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditAcademic();
            
        }
        
    };
    
}();

var designations = function(){
    
    var addEditDesignation = function(){
        
        $(".addEditDesignation").on("click",function(){
//            console.log("Designation Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("designations/addeditdesignation",js,function(data){
                
                if(data.str!==""){
                    
                    $("#designationsdiv").html(data.str);
                    
                    saveDesignation();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        
        
        function saveDesignation(){
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#designationfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        designationName: {
                            required: true
                        },
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("designations/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditDesignation();
            
        }
        
    };
    
}();

var standards = function(){
    
    var addEditStandard = function(){
        
        $(".addEditStandard").on("click",function(){
//            console.log("Standard Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("standards/addeditstandard",js,function(data){
                
                if(data.str!==""){
                    
                    $("#standardsdiv").html(data.str);
                    
                    saveStandard();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        
        
        function saveStandard(){
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#standardfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        standardName: {
                            required: true
                        },
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("standards/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditStandard();
            
        }
        
    };
    
}();


var sections = function(){
    
    var addEditSection = function(){
        
        $(".addEditSection").on("click",function(){
//            console.log("Section Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("sections/addeditsection",js,function(data){
                
                if(data.str!==""){
                    
                    $("#sectionsdiv").html(data.str);
                    
                    saveSection();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        
        
        function saveSection(){
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#sectionfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        sectionName: {
                            required: true
                        },
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("sections/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditSection();
            
        }
        
    };
    
}();

var classes = function(){
    
    var addEditClass = function(){
        
        
        
        $(".addEditClass").on("click",function(){
//            console.log("Academic Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("classes/addeditclass",js,function(data){
                
                if(data.str!==""){
                    
                    $("#classesdiv").html(data.str);
                    
                    saveClass();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        
        
        function saveClass(){
            
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#classfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        standardId: {
                            required: true
                        },
                        sectionId: {
                            required: true
                        },
                        staffId:{
                            required:true
                        }
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("classes/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditClass();
            
        }
        
    };
    
}();

var syllabus = function () {

    var addEditSyllabus = function(){
        
        $(".addEditSyllabus").on("click",function(){
//            console.log("Academic Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("syllabus/addeditsyllabus",js,function(data){

                if(data.str!==""){

                    $("#syllabusdiv").html(data.str);

                    saveSyllabus();
                }

                App.unblockUI();

            },"json");

        });

        
        function saveSyllabus(){
            
            $(".cancel").on("click",function(){

                window.location.reload();

            });

            if($("[name=syllabusId]").val()!="")
            {

                var mockFile = { name: $("[name=syllabus]").val(), size: 12345 };

                console.log("Image "+mockFile.name);

                var myDropzone = new Dropzone('#image', {
                    // addRemoveLinks:true,
                    acceptedFiles : ".pdf,.doc",
                    maxFilesize: 2,
                    maxFiles:1,
                    url: url+"syllabus/saveImage",
                    success : function(file,data){

                        $("[name=syllabus]").val(file.name);

                    }
                    
                });

                // Call the default addedfile event handler
                myDropzone.emit("addedfile", mockFile);

                // And optionally show the thumbnail of the file:
                myDropzone.emit("thumbnail", mockFile, url+"/images/"+mockFile.name);

                myDropzone.emit("complete", mockFile);

                myDropzone.emit("success",function(file,data){

                    console.log(file.name);

                });
                $("[name=syllabus]").val(mockFile.name);

            } else {

                $("div#image").dropzone({
                    url: url+"syllabus/saveImage",
                    acceptedFiles : ".pdf,.doc",
                    maxFilesize: 2,
                    maxFiles:1,
                    sending : function(file, xhr, formData){

                        formData.append("syllabusId",$("[name=syllabusId]").val())

                    },

                    success : function(file,data){

                        $("[name=syllabus]").val(file.name);

                    }
                });

            }

            $(".submit").on("click",function(){

                var form1 = $('#syllabusfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input

                    rules: {
                        classId: {
                            required: true
                        },

                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {

                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });

                        var data = form1.serializeArray();

                        $.post("syllabus/save",data,function(data){

                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }

                        },"json");

                    }
                });
            });

        }

    }

    return {

        init:function(){

            addEditSyllabus();

        }

    };


}();

var timetables = function(){
    
    var addEditTimetable = function(){
        
        
        
        $(".addEditTimetable").on("click",function(){
//            console.log("Academic Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("timetables/addedittimetable",js,function(data){
                
                if(data.str!==""){
                    
                    $("#timetablesdiv").html(data.str);
                    
                    saveTimetable();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        
        
        function saveTimetable(){
            
            
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
            
            if($("[name=timetableId]").val()!="")
            {
                
                var mockFile = { name: $("[name=timeTable]").val(), size: 12345 };
                
                console.log("Image "+mockFile.name);
                
                var myDropzone = new Dropzone('#image', { 
                    maxFilesize: 2, 
                    maxFiles:1,
                    url: url+"timetables/saveImage",
                    success : function(file,data){

                        $("[name=timeTable]").val(file.name);

                    }

                 
                });
                
                // Call the default addedfile event handler
                myDropzone.emit("addedfile", mockFile);

                // And optionally show the thumbnail of the file:
                myDropzone.emit("thumbnail", mockFile, url+"/images/"+mockFile.name);
                
                myDropzone.emit("complete", mockFile);
                
                myDropzone.emit("success",function(file,data){
                    
                    console.log(file.name);
                    
                });
                $("[name=timeTable]").val(mockFile.name); 
            } else {
                
                $("div#image").dropzone({ 
                    url: url+"timetables/saveImage",
                    acceptedFiles : "image/*",
                    sending : function(file, xhr, formData){

                        formData.append("timetableId",$("[name=timetableId]").val())

                    },

                    success : function(file,data){

                        $("[name=timeTable]").val(file.name);

                    }
                });
                
            }
        
            $(".submit").on("click",function(){

                var form1 = $('#timetablefrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        classId: {
                            required: true
                        },
                        timeTable:
                        {
                            required: true
                        }
                        
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("timetables/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditTimetable();
            
        }
        
    };
    
}();

var staffDetails = function(){
    
    var addEditStaff = function(){
        
        $(".addEditStaffDetails").on("click",function(){
//            console.log("Staff Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("staffdetails/addeditstaff",js,function(data){
                
                if(data.str!==""){
                    
                    $("#staffdetailsdiv").html(data.str);
                    
                    saveStaffDetails();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
         $(".manageStaffDetails").on("click",function()
        {
//            console.log("Staff Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("staffdetails/getManageStaffDetails",js,function(data)
            {
                App.unblockUI();
                if(data.str!=="")
                {    
                    $("#staffdetails").html(data.str);
                    
                   
                }

            },"json");
            
        });
        
        
        function saveStaffDetails(){
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#staffdetailsfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    messages: {
                        designationId : {
                            required : "Please select designation"
                        }
                    },
                    rules: {
                        firstName: {
                            minlength: 2,
                            required: true
                        },
                        lastName :{
                            minlength: 2,
                            required: true
                        },
                        staffCode :{
                            required: true
                        },
                        designationId :{
                            required: true
                        },
                        username :{
                            required: true
                        },
                        password :{
                            required: true
                        },
                        confirmPassword :{
                            required: true,
                            equalTo:"[name=password]"
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        address: {
                            required: true,
                        },
                        phone: {
                            required: true,
                        },
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("staffdetails/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditStaff();
            
        }
        
    };
    
}();

var events = function(){
    
    var addEditEvent = function(){
        
        
        
        $(".addEditEvent").on("click",function(){
//            console.log("Event Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("events/addeditevent",js,function(data){
                
                if(data.str!==""){
                    
                    $("#eventsdiv").html(data.str);
                    App.unblockUI();
                    saveEvent();
                }
                
                
                
            },"json");
            
        });
        
        
        
        function saveEvent(){
            
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
            if($("[name=eventId]").val()!="")
            {
                
                var mockFiles = $("[name=eventBanner]").val();
                $("[name=eventBanner]").val(mockFiles);
                if(mockFiles)
                {
                    var existfile = mockFiles.split(',');
                }
                else
                {
                    var existfile={};
                }
                
                var i=0;
                var fileList = new Array;
                var myDropzone = new Dropzone('#image', { 
                    addRemoveLinks:true,
                    dictRemoveFileConfirmation: "Are u sure want to delete?",
                    maxFilesize: 100, 
                    clickable: true,
                    acceptedFiles : ".mp4,.jpg,.gif,.png,.jpeg",
                    //maxFiles:1,
                    url: url+"events/saveImage",
                    success : function(file,data){
                        if(data)
                        {
                            
                            var obj = JSON.parse(data);
                            if(obj.result==1)
                            {
                                fileList[i] = {"serverFileName" : obj.filename, "fileName" : file.name,"fileId" : i };
                                if($("[name=eventBanner]").val())
                                {
                                   var val=$("[name=eventBanner]").val()+",";
                                }
                                else
                                {
                                    var val="";
                                }
                                $("[name=eventBanner]").val(val+obj.filename);
                                i++;
                            }
                            else
                            {
                                alert("You dont have space to save");
                                this.removeFile(file);

                            }
                        }
                        

                    }

                 
                });
                myDropzone.on("removedfile", function(file) 
                {
                        
                       // alert(file.name);
                        
                        mockFiles=res;
                        rmvFile=file.name;
                        for(f=0;f<fileList.length;f++){

                            if(fileList[f].fileName == file.name)
                            {
                                rmvFile = fileList[f].serverFileName;

                            }

                        }
                        var str=$("[name=eventBanner]").val();
                        var res = str.replace(rmvFile, "");
                        $("[name=eventBanner]").val(res);
                        var imageData={image:rmvFile,id:$("[name=eventId]").val()};
                        $.post("events/deleteBanner",imageData,function(data){
                
                            if(data.result>0)
                            {  
                                alert("Image removed successfully");
                            }
                            
                            App.unblockUI();
                            
                        },"json");
                      
                });
                
                for (i = 0; i < existfile.length; ++i) 
                {
                    var mockFile = { name: existfile[i], size: 12345 };
                // Call the default addedfile event handler
                    myDropzone.emit("addedfile", mockFile);

                    // And optionally show the thumbnail of the file:
                    var name=existfile[i].split('.');
                    console.log(name[1]);
                    if(name[1]=="mp4")
                    {
                        fileN=name[0]+".jpg";
                    }
                    else
                    {
                        fileN=existfile[i];
                    }
                    console.log(fileN);
                    myDropzone.emit("thumbnail", mockFile, url+"images/events/thumb/"+fileN);
                    
                    myDropzone.emit("complete", mockFile);
                    
                    myDropzone.emit("success",function(file,data){
                        
                        console.log(file.name);
                        
                    });
                    
                    
                }
                // $('.dz-details').on('click', function()
                //  {
                //     myDropzone.on("thumbnail", function(file, dataUrl) {
                //     $('.dz-image').last().find('img').attr({width: '100%', height: '100%'});
                //     }),
                //     myDropzone.on("success", function(file) {
                //     $('.dz-image').css({"width":"100%", "height":"auto"});
                // })
                //  });
                 
                
            } else {
                 var i=0;
                var fileList = new Array;
                
                $("div#image").dropzone({ 
                    url: url+"events/saveImage",
                    addRemoveLinks:true,
                    
                    maxFilesize:100,
                    acceptedFiles : ".mp4,.jpg,.gif,.png,.jpeg",

                    sending : function(file, xhr, formData){

                        formData.append("eventId",$("[name=eventId]").val())

                    },

                    success : function(file,data){
                        if(data)
                        {

                            var obj = JSON.parse(data);
                            if(obj.result==1)
                            {
                                fileList[i] = {"serverFileName" : obj.filename, "fileName" : file.name,"fileId" : i };
                                if($("[name=eventBanner]").val())
                                {
                                   var val=$("[name=eventBanner]").val()+",";
                                }
                                else
                                {
                                    var val="";
                                }
                                $("[name=eventBanner]").val(val+obj.filename);
                                i++;
                            }
                            else
                            {
                                alert("You dont have space to save, Please contact admin");
                                this.removeFile(file);

                            }
                        }
                        

                    },
                    removedfile: function(file) 
                    {
                        
                      
                        
                       
                        rmvFile=file.name;
                        for(f=0;f<fileList.length;f++){

                            if(fileList[f].fileName == file.name)
                            {
                                rmvFile = fileList[f].serverFileName;
                                

                            }

                        }
                        var str=$("[name=eventBanner]").val();
                                var res = str.replace(rmvFile, "");
                                $("[name=eventBanner]").val(res);
                        var imageData={image:rmvFile,id:$("[name=eventId]").val()};
                        $.post("events/deleteBanner",imageData,function(data){
                            
                           
                            
                        },"json");

                        var _ref;
                        return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                    }
                    
                });
                
            }
        
            $(".submit").on("click",function(){

                var form1 = $('#eventfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        eventName: {
                            required: true
                        },
                        details: {
                            required: true
                        },
                        eventDate: {
                            required: true
                        }
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("events/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditEvent();
            
        }
        
    };
    
}();


var notifications = function(){
    
    var addEditNotification = function(){
        
        
        
        $(".addEditNotification").on("click",function(){
//            console.log("Event Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("notifications/addeditnotification",js,function(data){
                
                if(data.str!==""){
                    
                    $("#notificationsdiv").html(data.str);
                    
                    saveNotification();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        
        
        function saveNotification(){
            
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#notificationfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    
                    rules: {
                        heading: {
                            required: true,
                            maxlength : 30
                        },
                        content: {
                            required: true,
                            maxlength : 160
                        },
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("notifications/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditNotification();
            
        }
        
    };
    
}();

var vehicleDetails = function(){
    
    var addEditVehicle = function(){
        
        $(".addEditVehicleDetails").on("click",function(){
//            console.log("Staff Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("vehicledetails/addeditvehicle",js,function(data){
                
                if(data.str!==""){
                    
                    $("#vehicledetailsdiv").html(data.str);
                    
                    saveVehicleDetails();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        $(".assignstudents").on("click",function(){
//            console.log("Staff Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("vehicledetails/getVehicleStudents",js,function(data){
                
                if(data.str!==""){
                    
                    $("#vehicledetailsdiv").html(data.str);
                    TableDatatablesManaged.init('sample_1');
                    assignStudenttoVehicle();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        function  assignStudenttoVehicle()
        {
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd-M-yyyy',
                });
            }
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
            $('.submit').click(function() 
            {
                var error1 = $('.alert-danger');
                var success1 = $('.alert-success');
               var table = $('#sample_1').DataTable();
                
                var studentIds =table.$('input[type="checkbox"]').serializeArray();
                vehicleId=$("[name=vehicleId]").val();
                assignedDate=$("[name=assignedDate]").val();
                travel=$("input[type=radio]:checked").val();
                //alert(vehicleId);
                var studentId=[];
                for (var i = 0 ; i <studentIds.length; i++) {
                    studentId[i]=studentIds[i].value;
                }
                //alert(studentId);
                if(studentId.length>=1)
                {
                    var data = {'id':vehicleId,'studentId':studentId,'travel':travel,'assignedDate':assignedDate}
                
                    $.post("vehicledetails/assignStudent",data,function(data){
                        
                        if(data.result==1)
                        {
                            success1.show();
                            error1.hide();
                            App.scrollTo(success1, -200);
                                setTimeout(function(){
                                $('.alert-success').slideUp('slow').fadeOut(function() {
                                    window.location.reload();
                                    //  or window.location = window.location.href; 
                                 });
                            }, 300);
                        }
                        else
                        {
                            success1.hide();
                            error1.show();
                            App.scrollTo(error1, -200);
                        }
                        
                        App.unblockUI();
                        
                    },"json");
                    //alert(studentIds.length);
                }
                else
                {
                    success1.hide();
                    error1.show();
                    App.scrollTo(error1, -200);
                }
            });
        }
        $(".manageVehicleDetails").on("click",function(){
            
            console.log("Manage");
            
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
            
            var id = $(this).attr("data-id");
            
            var veh = $(this).attr("data-veh");
            
            var reg = $(this).attr("data-reg");
            
//            window.location = "managevehicle.html?id="+id+"&vehNo="+veh+"&regNo="+reg;
            
            var data = {'id':id,'vehNo':veh,'regNo':reg}
            
            $.post("vehicledetails/getManageVehicleDetails",data,function(data){
                
                if(data.str!==""){
                    
                    $("#vehicledetails").html(data.str);
                    
                    manageStaff();
                }
                
                App.unblockUI();
                
            },"json");
            
        });
        
        function manageStaff(){

            TableDatatablesManaged.init('sample_1');
            $(".vehicleStaffList").on("click",function(e){
            
                console.log("vehicleStaffList");
                
                $(".nav > li").removeClass("active");
                
                $(this).closest("li").addClass("active");
                
                App.blockUI({
                    
                    target : "#manageStaff",
                    boxed: true,
                    //message : "Please wait...",
                    cenrerY: true,
                });
                
                var id = $(this).attr("data-id");
                
                var data = {"id" : id};
                
                $.post("vehicledetails/getManageStaffTableView",data,function(data){
                    
                    if(data.str!=""){
                        
                        $("#manageStaff").html(data.str);
                        TableDatatablesManaged.init('sample_1');
                        addEditManageStaff();
                        
                    }
                    
                    App.unblockUI("#manageStaff");
                    
                },"json");
                
                e.preventDefault();

            });
            $(".studentlist").on("click",function(e)
            {
            
                console.log("Student list");
                $(".nav > li").removeClass("active");
                
                $(this).closest("li").addClass("active");
                
                App.blockUI({
                    boxed: true,
                    //message : "Please wait...",
                    cenrerY: true,
                });
                
                var id = $(this).attr("data-id");
                
    //            window.location = "managevehicle.html?id="+id+"&vehNo="+veh+"&regNo="+reg;
                
                var data = {'id':id}
                
                $.post("vehicledetails/getVehicleStudentDetails",data,function(data){
                    
                    if(data.str!==""){
                        
                         $("#manageStaff").html(data.str);
                        TableDatatablesManaged.init('sample_1');
                        studentManage();
                    }
                    
                    App.unblockUI();
                    
                },"json");
                e.preventDefault();
            
            });
            function studentManage()
            {
                $('.deletestudentvehicle').on("click",function()
                {
                    var id = $(this).attr("data-id");
                    var vehicleId=$("[name=vehicleId]").val();
                    var data = {'id':id,'vehicleId':vehicleId} 
                    $.post("vehicledetails/deleteVehicleStudent",data,function(data){
                    
                    if(data.str!==""){
                        
                         $("#manageStaff").html(data.str);
                        TableDatatablesManaged.init('sample_1');
                        studentManage();

                    }
                    
                    App.unblockUI();
                    
                },"json");

                });
            }
            
            $(".locationList").on("click",function(e){
            
                console.log("locationList");
                
                $(".nav > li").removeClass("active");
                
                $(this).closest("li").addClass("active");
                
                App.blockUI({
                    
                    target : "#manageStaff",
                    boxed: true,
                    //message : "Please wait...",
                    cenrerY: true,
                });
                
                var id = $(this).attr("data-id");
                
                var data = {"id" : id,"travelType":"PICKUP"};
                
                $.post("vehicledetails/getVehicleLocationsView",data,function(data){
                    
                    if(data.str!=""){
                        
                        $("#manageStaff").html(data.str);
                        
                        if (jQuery().datepicker) {
                            $('.date-picker').datepicker({
                                rtl: App.isRTL(),
                                orientation: "left",
                                autoclose: true,
                                format: 'dd-M-yyyy',
                            });
                            //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
                        }
                        
                        App.initSlimScroll('.scroller');
                        
//                        addEditManageStaff();

                        $(".search").on("click",function(){
        
                            App.blockUI({
                                boxed: true,
                                target : "#vehiclelocations",
                                cenrerY: true,
                            });

                            var data ={'id':$("[name=vehicleId]").val(),"travelType":$("[name=travelType]").val(),"travelDate":$("[name=travelDate]").val()};

                            $.post("trackvehicles/getvehiclelocations",data,function(data){

                    //            console.log(data.str);

                                $("#vehiclelocations").html(data.str);

                                App.unblockUI("#vehiclelocations");

                            },"json");

                        });
                        
                    }
                    
                },"json");
                
                e.preventDefault();

            });
            
            $("body").on("click",".addEditManageStaff",function(){
                
                App.blockUI({
                    boxed: true,
                    //message : "Please wait...",
                    cenrerY: true,
                });

                var id = $(this).attr("data-id");

                var vid = $(this).attr("data-vehicle");

                var data = {'id':id,'vid':vid}

                $.post("vehicledetails/getManageStaff",data,function(data){

                    if(data.str!==""){

                        $("#manageStaff").html(data.str);

                        addEditManageStaff();
                    }

                    App.unblockUI();

                },"json");
                
            });
            
           
            
        }
        
        function addEditManageStaff(){
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
            $(".cancel").on("click",function(){
                
                $(".vehicleStaffList").trigger("click");
                
            });
            $(".submit").on("click",function(){
               
               var form1 = $('#managestafffrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    messages: {
                        staffId : {
                            required : "Please select staff"
                        },
                        travelType : {
                            required : "Please select travel type"
                        }
                    },
                    rules: {
                        staffId: {
                            required: true
                        },
                        travelType :{
                            required: true
                        },
                        assignedDate :{
                            required: true
                        },
                        
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("vehicledetails/saveManageStaff",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                //window.location.reload();
                                $(".vehicleStaffList").trigger("click");
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
                
            });
        }
        
        function saveVehicleDetails(){
            
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            $(".submit").on("click",function(){

                var form1 = $('#vehicledetailsfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input
                    messages: {
                        typeId : {
                            required : "Please select type"
                        }
                    },
                    rules: {
                        registrationNo: {
                            required: true
                        },
                        vehicleNo :{
                            required: true
                        },
                        typeId :{
                            required: true
                        },
                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {
                        
                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });
                        
                        var data = form1.serializeArray();
                        
                        $.post("vehicledetails/save",data,function(data){
                            
                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                window.location.reload();
                            } else {
                                success1.hide();
                                error1.show();
                            }   
                            
                        },"json");
                        
                    }
                });
            });
//            Ladda.bind( '.mt-ladda-btn', {
//                callback: function( instance ) {
//                    
//                    App.blockUI({
//                        boxed: true,
//                        message : "Saving Please wait...",
//                        cenrerY: true,
//                    });
//                    var interval = setInterval( function() {
//                        
//                        instance.stop();
//                        
//                        clearInterval( interval );
//                        
//                        App.unblockUI();
//                        
//                        App.alert({
//                            message :"Saved"
//                        })
//                        
//                    },5000);
//                }
//            });
        }
        
    }
    
    return {
        
        init:function(){
            
            addEditVehicle();
            
        }
        
    };
    
}();

var ManageVehicle = function() {

    var dashboardMainChart = null;

    return {

        //main function
        init: function() {
        
            ManageVehicle.initMiniCharts();
        },

        initMiniCharts: function() {

            // IE8 Fix: function.bind polyfill
            if (App.isIE8() && !Function.prototype.bind) {
                Function.prototype.bind = function(oThis) {
                    if (typeof this !== "function") {
                        // closest thing possible to the ECMAScript 5 internal IsCallable function
                        throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
                    }

                    var aArgs = Array.prototype.slice.call(arguments, 1),
                        fToBind = this,
                        fNOP = function() {},
                        fBound = function() {
                            return fToBind.apply(this instanceof fNOP && oThis ? this : oThis,
                                aArgs.concat(Array.prototype.slice.call(arguments)));
                        };

                    fNOP.prototype = this.prototype;
                    fBound.prototype = new fNOP();

                    return fBound;
                };
            }

            $("#sparkline_bar").sparkline([8, 9, 10, 11, 10, 10, 12, 10, 10, 11, 9, 12, 11], {
                type: 'bar',
                width: '100',
                barWidth: 6,
                height: '45',
                barColor: '#F36A5B',
                negBarColor: '#e02222'
            });

            $("#sparkline_bar2").sparkline([9, 11, 12, 13, 12, 13, 10, 14, 13, 11, 11, 12, 11], {
                type: 'bar',
                width: '100',
                barWidth: 6,
                height: '45',
                barColor: '#5C9BD1',
                negBarColor: '#e02222'
            });
        }

    };

}();

var studentDetails = function()
{
    var addEditStudent = function()
    {    
        $(".addEditStudentDetails").on("click",function(){
//            console.log("Staff Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("studentdetails/addeditstudent",js,function(data){
                
                if(data.str!==""){
                    
                    $("#studentdetailsdiv").html(data.str);
                    
                    saveStudentDetails();
                }
                
                App.unblockUI();
                
            },"json");
            
        });

        $(".addMarksCard").on("click",function(){
//            console.log("Staff Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"studentId":$(this).attr("data-id"),"markscardId":""};
            $.post("studentdetails/addMarksCard",js,function(data){

                if(data.str!==""){

                    $("#studentdetailsdiv").html(data.str);

                    saveMarksCard();
                }

                App.unblockUI();

            },"json");

        });

        $(".manageStudentDetails").on("click",function()
        {
//            console.log("Staff Details");
            App.blockUI({
                boxed: true,
                //message : "Please wait...",
                cenrerY: true,
            });
//            App.startPageLoading({animate: true});
            var js = {"id":$(this).attr("data-id")};
            $.post("studentdetails/getManageStudentDetails",js,function(data)
            {
                App.unblockUI();
                if(data.str!=="")
                {    
                    $("#studentdetails").html(data.str);
                    
                    saveManageDetails();
//                    App.init();
//                    saveStudentDetails();
                }

            },"json");
            
        });
        
        function saveManageDetails()
        {

            $(".editmarkscard").on("click",function(){
//            console.log("Staff Details");
                App.blockUI({
                    boxed: true,
                    //message : "Please wait...",
                    cenrerY: true,
                });
//            App.startPageLoading({animate: true});
                var js = {"markscardId":$(this).attr("data-id"),"studentId":""};
                $.post("studentdetails/addMarksCard",js,function(data){

                    if(data.str!==""){

                        $("#tab_1_13").html(data.str);

                        saveMarksCard();
                    }

                    App.unblockUI();

                },"json");

            });
            
            $("#saveProfilPic").on("click",function()
            {
                App.blockUI();
                
                var form1 = $("#logoFrm");
                
                $.ajax({
                    type: 'POST',
                    url: url+'studentdetails/saveImage',
                    data: new FormData(form1[0]),
                    processData: false,
                    contentType: false,
                    cache:false,
                    error : function(){
                        console.log("Error");
                    },
                    success: function (data) {
                        console.log(data.filename);
                        App.unblockUI();
                    }
                });
                
            });
        }
        function saveMarksCard(){
            if($("[name=markscardId]").val()!="")
            {

                var mockFile = { name: $("[name=markscard]").val(), size: 12345 };

                console.log("Image "+mockFile.name);

                var myDropzone = new Dropzone('#image', {
                    maxFilesize: 2,
                    maxFiles:1,
                    url: url+"studentdetails/savemarksCardImage",
                    success : function(file,data){

                        $("[name=markscard]").val(file.name);

                    }

                });

                // Call the default addedfile event handler
                myDropzone.emit("addedfile", mockFile);

                // And optionally show the thumbnail of the file:
                myDropzone.emit("thumbnail", mockFile, url+"/images/"+mockFile.name);

                myDropzone.emit("complete", mockFile);

                myDropzone.emit("success",function(file,data){

                    console.log(file.name);

                });
                $("[name=markscard]").val(mockFile.name);

            } else {
                $("div#image").dropzone({
                    url: url + "studentdetails/savemarksCardImage",
                    acceptedFiles: "image/*",
                    sending: function (file, xhr, formData) {

                        formData.append("markscardId", $("[name=markscardId]").val())

                    },

                    success: function (file, data) {

                        $("[name=markscard]").val(file.name);

                    }
                });
            }
            $(".canceledit").on("click",function(){

                var js = {"id":$("[name=studentId]").val()};
                $.post("studentdetails/getManageStudentDetails",js,function(data)
                {
                    App.unblockUI();
                    if(data.str!=="")
                    {
                        $("#studentdetails").html(data.str);

                        saveManageDetails();
                        $(".test").trigger("click");
                    }

                },"json");

                // window.location.reload();

            });
            $(".canceladd").on("click",function(){
                
                window.location.reload();
                
            });
            $(".canceledit").on("click",function(){

                var js = {"id":$("[name=studentId]").val()};
                $.post("studentdetails/getManageStudentDetails",js,function(data)
                {
                    App.unblockUI();
                    if(data.str!=="")
                    {
                        $("#studentdetails").html(data.str);

                        saveManageDetails();
                        $(".test").trigger("click");
                    }

                },"json");

                // window.location.reload();

            });

            $(".submit").on("click",function(){

                var form1 = $('#markscardfrm');
                var error1 = $('.alert-danger', form1);
                var success1 = $('.alert-success', form1);

                form1.validate({
                    errorElement: 'span', //default input error message container
                    errorClass: 'help-block help-block-error', // default input error message class
                    focusInvalid: false, // do not focus the last invalid input
                    ignore: "",  // validate all fields including form hidden input

                    rules: {
                        examType:{
                            required: true
                        },
                        markscard:{
                            required: true
                        }

                    },

                    invalidHandler: function (event, validator) { //display error alert on form submit              
                        success1.hide();
                        error1.show();
                        App.scrollTo(error1, -200);
                    },

                    highlight: function (element) { // hightlight error inputs
                        $(element)
                            .closest('.form-group').addClass('has-error'); // set error class to the control group
                    },

                    unhighlight: function (element) { // revert the change done by hightlight
                        $(element)
                            .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    },

                    success: function (label) {
                        label
                            .closest('.form-group').removeClass('has-error'); // set success class to the control group
                    },

                    submitHandler: function (form) {

                        App.blockUI({
                            boxed: true,
                            message : "Saving Please wait...",
                            cenrerY: true,
                        });

                        var data = form1.serializeArray();

                        $.post("studentdetails/saveMarksCard",data,function(data){

                            App.unblockUI();

                            if(data.result > 0){
                                success1.show();
                                error1.hide();
                                if(data.str==0) {
                                    window.location.reload();
                                }
                                else {
                                    var js = {"id":data.studentId};
                                    $.post("studentdetails/getManageStudentDetails",js,function(data)
                                    {
                                        App.unblockUI();
                                        if(data.str!=="")
                                        {
                                            $("#studentdetails").html(data.str);

                                            saveManageDetails();
                                            $(".test").trigger("click");
                                        }

                                    },"json");
                                }
                            } else {
                                success1.hide();
                                error1.show();
                            }

                        },"json");

                    }
                });
            });
        }
        function saveStudentDetails()
        {
            var photo=$("#photo").val();
                
            var mockFile = { name: photo, size: 12345 };
            
            console.log("Image "+mockFile.name);
           
            var myDropzone = new Dropzone('#image', { 
                maxFilesize: 2, 
                maxFiles:1,
                url: url+"studentdetails/saveProfilePic",
                success : function(file,data){
                    $("[name=photo]").val(file.name);

                }
            });
            
            // Call the default addedfile event handler
            myDropzone.emit("addedfile", mockFile);

            // And optionally show the thumbnail of the file:
            myDropzone.emit("thumbnail", mockFile, url+"/images/"+mockFile.name);
            
            myDropzone.emit("complete", mockFile);

            myDropzone.emit("removedfile",function(file){
               
            });
            
            myDropzone.emit("success",function(file,data){

                  console.log(file.name);

            });
                
            $("[name=photo]").val(mockFile.name);  

            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
        
            

            var form1 = $('#studentdetailsfrm');
            var error1 = $('.alert-danger', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",  // validate all fields including form hidden input
                messages: {
                    admissionNo:{
                        remote:"Admission number already exist"
                    },
                    fatherPhone:
                    {
                        minlength: "Phone number length must be 10",
                        maxlength: "Phone number length must be 10",
                    },
                    photo:
                    {
                        required:"Student picture is required"
                    }
                },
                rules: {
                    admissionNo: {
                        required: true,
                        remote: {
                                url: 'studentdetails/checkAdmissionno',
                                type: 'post',
                                data: {
                                    "existNo":$("[name=admissionexist]").val()
                                },
                            }
                    },
                    name :{
                        required: true
                    },
                    
                    classId : {
                        required: true
                    },
                    
                    fatherName :{
                        required: true
                    },
                    fatherPhone :{
                        required: true,
                        minlength: 10,
                        maxlength: 10,
                    },
                    photo:
                    {
                        required:true
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    App.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .closest('.form-group').removeClass('has-error'); // set success class to the control group
                },

                submitHandler: function (form) {
                    
                    App.blockUI({
                        boxed: true,
                        message : "Saving Please wait...",
                        cenrerY: true,
                    });
                    
                    var data = form1.serializeArray();
                    
                    $.post("studentdetails/save",data,function(data){
                        
                        App.unblockUI();

                        if(data.result > 0){
                            success1.show();
                            error1.hide();
                            App.scrollTo(success1, -200);
                             window.location.reload();
                        } else {
                            success1.hide();
                            error1.show();
                        }   
                        
                    },"json");
                    
                }
            });

        }
        
    }
    
    return {
        
        init:function(){
            
            addEditStudent();
            
        }
        
    };
    
}();

var TrackVehicles = function () {
    
    if (jQuery().datepicker) {
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            orientation: "left",
            autoclose: true,
            format: 'dd-M-yyyy',
        });
        //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
    }

    $(".search").on("click",function(){
        
        App.blockUI({
            boxed: true,
            target : "#vehiclelocations",
            cenrerY: true,
        });
        
        var data ={'id':$("[name=vehicleId]").val(),"travelType":$("[name=travelType]").val(),"travelDate":$("[name=travelDate]").val()};
        
        $.post("trackvehicles/getvehiclelocations",data,function(data){
            
//            console.log(data.str);
            
            $("#vehiclelocations").html(data.str);
            
            App.unblockUI("#vehiclelocations");
            
//            var map = new GMaps({
//                div: '#gmap_polylines',
//                lat: 13.0153345,
//                lng: 77.6596154,
//                zoom : 15,
//                click: function (e) {
//                    console.log(e);
//                }
//            });
//
//            path = data.str;
//
//            map.drawPolyline({
//                path: path,
//                strokeColor: '#131540',
//                strokeOpacity: 0.6,
//                strokeWeight: 6
//            });
            
        },"json");
        
    });
    
    var mapPolylines = function () {
        var map = new GMaps({
            div: '#gmap_polylines',
            lat: 13.0153345,
            lng: 77.6596154,
            zoom : 15,
            click: function (e) {
                console.log(e);
            }
        });

        path = [[13.0153345,77.6596154],[13.0174938,77.6591087],[13.0194268,77.6542709],[13.0199868,77.6533585],[13.0225774,77.6472412],[13.0241624,77.6435106],[13.025289,77.6409097],[13.0258116,77.6394307],[13.025909,77.6385115],[13.0260119,77.6383978],[13.0265565,77.6363826],[13.0266594,77.635932],[13.028739,77.6319781],[13.0295987,77.6313451],[13.0311318,77.6305329],[13.0342314,77.6289155],[13.0380112,77.6256542],[13.0399923,77.6242243],[13.0402438,77.623959],[13.0409419,77.6224192],[13.0410136,77.6220559],[13.0410352,77.6217349],[13.041123,77.6183401],[13.0411486,77.617531],[13.0458047,77.6091187],[13.0406364,77.5566338],[13.0421633,77.5959962],[13.042089,77.5941589],[13.0406364,77.5566338],[13.0394058,77.5895321],[13.0366636,77.589151],[13.0356934,77.5885282],[13.0279665,77.5860289],[13.0268242,77.5861352],[13.0265965,77.587383],[13.026554,77.5875068],[13.0263394,77.5889683],[13.0263324,77.5890657],[13.0264526,77.5898442],[13.0266107,77.5913983],[13.0263811,77.5923263],[13.0258416,77.5932415],[13.027212,77.5938751]];

        map.drawPolyline({
            path: path,
            strokeColor: '#131540',
            strokeOpacity: 0.6,
            strokeWeight: 6
        });
    }
    return {
        //main function to initiate map samples
        init: function () {
//            mapBasic();
//            mapMarker();
//            mapGeolocation();
//            mapGeocoding();
//            mapPolylines();
//            mapPolygone();
//            mapRoutes();
        }

    };

}();
var reports = function()//School reports for attendance of students
{
    
    var searchresult = function()//search the student attendance based on date or admissionNo or attendance status or class
    {
        $("#searchByStudentId").autocomplete({

            source: "reports/getadmissionNo"

        });
        $("#searchByStaffCode").autocomplete({

            source: "reports/getStaffCode"

        });
        if (jQuery().datepicker) {
                $('#date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    minDate:new Date($(".minDate").attr("data-year"),$(".minDate").attr("data-mon")  - 1, $(".minDate").attr("data-date")),
                    maxDate:0,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
        $(".submit").on("click",function()
        {
             
            var form1 = $('#reportsearch');
            // var error1 = $('.alert-danger', form1);
            // var success1 = $('.alert-success', form1);

            form1.validate({
                
                submitHandler: function (form) {
                    
                    App.blockUI({
                        boxed: true,
                        message : "Searching Please wait...",
                        cenrerY: true,
                    });
                    
                    var data = form1.serializeArray();
                    $.post("reports/attendancereport",data,function(data){
                        
                        App.unblockUI();

                        if(data.str!==""){
                
                            $("#reportsdiv").html(data.str);//bind result page in existing page

                            TableDatatablesManaged.init('sample_1');//init the datatable
                            }
                        
                    },"json");
                    
                }
            });
        });            
    }
    return {
        
        init:function()
        {
            searchresult();//init the search result function
            
        }
        
    };
    
}();
var staffReports = function()//School reports for attendance of students
{
    
    var searchresult = function()//search the student attendance based on date or admissionNo or attendance status or class
    {
        
        $("#searchByStaffCode").autocomplete({

            source: "Staffreports/getStaffCode"

        });
        if (jQuery().datepicker) {
                $('#date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    minDate:new Date($(".minDate").attr("data-year"),$(".minDate").attr("data-mon")  - 1, $(".minDate").attr("data-date")),
                    maxDate:0,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
        $(".submit").on("click",function()
        {
             
            var form1 = $('#reportsearch');
            // var error1 = $('.alert-danger', form1);
            // var success1 = $('.alert-success', form1);

            form1.validate({
                
                submitHandler: function (form) {
                    
                    App.blockUI({
                        boxed: true,
                        message : "Searching Please wait...",
                        cenrerY: true,
                    });
                    
                    var data = form1.serializeArray();
                    $.post("Staffreports/attendancereport",data,function(data){
                        
                        App.unblockUI();

                        if(data.str!==""){
                
                            $("#reportsdiv").html(data.str);//bind result page in existing page

                            TableDatatablesManaged.init('sample_1');//init the datatable
                            }
                        
                    },"json");
                    
                }
            });
        });            
    }
    return {
        
        init:function()
        {
            searchresult();//init the search result function
            
        }
        
    };
    
}();
var singleStudentReport = function()//School reports for attendance of students
{
    
    var searchresult = function()//search the student attendance based on date or admissionNo or attendance status or class
    {
        $("#searchByStudentId").autocomplete({

            source: "reports/getadmissionNo"

        });
        $(".startDatePicker").datepicker({ 
            changeMonth: true,
            minDate:new Date($(".minDate").attr("data-year"),$(".minDate").attr("data-mon")  - 1, $(".minDate").attr("data-date")),
            maxDate:0,
            format: 'dd-M-yyyy',
            onSelect: function(date){

                var selectedDate = new Date(date);

                $(".endDatePicker").datepicker( "option", "minDate", selectedDate );
                $(".endDatePicker").datepicker( "option", "maxDate", 0 );

            }
        });

        $(".endDatePicker").datepicker({ 
            
            changeMonth: true,
            minDate:new Date($(".minDate").attr("data-year"),$(".minDate").attr("data-mon")  - 1, $(".minDate").attr("data-date")),
            maxDate:0,
            format: 'dd-M-yyyy'
        });
        $(".submit").on("click",function()
        {
             
            var form1 = $('#reportsearch');
            // var error1 = $('.alert-danger', form1);
            // var success1 = $('.alert-success', form1);

            form1.validate({
                
                submitHandler: function (form) {
                    
                    App.blockUI({
                        boxed: true,
                        message : "Searching Please wait...",
                        cenrerY: true,
                    });
                    
                    var data = form1.serializeArray();
                    $.post("Singlestudentreport/attendancereport",data,function(data){
                        
                        App.unblockUI();

                        if(data.str!==""){
                
                            $("#reportsdiv").html(data.str);//bind result page in existing page

                            TableDatatablesManaged.init('sample_1');//init the datatable
                            }
                        
                    },"json");
                    
                }
            });
        });            
    }
    return {
        
        init:function()
        {
            searchresult();//init the search result function
            
        }
        
    };
    
}();

var singleStaffReport = function()//School reports for attendance of students
{
    
    var searchresult = function()//search the student attendance based on date or admissionNo or attendance status or class
    {
        $("#searchByStaffCode").autocomplete({

            source: "Staffreports/getStaffCode"

        });
         $(".startDatePicker").datepicker({ 
            changeMonth: true,
            minDate:new Date($(".minDate").attr("data-year"),$(".minDate").attr("data-mon")  - 1, $(".minDate").attr("data-date")),
            maxDate:0,
            format: 'dd-M-yyyy',
            onSelect: function(date){

                var selectedDate = new Date(date);

                $(".endDatePicker").datepicker( "option", "minDate", selectedDate );
                $(".endDatePicker").datepicker( "option", "maxDate", 0 );

            }
        });

        $(".endDatePicker").datepicker({ 
            
            changeMonth: true,
            minDate:new Date($(".minDate").attr("data-year"),$(".minDate").attr("data-mon")  - 1, $(".minDate").attr("data-date")),
            maxDate:0,
            format: 'dd-M-yyyy'
        });
        $(".submit").on("click",function()
        {
             
            var form1 = $('#reportsearch');
            // var error1 = $('.alert-danger', form1);
            // var success1 = $('.alert-success', form1);

            form1.validate({
                
                submitHandler: function (form) {
                    
                    App.blockUI({
                        boxed: true,
                        message : "Searching Please wait...",
                        cenrerY: true,
                    });
                    
                    var data = form1.serializeArray();
                    $.post("Singlestaffreport/attendancereport",data,function(data){
                        
                        App.unblockUI();

                        if(data.str!==""){
                
                            $("#reportsdiv").html(data.str);//bind result page in existing page

                            TableDatatablesManaged.init('sample_1');//init the datatable
                            }
                        
                    },"json");
                    
                }
            });
        });            
    }
    return {
        
        init:function()
        {
            searchresult();//init the search result function
            
        }
        
    };
    
}();

var vehiclestaffs = function()//School reports for attendance of students
{
    
    function addEditManageStaff(){

        $(".addeditvehiclestaff").on("click",function()
        {
            var id = $(this).attr("data-id");

            var data = {'id':id}

            $.post("vehiclestaffs/getvehicleStaff",data,function(data){

                if(data.str!==""){

                    $("#vehiclestaffdiv").html(data.str);

                    addEditvehicleStaff();
                }

                App.unblockUI();

            },"json");
        });
        function addEditvehicleStaff(){

            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    rtl: App.isRTL(),
                    orientation: "left",
                    autoclose: true,
                    format: 'dd-M-yyyy',
                });
                //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
            }
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
            $(".delete").on("click",function(){
                
                var id = $(this).attr("data-id");
                var data = {'id':id}
                $.post("vehiclestaffs/deleteVehicleStaff",data,function(data){
                        
                    App.unblockUI();

                    if(data.result > 0){
                        window.location.reload();
                    } else {
                        success1.hide();
                        error1.show();
                    }   
                    
                },"json");
                
            });
            var form1 = $('#managestafffrm');
            var error1 = $('.alert-danger', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",  // validate all fields including form hidden input
                messages: {
                    travelType : {
                        required : "Please select travel type"
                    }
                },
                rules: {
                    travelType :{
                        required: true
                    },
                    assignedDate :{
                        required: true
                    },
                    
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    App.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .closest('.form-group').removeClass('has-error'); // set success class to the control group
                },

                submitHandler: function (form) {
                    
                    App.blockUI({
                        boxed: true,
                        message : "Saving Please wait...",
                        cenrerY: true,
                    });
                    
                    var data = form1.serializeArray();
                    
                    $.post("vehiclestaffs/saveVehicleStaff",data,function(data){
                        
                        App.unblockUI();

                        if(data.result > 0){
                            success1.show();
                            error1.hide();
                            window.location.reload();
                        } else {
                            success1.hide();
                            error1.show();
                        }   
                        
                    },"json");
                    
                }
            });
        }
    }
    return {
        
        init:function()
        {
            
            addEditManageStaff();//init function
            
        }
        
    };
    
}();
var schools = function()//School reports for attendance of students
{
    function addEditSchools()
    {
        $(".addEditSchool").on("click",function()
        {
            var id = $(this).attr("data-id");

            var data = {'id':id}

            $.post("schools/getSchoolDetails",data,function(data){

                if(data.str!==""){

                    $("#schoolsdiv").html(data.str);

                    addEditschooldetail();
                }

                App.unblockUI();

            },"json");
        });

        function addEditschooldetail()
        {
            $(".cancel").on("click",function(){
                
                window.location.reload();
                
            });
            var form1 = $('#schoolform');
            var error1 = $('.alert-danger', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",  // validate all fields including form hidden input
                messages: 
                {
                        db:{
                            remote:"database already exist"
                        }
                },
                rules: {
                    schoolName :{
                        required: true
                    },
                    address :{
                        required: true
                    },
                    country :{
                        required: true
                    },
                    db :{
                        required: true,
                        remote: {
                                    url: 'schools/checkSchoolDb',
                                    type: 'post',
                                    data: {
                                        "existDb":$("[name=dbexist]").val(),
                                        "schoolId":$("[name=schoolId]").val()
                                    },
                                    
                                }
                    },
                    url :{
                        required: true
                    },
                    
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    App.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .closest('.form-group').removeClass('has-error'); // set success class to the control group
                },

                submitHandler: function (form) {
                    
                    App.blockUI({
                        boxed: true,
                        message : "Saving Please wait...good things will take time",
                        cenrerY: true,
                    });
                    
                    var data = form1.serializeArray();
                    
                    $.post("schools/saveSchool",data,function(data){
                        
                        App.unblockUI();

                        if(data.result > 0){
                            success1.show();
                            error1.hide();
                            window.location.reload();
                        } else {
                            success1.hide();
                            error1.show();
                        }   
                        
                    },"json");
                    
                }
            });
        }
    }
    return {
        
        init:function()
        {
            
            addEditSchools();//init function
            
        }
        
    };
    
}();
var leave = function()//School reports for attendance of students
{
    function editLeave()
    {
        $(".editLeaveStatus").on("click",function()
        {
            var id = $(this).attr("data-id");
            var status = $(this).attr("data-value");

            var data = {'id':id,'approvalStatus':status}

            $.post("leave/updateApprovalStatus",data,function(data){

                if(data.result>0)
                {
                    window.location.reload();  
                }

                App.unblockUI();

            },"json");
        });
    }
    return {
        
        init:function()
        {
            
            editLeave();//init function
            
        }
        
    };
    
}();
setInterval("my_function();",50000);
function my_function()
{
    $.post("dashboard/autoRefresh",function(data)
    {
                    
        $("#total").html(data.totalStudents);  
        $("#staff_count").html(data.staffsCount);  
        $("#msg_count").html(data.messageCount);  
        $("#ntf_count").html(data.notificationCount);  
        $("#stu_count").html(data.totalStudents);  
                    
    },"json");

    
    $('#sample1').load('dashboard #sample_1',function() 
    {
        $('#sample_1').dataTable().fnDestroy();
        TableDatatablesManaged.init("sample_1");
     
    });
    
    $('#sample2').load('dashboard #sample_2',function() 
    {
        $('#sample_2').dataTable().fnDestroy();
        TableDatatablesManaged.init("sample_2");
        
    });
    
    $('#sample3').load('dashboard #sample_3',function() 
    {
        $('#sample_3').dataTable().fnDestroy();
        TableDatatablesManaged.init("sample_3");
    });
    $('#sample4').load('dashboard #sample_4',function() 
    {
        $('#sample_4').dataTable().fnDestroy();
        TableDatatablesManaged.init("sample_4");
    });
    $('#sample5').load('dashboard #sample_5',function() 
    {
        $('#sample_5').dataTable().fnDestroy();
        TableDatatablesManaged.init("sample_5");
    });
    $('#sample6').load('dashboard #sample_6',function() 
    {});
    $('#sample7').load('dashboard #sample_7',function() 
    {
    });
        
        
}
if (App.isAngularJsApp() === false) { 
    
    jQuery(document).ready(function() {
        
        var pageId = $(".page-content").attr("id");
        
        console.log(pageId);
        
        switch(pageId){
            
            case "dashboard":
                
                $('.page-sidebar-menu li').removeClass("active");
                $('.page-sidebar-menu .start').addClass("active");
                Dashboard.init(); // init metronic core componets
                TableDatatablesManaged.init('sample_1');
                TableDatatablesManaged.init('sample_2');
                TableDatatablesManaged.init('sample_3');
                TableDatatablesManaged.init('sample_4');
                TableDatatablesManaged.init('sample_5');

                break;
                
            case "academics":

                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .admin ').addClass("active");
                $('.page-sidebar-menu .admin .academic').addClass("active");
                academics.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "designations":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .admin').addClass("active");
                 $('.page-sidebar-menu .admin .designation').addClass("active");
                designations.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "standards":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .admin').addClass("active");
                 $('.page-sidebar-menu .admin .standard').addClass("active");
                standards.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "sections":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .admin').addClass("active");
                 $('.page-sidebar-menu .admin .section').addClass("active");
                sections.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;    
                
            case "classes":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .classes').addClass("active");
                 $('.page-sidebar-menu .classes .classdetail').addClass("active");
                classes.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "timetables":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .classes').addClass("active");
                $('.page-sidebar-menu .classes .timetable').addClass("active");
                timetables.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "staffdetails":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .staff').addClass("active");
                $('.page-sidebar-menu .staff .staffdetails').addClass("active");
                staffDetails.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "vehicledetails":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .vehicle').addClass("active");
                $('.page-sidebar-menu .vehicledetails').addClass("active");
                vehicleDetails.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "studentdetails":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .students').addClass("active");
                $('.page-sidebar-menu .students .studentdetail').addClass("active");
                studentDetails.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "attendancedetails":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .students').addClass("active");
                $('.page-sidebar-menu .students .studentattendance').addClass("active");
                TableDatatablesManaged.init('sample_1');
                
                break;
                case "staffAttendance":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .staff').addClass("active");
                $('.page-sidebar-menu .staffattendance').addClass("active");
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "events":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .events').addClass("active");
                $('.page-sidebar-menu .events .eventdetail').addClass("active");
                events.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "notifications":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .notifications').addClass("active");
                $('.page-sidebar-menu .notifications .notificationdetail').addClass("active");
                notifications.init();
                
                TableDatatablesManaged.init('sample_1');
                
                break;
                
            case "reports":
                   
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .reports').addClass("active");
                $('.page-sidebar-menu .reports .studentreport').addClass("active");
                reports.init();
  
                break;
            case "singleStudentReport":
                   
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .reports').addClass("active");
                $('.page-sidebar-menu .reports .singlestudentreport').addClass("active");
                singleStudentReport.init();
  
                break;
             case "staffReports":
                   
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .reports').addClass("active");
                $('.page-sidebar-menu .reports .staffreport').addClass("active");
                staffReports.init();
  
                break;
            case "singleStaffReport":
                   
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .reports').addClass("active");
                $('.page-sidebar-menu .reports .singlestaffreport').addClass("active");
                singleStaffReport.init();
  
                break;
               
               
            case "trackvehicles":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .vehicle').addClass("active");
                $('.page-sidebar-menu .vehicle .trackvehicle').addClass("active");
                TrackVehicles.init();
               
                break;
            
            case "vehiclestaffs":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .vehicle').addClass("active");               
                $('.page-sidebar-menu .vehicle .vehiclestaff').addClass("active");               
                vehiclestaffs.init();
                TableDatatablesManaged.init('sample_1');
               
                break;
            case "schools":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .superadmin').addClass("active");               
                schools.init();
                TableDatatablesManaged.init('sample_1');
               
                break;
            case "leavedetails":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .admin').addClass("active");
                $('.page-sidebar-menu .admin .leave').addClass("active");
                leave.init();               
                TableDatatablesManaged.init('sample_1');
                
                break;
            case "readerdetails":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .admin').addClass("active");
                $('.page-sidebar-menu .admin .reader').addClass("active");
                reader.init();               
                TableDatatablesManaged.init('sample_1');
                
                break;
            case "printingData":
                
                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .reports').addClass("active");               
                $('.page-sidebar-menu .reports .printdata').addClass("active");               
                TableDatatablesManaged.init('sample_1');
               
                break;
            case "syllabus":

                $('.page-sidebar-menu li').removeClass('active');
                $('.page-sidebar-menu .classes').addClass("active");
                $('.page-sidebar-menu .classes .syllabus').addClass("active");
                syllabus.init();

                TableDatatablesManaged.init('sample_1');

                break;
                
        }
        
        
        
        
    });
}











