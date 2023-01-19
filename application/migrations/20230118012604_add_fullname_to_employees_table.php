<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Migration_Add_fullname_to_employees_table extends CI_Migration
{

    public function __construct()
    {
        parent::__construct();
        $this->load->dbforge();
    }

    public function up()
    {
        $fields = array(
            'fullname' => array(
                'type' => 'VARCHAR',
                'null' => TRUE,
                'after' => 'employee_id',
            ),
        );
        $this->dbforge->add_column('xin_employees', $fields);
    }

    public function down()
    {
        $this->dbforge->drop_table('xin_employees');
    }
}
