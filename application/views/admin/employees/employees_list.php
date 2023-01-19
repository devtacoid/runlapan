<?php
/* Employees view
*/
?>
<?php $session = $this->session->userdata('username'); ?>
<?php $get_animate = $this->Xin_model->get_content_animate(); ?>
<?php $role_resources_ids = $this->Xin_model->user_role_resource(); ?>
<?php $user_info = $this->Xin_model->read_user_info($session['user_id']); ?>
<?php $system = $this->Xin_model->read_setting_info(1); ?>
<?php
// reports to 
$reports_to = get_reports_team_data($session['user_id']); ?>

<div id="smartwizard-2" class="smartwizard-example sw-main sw-theme-default">
    <ul class="nav nav-tabs step-anchor">
        <?php if (in_array('422', $role_resources_ids) && $user_info[0]->user_role_id == 1) { ?>
            <li class="nav-item clickable"><a href="<?php echo site_url('admin/employees/staff_dashboard/'); ?>"
                                              data-link-data="<?php echo site_url('admin/employees/staff_dashboard/'); ?>"
                                              class="mb-3 nav-link hrsale-link"> <span
                            class="sw-done-icon ion ion-md-speedometer"></span> <span
                            class="sw-icon ion ion-md-speedometer"></span> <?php echo $this->lang->line('hr_staff_dashboard_title'); ?>
                    <div class="text-muted small"><?php echo $this->lang->line('hr_staff_dashboard_title'); ?></div>
                </a></li>
        <?php } ?>
        <?php if (in_array('13', $role_resources_ids) || $reports_to > 0) { ?>
            <li class="nav-item active"><a href="<?php echo site_url('admin/employees/'); ?>"
                                           data-link-data="<?php echo site_url('admin/employees/'); ?>"
                                           class="mb-3 nav-link hrsale-link"> <span
                            class="sw-done-icon fas fa-user-friends"></span> <span
                            class="sw-icon fas fa-user-friends"></span> <?php echo $this->lang->line('dashboard_employees'); ?>
                    <div class="text-muted small"><?php echo $this->lang->line('xin_set_up'); ?><?php echo $this->lang->line('dashboard_employees'); ?></div>
                </a></li>
        <?php } ?>
        <?php if ($user_info[0]->user_role_id == 1) { ?>
            <li class="nav-item clickable"><a href="<?php echo site_url('admin/roles/'); ?>"
                                              class="mb-3 nav-link hrsale-link"
                                              data-link-data="<?php echo site_url('admin/roles/'); ?>"> <span
                            class="sw-icon ion ion-md-unlock"></span> <?php echo $this->lang->line('xin_role_urole'); ?>
                    <div class="text-muted small"><?php echo $this->lang->line('left_set_roles'); ?></div>
                </a></li>
        <?php } ?>
        <?php if (in_array('7', $role_resources_ids)) { ?>
            <li class="nav-item clickable"><a href="<?php echo site_url('admin/timesheet/office_shift/'); ?>"
                                              data-link-data="<?php echo site_url('admin/timesheet/office_shift/'); ?>"
                                              class="mb-3 nav-link hrsale-link"> <span
                            class="sw-icon ion ion-md-clock"></span> <?php echo $this->lang->line('left_office_shifts'); ?>
                    <div class="text-muted small"><?php echo $this->lang->line('xin_role_create'); ?><?php echo $this->lang->line('left_office_shifts'); ?></div>
                </a></li>
        <?php } ?>
    </ul>
</div>
<hr class="border-light m-0 mb-3">
<?php $employee_id = $this->Xin_model->generate_random_employeeid(); ?>
<?php $employee_pincode = $this->Xin_model->generate_random_pincode(); ?>
<?php if ($user_info[0]->user_role_id == 1) { ?>
    <div id="filter_hrsale" class="collapse add-formd <?php echo $get_animate; ?>" data-parent="#accordion" style="">
        <div class="ui-bordered px-4 pt-4 mb-4 mt-3">
            <?php $attributes = array('name' => 'ihr_report', 'id' => 'ihr_report', 'autocomplete' => 'off', 'class' => 'add form-hrm'); ?>
            <?php $hidden = array('user_id' => $session['user_id']); ?>
            <?php echo form_open('admin/employees/employees_list', $attributes, $hidden); ?>
            <?php
            $data = array(
                'type' => 'hidden',
                'name' => 'date_format',
                'id' => 'date_format',
                'value' => $this->Xin_model->set_date_format(date('Y-m-d')),
                'class' => 'form-control',
            );
            echo form_input($data);
            ?>
            <div class="form-row">
                <div class="col-md mb-3">
                    <label class="form-label"><?php echo $this->lang->line('left_company'); ?></label>
                    <select class="form-control" name="company_id" id="filter_company" data-plugin="select_hrm"
                            data-placeholder="<?php echo $this->lang->line('left_company'); ?>">
                        <option value="0"><?php echo $this->lang->line('xin_acc_all'); ?></option>
                        <?php foreach ($get_all_companies as $company) { ?>
                            <option value="<?php echo $company->company_id ?>"><?php echo $company->name ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="col-md mb-3" id="location_ajaxflt">
                    <label class="form-label"><?php echo $this->lang->line('left_location'); ?></label>
                    <select name="location_id" id="filter_location" class="form-control" data-plugin="select_hrm"
                            data-placeholder="<?php echo $this->lang->line('left_location'); ?>">
                        <option value="0"><?php echo $this->lang->line('xin_acc_all'); ?></option>
                    </select>
                </div>
                <div class="col-md mb-3" id="department_ajaxflt">
                    <label class="form-label"><?php echo $this->lang->line('left_department'); ?></label>
                    <select class="form-control" id="filter_department" name="department_id" data-plugin="select_hrm"
                            data-placeholder="<?php echo $this->lang->line('left_department'); ?>">
                        <option value="0"><?php echo $this->lang->line('xin_acc_all'); ?></option>
                    </select>
                </div>
                <div class="col-md mb-3" id="designation_ajaxflt">
                    <label class="form-label"><?php echo $this->lang->line('xin_designation'); ?></label>
                    <select class="form-control" name="designation_id" data-plugin="select_hrm" id="filter_designation"
                            data-placeholder="<?php echo $this->lang->line('xin_designation'); ?>">
                        <option value="0"><?php echo $this->lang->line('xin_acc_all'); ?></option>
                    </select>
                </div>
                <div class="col-md col-xl-2 mb-4">
                    <label class="form-label d-none d-md-block">&nbsp;</label>
                    <?php echo form_button(array('name' => 'hrsale_form', 'type' => 'submit', 'class' => 'btn btn-secondary btn-block', 'content' => '<i class="fas fa-check-square"></i> ' . $this->lang->line('xin_get'))); ?>
                </div>
            </div>
            <?php echo form_close(); ?> </div>
    </div>
<?php } ?>
<?php if (in_array('201', $role_resources_ids)) { ?>
    <div class="card mb-4">
        <div id="accordion">
            <div class="card-header with-elements"><span
                        class="card-header-title mr-2"><strong><?php echo $this->lang->line('xin_add_new'); ?></strong> <?php echo $this->lang->line('xin_employee'); ?></span>
                <div class="card-header-elements ml-md-auto"><a class="text-dark collapsed" data-toggle="collapse"
                                                                href="#add_form" aria-expanded="false">
                        <button type="button" class="btn btn-xs btn-primary"><span
                                    class="ion ion-md-add"></span> <?php echo $this->lang->line('xin_add_new'); ?>
                        </button>
                    </a></div>
            </div>
            <div id="add_form" class="collapse add-form <?php echo $get_animate; ?>" data-parent="#accordion" style="">
                <div class="card-body">
                    <?php $attributes = array('name' => 'add_employee', 'id' => 'xin-form', 'autocomplete' => 'off'); ?>
                    <?php $hidden = array('_user' => $session['user_id']); ?>
                    <?php echo form_open_multipart('admin/employees/add_employee', $attributes, $hidden); ?>
                    <div class="form-body">
                        <h5 style="color: #c2c3c5">Database Perusahaan</h5>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="employee_id"><?php echo $this->lang->line('dashboard_employee_id'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="<?php echo $this->lang->line('dashboard_employee_id'); ?>"
                                                   name="employee_id" type="text" value="<?php echo $employee_id; ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date_of_joining"
                                                   class="control-label"><?php echo $this->lang->line('xin_employee_doj'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control date" readonly
                                                   placeholder="<?php echo $this->lang->line('xin_employee_doj'); ?>"
                                                   name="date_of_joining" type="text" autocomplete="on"
                                                   value="<?php echo date('Y-m-d'); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <?php $colmd = 6;
                                    if ($system[0]->is_active_sub_departments == 'yes') {
                                        $ncolmd = 6;
                                    } else {
                                        $ncolmd = 6;
                                    } ?>
                                    <div class="col-md-<?php echo $ncolmd; ?>">
                                        <div class="form-group" id="department_ajax">
                                            <label for="department"><?php echo $this->lang->line('xin_hr_main_department'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <select class="form-control" name="department_id" data-plugin="select_hrm"
                                                    data-placeholder="<?php echo $this->lang->line('xin_employee_department'); ?>"
                                                    disabled="disabled">
                                                <option value=""><?php echo $this->lang->line('xin_employee_department'); ?></option>
                                            </select>
                                        </div>
                                    </div>
                                    <?php $colmd = 6;
                                    if ($system[0]->is_active_sub_departments == 'yes') { ?>
                                        <div class="col-md-6" id="subdepartment_ajax">
                                            <div class="form-group">
                                                <label for="designation"><?php echo $this->lang->line('xin_hr_sub_department'); ?>
                                                    <i class="hrsale-asterisk">*</i></label>
                                                <select class="form-control" name="subdepartment_id"
                                                        data-plugin="select_hrm" disabled="disabled"
                                                        data-placeholder="<?php echo $this->lang->line('xin_hr_sub_department'); ?>">
                                                    <option value=""><?php echo $this->lang->line('xin_hr_sub_department'); ?></option>
                                                </select>
                                            </div>
                                        </div>
                                        <?php $colmd = '6';
                                    } else {
                                        $colmd = '6'; ?>
                                        <input type="hidden" name="subdepartment_id" value="YES"/>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date_of_working">Tanggal Mulai Kerja <i
                                                        class="hrsale-asterisk">*</i></label>
                                            <input class="form-control date" readonly id="date_of_working"
                                                   placeholder="Tanggal Mulai Kerja" autocomplete="on"
                                                   name="date_of_working" type="text" value="<?php echo date('Y-m-d'); ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="e_status" class="control-label">Status Karyawan <i
                                                        class="hrsale-asterisk">*</i></label>
                                            <select class="form-control" name="e_status" data-plugin="select_hrm" id="e_status" autocomplete="on"
                                                    data-placeholder="<?php echo $this->lang->line('xin_employee_gender'); ?>">
                                                <option value="contract">Kontrak</option>
                                                <option value="permanent">Tetap</option>
                                                <option value="intern">Magang/KPL</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6" id="designation_ajax">
                                        <div class="form-group">
                                            <label for="designation">Level <i class="hrsale-asterisk">*</i></label>
                                            <select class="form-control" name="designation_id" data-plugin="select_hrm"
                                                    disabled="disabled" autocomplete="on"
                                                    data-placeholder="<?php echo $this->lang->line('xin_designation'); ?>">
                                                <option value=""><?php echo $this->lang->line('xin_designation'); ?></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br>
                        <h5 style="color: #c2c3c5">Lokasi Kerja</h5>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="office_address">Alamat Lengkap <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" id="office_address"
                                                   placeholder="Alamat Lengkap" autocomplete="on"
                                                   name="office_address" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="office_province">Provinsi <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" id="office_province"
                                                   placeholder="Provinsi" autocomplete="on"
                                                   name="office_province" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="office_city" class="control-label">Kota Madya <i
                                                        class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" id="office_city"
                                                   placeholder="Kota Madya" autocomplete="on"
                                                   name="office_city" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="office_district" class="control-label">Kecamatan <i
                                                        class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" id="office_district"
                                                   placeholder="Kecamatan" autocomplete="on"
                                                   name="office_district" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="office_subdistrict">Kelurahan <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="Kelurahan" id="office_subdistrict"
                                                   name="office_subdistrict" type="text" value="">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <br>
                        <h5 style="color: #c2c3c5">Profil Karyawan</h5>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="profile_picture">Upload Foto <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" id="profile_picture" accept="image/png, image/jpeg, image/jpg, image/gif"
                                                   placeholder="Upload Foto" autocomplete="on"
                                                   name="profile_picture" type="file" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nik" class="control-label">NIK KTP <i
                                                        class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="NIK KTP"
                                                   name="nik" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="fullname">Fullname <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control"
                                                   placeholder="Fullname" autocomplete="on"
                                                   name="fullname" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="gender" class="control-label"><?php echo $this->lang->line('xin_employee_gender'); ?></label>
                                            <select class="form-control" name="gender" data-plugin="select_hrm" autocomplete="on"
                                                    data-placeholder="<?php echo $this->lang->line('xin_employee_gender'); ?>">
                                                <option value="Male"><?php echo $this->lang->line('xin_gender_male'); ?></option>
                                                <option value="Female"><?php echo $this->lang->line('xin_gender_female'); ?></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date_of_birth"><?php echo $this->lang->line('xin_employee_dob'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control date" readonly autocomplete="on"
                                                   placeholder="<?php echo $this->lang->line('xin_employee_dob'); ?>"
                                                   name="date_of_birth" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="age" class="control-label">Umur <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="Umur" id="age"
                                                   name="age" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="contact_no"
                                                   class="control-label"><?php echo $this->lang->line('xin_contact_number'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="<?php echo $this->lang->line('xin_contact_number'); ?>"
                                                   name="contact_no" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="education" class="control-label">Pendidikan Terakhir</label>
                                            <select class="form-control" name="education" data-plugin="select_hrm"
                                                    data-placeholder="Pendidikan Terakhir" autocomplete="on">
                                                <option value="SMA">SMA</option>
                                                <option value="S1">S1</option>
                                                <option value="S2">S2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="bpjs_tk" class="control-label">BPJS TK <i
                                                        class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="BPJS TK" id="bpjs_tk"
                                                   name="bpjs_tk" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="bpjs_kes" class="control-label">BPJS Kesehatan <i
                                                        class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="BPJS Kesehatan" id="bpjs_kes"
                                                   name="bpjs_kes" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="address"><?php echo $this->lang->line('xin_employee_address'); ?></label>
                                    <input type="text" class="form-control" id="address" autocomplete="on"
                                           placeholder="<?php echo $this->lang->line('xin_employee_address'); ?>"
                                           name="address">
                                </div>
                            </div>
                        </div>

                        <br>
                        <h5 style="color: #c2c3c5">Social Media</h5>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="facebook_link">Facebook </label>
                                            <input class="form-control" id="facebook_link"
                                                   placeholder="Facebook" autocomplete="on"
                                                   name="facebook_link" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="instagram_link">Instagram </label>
                                            <input class="form-control" id="instagram_link"
                                                   placeholder="Instagram" autocomplete="on"
                                                   name="instagram_link" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="twitter_link">Twitter </label>
                                            <input class="form-control" id="twitter_link"
                                                   placeholder="Twitter" autocomplete="on"
                                                   name="twitter_link" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br>
                        <h5 style="color: #c2c3c5">Kontak Darurat</h5>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="emergency_contact_name">Nama </label>
                                            <input class="form-control" id="emergency_contact_name"
                                                   placeholder="Nama" autocomplete="on"
                                                   name="emergency_contact_name" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="emergency_contact_phone">No Telepon </label>
                                            <input class="form-control" id="emergency_contact_phone"
                                                   placeholder="No Telepon" autocomplete="on"
                                                   name="emergency_contact_phone" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="emergency_contact_relationship">Hubungan </label>
                                            <select class="form-control" name="emergency_contact_relationship" data-plugin="select_hrm"
                                                    data-placeholder="Hubungan" id="emergency_contact_relationship" autocomplete="on">
                                                <option value="Mama">Mama</option>
                                                <option value="Bapak">Bapak</option>
                                                <option value="Kakak">Kakak</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br>
                        <h5 style="color: #c2c3c5">Informasi Login</h5>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="username"><?php echo $this->lang->line('dashboard_username'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="<?php echo $this->lang->line('dashboard_username'); ?>"
                                                   name="username" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="email"
                                                   class="control-label"><?php echo $this->lang->line('dashboard_email'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="<?php echo $this->lang->line('dashboard_email'); ?>"
                                                   name="email" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="xin_employee_password"><?php echo $this->lang->line('xin_employee_password'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="<?php echo $this->lang->line('xin_employee_password'); ?>"
                                                   name="password" type="text" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="confirm_password"
                                                   class="control-label"><?php echo $this->lang->line('xin_employee_cpassword'); ?>
                                                <i class="hrsale-asterisk">*</i></label>
                                            <input class="form-control" autocomplete="on"
                                                   placeholder="<?php echo $this->lang->line('xin_employee_cpassword'); ?>"
                                                   name="confirm_password" type="text" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions box-footer"> <?php echo form_button(array('name' => 'hrsale_form', 'type' => 'submit', 'class' => $this->Xin_model->form_button_class(), 'content' => '<i class="fas fa-check-square"></i> ' . $this->lang->line('xin_save'))); ?> </div>
                    <?php echo form_close(); ?> </div>
            </div>
        </div>
    </div>
<?php } ?>
<?php if ($user_info[0]->user_role_id == 1) { ?>
    <div class="card">
        <div class="card-header with-elements"><span
                    class="card-header-title mr-2"><strong><?php echo $this->lang->line('xin_list_all'); ?></strong> <?php echo $this->lang->line('xin_employees'); ?></span>
            <div class="card-header-elements ml-md-auto"><a href="<?php echo site_url('admin/employees/hr/'); ?>"
                                                            class="text-dark collapsed">
                    <button type="button" class="btn btn-xs btn-primary"><span
                                class="ion ion-ios-cog"></span> <?php echo $this->lang->line('left_employees_directory'); ?>
                    </button>
                </a> <a class="text-dark collapsed" data-toggle="collapse" href="#filter_hrsale" aria-expanded="false">
                    <button type="button" class="btn btn-xs btn-primary"><span
                                class="ion ion-ios-color-filter"></span> <?php echo $this->lang->line('xin_filter'); ?>
                    </button>
                </a> <a href="<?php echo site_url('admin/reports/employees/'); ?>" class="text-dark collapsed">
                    <button type="button" class="btn btn-xs btn-primary"><span
                                class="fas fa-chart-bar"></span> <?php echo $this->lang->line('xin_report'); ?></button>
                </a></div>
        </div>
        <div class="card-body">
            <div class="box-datatable table-responsive">
                <table class="datatables-demo table table-striped table-bordered" id="xin_table">
                    <thead>
                    <tr>
                        <!--            <th>--><?php //echo $this->lang->line('xin_employees_id');?><!--</th>-->
                        <th width="200"><i
                                    class="fa fa-user"></i> <?php echo $this->lang->line('xin_employees_full_name'); ?>
                        </th>
                        <th><?php echo $this->lang->line('left_company'); ?></th>
                        <th><?php echo $this->lang->line('dashboard_contact'); ?></th>
                        <!--            <th>--><?php //echo $this->lang->line('xin_reports_to');?><!--</th>-->
                        <th>Modul</th>
                        <th><?php echo $this->lang->line('xin_employee_role'); ?></th>
                        <th style="width:60px;"><?php echo $this->lang->line('xin_action'); ?></th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
<?php } else { ?>
    <div class="row">
        <div class="col-md-12">
            <!-- Custom Tabs (Pulled to the right) -->
            <div class="nav-tabs-custom">
                <div class="card">
                    <ul class="nav nav-tabs">
                        <?php if (in_array('13', $role_resources_ids)) { ?>
                            <li class="nav-item active"><a class="nav-link active" data-toggle="tab"
                                                           aria-controls="tabIcon11" href="#tab_1-1"
                                                           aria-expanded="true">
                                    <?php echo $this->lang->line('xin_list_all'); ?><?php echo $this->lang->line('xin_employees'); ?></a>
                            </li>
                        <?php } ?>
                        <?php
                        if (!in_array('13', $role_resources_ids)) {
                            $act_cls = 'active';
                        } else {
                            $act_cls = '';
                        }
                        ?>
                        <li class="nav-item"><a class="nav-link <?php echo $act_cls; ?>" data-toggle="tab"
                                                aria-controls="tabIcon12" href="#tab_2-2" aria-expanded="false">
                                <?php echo $this->lang->line('xin_my_team'); ?></a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <?php if (in_array('13', $role_resources_ids)) { ?>
                        <div class="tab-pane active" id="tab_1-1">
                            <div class="card <?php echo $get_animate; ?>">
                                <div class="card-header with-elements"><span
                                            class="card-header-title mr-2"><strong><?php echo $this->lang->line('xin_list_all'); ?></strong> <?php echo $this->lang->line('xin_employees'); ?></span>
                                    <?php if (in_array('88', $role_resources_ids)) { ?>
                                        <div class="card-header-elements ml-md-auto"><a
                                                    href="<?php echo site_url('admin/employees/hr/'); ?>"
                                                    class="text-dark collapsed">
                                                <button type="button" class="btn btn-xs btn-primary"><span
                                                            class="ion ion-ios-cog"></span> <?php echo $this->lang->line('left_employees_directory'); ?>
                                                </button>
                                            </a></div>
                                    <?php } ?>
                                </div>
                                <div class="card-body">
                                    <div class="box-datatable table-responsive">
                                        <table class="datatables-demo table table-striped table-bordered"
                                               id="xin_table">
                                            <thead>
                                            <tr>
                                                <th><?php echo $this->lang->line('xin_employees_id'); ?></th>
                                                <th width="200"><i
                                                            class="fa fa-user"></i> <?php echo $this->lang->line('xin_employees_full_name'); ?>
                                                </th>
                                                <th><?php echo $this->lang->line('left_company'); ?></th>
                                                <th><?php echo $this->lang->line('dashboard_contact'); ?></th>
                                                <th><?php echo $this->lang->line('xin_reports_to'); ?></th>
                                                <th><?php echo $this->lang->line('xin_employee_role'); ?></th>
                                                <th style="width:60px;"><?php echo $this->lang->line('xin_action'); ?></th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <!-- /.tab-pane -->
                    <div class="tab-pane <?php echo $act_cls; ?>" id="tab_2-2">
                        <div class="card <?php echo $get_animate; ?>">
                            <div class="card-header with-elements"><span
                                        class="card-header-title mr-2"><strong><?php echo $this->lang->line('xin_my_team'); ?></strong></span>
                                <?php if (in_array('88', $role_resources_ids)) { ?>
                                    <div class="card-header-elements ml-md-auto"><a
                                                href="<?php echo site_url('admin/employees/hr/'); ?>"
                                                class="text-dark collapsed">
                                            <button type="button" class="btn btn-xs btn-primary"><span
                                                        class="ion ion-ios-cog"></span> <?php echo $this->lang->line('left_employees_directory'); ?>
                                            </button>
                                        </a></div>
                                <?php } ?>
                            </div>
                            <div class="card-body">
                                <div class="box-datatable table-responsive">
                                    <table class="datatables-demo table table-striped table-bordered"
                                           id="xin_my_team_table" style="width:100%;">
                                        <thead>
                                        <tr>
                                            <th><?php echo $this->lang->line('xin_employees_id'); ?></th>
                                            <th width="200"><i
                                                        class="fa fa-user"></i> <?php echo $this->lang->line('xin_employees_full_name'); ?>
                                            </th>
                                            <th><?php echo $this->lang->line('left_company'); ?></th>
                                            <th><?php echo $this->lang->line('dashboard_contact'); ?></th>
                                            <th><?php echo $this->lang->line('xin_reports_to'); ?></th>
                                            <th><?php echo $this->lang->line('xin_employee_role'); ?></th>
                                            <th style="width:60px;"><?php echo $this->lang->line('xin_action'); ?></th>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </div>
<?php } ?>
