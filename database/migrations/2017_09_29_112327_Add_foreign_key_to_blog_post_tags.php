<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddForeignKeyToBlogPostTags extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('blog_post_tags', function (Blueprint $table) {
            $table->foreign('post_id')->references('id')->on('blog_posts')->onUpdate('RESTRICT')->onDelete('CASCADE');

            $table->foreign('tag_id')->references('id')->on('blog_tags')->onUpdate('RESTRICT')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('blog_post_tags', function (Blueprint $table) {
            //
        });
    }
}
