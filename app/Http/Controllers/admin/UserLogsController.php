<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Models\UserLog;
use App\Models\AdminAction;

class UserLogsController extends Controller {

    public function __construct() {
        
        $this->moduleRouteText = "user-logs";
        $this->moduleViewName = "admin.UserLogs";
        $this->list_url = route($this->moduleRouteText.".index");

        $module = "UserLog";
        $this->module = $module;  

        $this->adminAction= new AdminAction;

        $this->modelObj = new \App\Models\UserLog;  

        view()->share("list_url", $this->list_url);
        view()->share("moduleRouteText", $this->moduleRouteText);
        view()->share("moduleViewName", $this->moduleViewName);

    }/**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $checkrights = \App\Models\Admin::checkPermission(\App\Models\Admin::$LIST_USER_LOGS);
        
        if($checkrights) 
        {
            return $checkrights;
        }

        $data = array();        
        $data['page_title'] = "Manage UserLog"; 

        return view($this->moduleViewName.".index", $data);         
    }
    public function data(Request $requesst)
    {
        $checkrights = \App\Models\Admin::checkPermission(\App\Models\Admin::$LIST_USER_LOGS);
        
        if($checkrights) 
        {
            return $checkrights;
        }
        
            return Datatables::eloquent($model)
               
            ->addColumn('action', function(City $row) {
                return view("admin.partials.action",
                    [
                        'currentRoute' => $this->moduleRouteText,
                        'row' => $row, 
                        'isEdit' => \App\Models\Admin::isAccess(\App\Models\Admin::$EDIT_CITY),
                        'isDelete' =>\App\Models\Admin::isAccess(\App\Models\Admin::$DELETE_CITY),                                                        
                    ]
                )->render();
            })

            ->editColumn('created_at', function($row){
                
                if(!empty($row->created_at))         
                    return date("j M, Y h:i:s A",strtotime($row->created_at));
                else
                    return '-';    
            })
                
            ->filter(function ($query) 
            {
                $search_start_date = trim(request()->get("search_start_date"));                    
                $search_end_date = trim(request()->get("search_end_date"));
                $search_id = request()->get("search_id");
                $search_city = request()->get("search_city");                                       
                $search_state = request()->get("search_state");                                     
                $search_country = request()->get("search_country");               

                if (!empty($search_start_date)){

                    $from_date=$search_start_date.' 00:00:00';
                    $convertFromDate= $from_date;

                    $query = $query->where(TBL_CITY.".created_at",">=",addslashes($convertFromDate));
                }
                if (!empty($search_end_date)){

                    $to_date=$search_end_date.' 23:59:59';
                    $convertToDate= $to_date;

                    $query = $query->where(TBL_CITY.".created_at","<=",addslashes($convertToDate));
                }
                if(!empty($search_id))
                {
                    $idArr = explode(',', $search_id);
                    $idArr = array_filter($idArr);                
                    if(count($idArr)>0)
                    {
                        $query = $query->whereIn(TBL_CITY.".id",$idArr);
                    } 
                }                                

                if(!empty($search_city))
                {
                    $query = $query->where(TBL_CITY.".title", 'LIKE', '%'.$search_city.'%');
                }                                                       
                if(!empty($search_state))
                {
                    $query = $query->where(TBL_CITY.".state_id", $search_state);
                } 
                if(!empty($search_country))
                {
                    $query = $query->where(TBL_STATE.".country_id", $search_country);
                }  
                                                                   
            })->make(true);     
    } 

    
}
