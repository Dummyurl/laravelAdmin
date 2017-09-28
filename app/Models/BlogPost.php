<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\SoftDeletes;
use Cviebrock\EloquentSluggable\Sluggable;

class BlogPost extends Model
{
    use SoftDeletes,Sluggable;

    /**
     * The database table used by the model
     *
     * @var string
     */
    protected $table = TBL_BLOG_POST;

    /**
     * The attributes that are mass assignable
     *
     * @var array
     */
    protected $fillable = ['title','status','category_id','short_description','content'];

    /**
     * Set or unset the timestamps for the model
     *
     * @var bool
     */
    public $timestamps = true;

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    |
    | For more information pleas check out the official Laravel docs at
    | http://laravel.com/docs/5.0/eloquent#relationships
    |
    */

    /*public function user()
    {
        return $this->belongsTo(\App\User::class)->withTrashed();
    }

    public function comment()
    {
        return $this->hasMany(\App\BlogComment::class);
    }

    public function category()
    {
        return $this->belongsTo(\App\BlogCategory::class)->withTrashed();
    }


    public function tag()
    {
        return $this->belongsToMany(\App\BlogTag::class, 'blog_post_tags', 'post_id', 'tag_id')->withTrashed();
    }*/


    /*
    |--------------------------------------------------------------------------
    | Accessors & Mutators
    |--------------------------------------------------------------------------
    |
    | For more information pleas check out the official Laravel docs at
    | http://laravel.com/docs/5.0/eloquent#accessors-and-mutators
    |
    */

    /*public function setPublishDateAttribute($value)
    {
        $this->attributes['publish_date'] = date("Y-m-d H:i:s", strtotime($value));
    }

    public function getPublishDateAttribute($value)
    {
        return date("d-m-Y H:i", strtotime($value));
    }

    function getTags($onlyIDS = 0)
    {
        $id = $this->id;

        $query = DB::table("blog_post_tags")
                ->where("post_id",$id)
                ->get();

        if($onlyIDS == 1)
        {
            $arr = array();
            foreach($query as $row)
            {   
                $arr[] = $row->tag_id;
            }
            return $arr;
        }        
        else
        {
            return $query;        
        }             
        
    }*/

    public function sluggable()
    {
        return [
            'slug' => 
            [
                'source' => 'title',
                'on_update' => true
            ]
        ];
    }  
}
