@extends('admin.layouts.app')

@section('content')

<!-- BEGIN PAGE CONTENT BODY -->
<div class="page-content">
    <div class="container">

        <div class="col-md-12">
            
                  

            <div class="clearfix"></div>    
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-list"></i>{{ $page_title }}    
                    </div>
                </div>
                <div class="portlet-body">                    
                    <table class="table table-bordered table-striped table-condensed flip-content" id="server-side-datatables">
                        <thead>
                            <tr>
                               <th width="5%">ID</th>                                   
                               <th width="15%">Username</th>                           
                               <th width="10%">Action Name</th>                           
                               <th width="10%">Action Val</th>                           
                               <th width="10%">Ip Address</th>                           
                               <th width="20%">Remarks</th>                           
                               <th width="20%">Log Date</th>                           
                               <th width="10%">#By Admin</br>#AdminName</th>
                            </tr>
                        </thead>                                         
                        <tbody>
                        </tbody>
                    </table>                                              
                </div>
            </div>              
        </div>
    </div>
</div>
</div>        

@endsection

@section('styles')
  
@endsection

@section('scripts')
    <script type="text/javascript">
    

    $(document).ready(function(){


        $("#search-frm").submit(function(){
            oTableCustom.draw();
            return false;
        });


        $.fn.dataTableExt.sErrMode = 'throw';

        var oTableCustom = $('#server-side-datatables').DataTable({
            processing: true,
            serverSide: true,
            searching: false,
            ajax: {
                "url": "{!! route($moduleRouteText.'.data') !!}",
                "data": function ( data ) 
                {
                    data.search_text = $("#search-frm input[name='search_text']").val();
                }
            },            
            "order": [[ 0, "desc" ]],    
            columns: [
                { data: 'id', name: 'id' },
                { data: 'userid', name: 'userid' },                                              
                { data: 'actionid', name: 'actionid' },                                              
                { data: 'actionvalue', name: 'actionvalue' },                                              
                { data: 'remark', name: 'remark' },                                              
                { data: 'ipaddress', name: 'ipaddress' }                                              
                             
            ]
        });        

    });
    </script>

@endsection




