CREATE TABLE `accountadmin_accesscategory` (
  `accesscategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `accesscategory_key` varchar(50) NOT NULL DEFAULT '',
  `english_value` text,
  PRIMARY KEY (`accesscategory_id`),
  KEY `ciministry.accountadmin_accesscategory_accesscateg` (`accesscategory_key`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

CREATE TABLE `accountadmin_accessgroup` (
  `accessgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `accesscategory_id` int(11) NOT NULL DEFAULT '0',
  `accessgroup_key` varchar(50) NOT NULL DEFAULT '',
  `english_value` text,
  PRIMARY KEY (`accessgroup_id`),
  KEY `ciministry.accountadmin_accessgroup_accessgroup_ke` (`accessgroup_key`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

CREATE TABLE `accountadmin_accountadminaccess` (
  `accountadminaccess_id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) NOT NULL DEFAULT '0',
  `accountadminaccess_privilege` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountadminaccess_id`),
  KEY `ciministry.accountadmin_accountadminaccess_viewer_` (`viewer_id`),
  KEY `ciministry.accountadmin_accountadminaccess_account` (`accountadminaccess_privilege`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

CREATE TABLE `accountadmin_accountgroup` (
  `accountgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `accountgroup_key` varchar(50) NOT NULL DEFAULT '',
  `accountgroup_label_long` varchar(50) NOT NULL DEFAULT '',
  `english_value` text,
  PRIMARY KEY (`accountgroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

CREATE TABLE `accountadmin_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_key` varchar(25) NOT NULL DEFAULT '',
  `language_code` char(2) NOT NULL DEFAULT '',
  `english_value` text,
  PRIMARY KEY (`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `accountadmin_viewer` (
  `viewer_id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(64) DEFAULT '',
  `accountgroup_id` int(11) NOT NULL DEFAULT '0',
  `viewer_userID` varchar(50) NOT NULL DEFAULT '',
  `viewer_passWord` varchar(50) DEFAULT '',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `viewer_isActive` int(1) NOT NULL DEFAULT '0',
  `viewer_lastLogin` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `email_validated` tinyint(1) DEFAULT NULL,
  `developer` tinyint(1) DEFAULT NULL,
  `facebook_hash` varchar(255) DEFAULT NULL,
  `facebook_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`viewer_id`),
  KEY `ciministry.accountadmin_viewer_accountgroup_id_index` (`accountgroup_id`),
  KEY `ciministry.accountadmin_viewer_viewer_userID_index` (`viewer_userID`),
  CONSTRAINT `FK_viewer_grp` FOREIGN KEY (`accountgroup_id`) REFERENCES `accountadmin_accountgroup` (`accountgroup_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19074 DEFAULT CHARSET=latin1;

CREATE TABLE `accountadmin_vieweraccessgroup` (
  `vieweraccessgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) NOT NULL DEFAULT '0',
  `accessgroup_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vieweraccessgroup_id`),
  KEY `ciministry.accountadmin_vieweraccessgroup_viewer_i` (`viewer_id`),
  KEY `ciministry.accountadmin_vieweraccessgroup_accessgr` (`accessgroup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26107 DEFAULT CHARSET=latin1;

CREATE TABLE `airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `area_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=latin1;

CREATE TABLE `applns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `preference1_id` int(11) DEFAULT NULL,
  `preference2_id` int(11) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `as_intern` tinyint(1) DEFAULT '0',
  `as_team_leader` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `applns_form_id_index` (`form_id`),
  KEY `applns_viewer_id_index` (`viewer_id`),
  KEY `applns_preference1_id_index` (`preference1_id`),
  KEY `applns_preference2_id_index` (`preference2_id`),
  KEY `applns_as_intern_index` (`as_intern`)
) ENGINE=InnoDB AUTO_INCREMENT=8099 DEFAULT CHARSET=latin1;

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `thumbnail` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

CREATE TABLE `attributes_updated_ats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `attr_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74016 DEFAULT CHARSET=latin1;

CREATE TABLE `campus_involvements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ministry_id` int(11) DEFAULT NULL,
  `added_by_id` int(11) DEFAULT NULL,
  `graduation_date` date DEFAULT NULL,
  `school_year_id` int(11) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `minor` varchar(255) DEFAULT NULL,
  `last_history_update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_campus_involvements_on_p_id_and_c_id_and_end_date` (`person_id`,`campus_id`,`end_date`),
  KEY `index_campus_involvements_on_campus_id` (`campus_id`),
  KEY `index_campus_involvements_on_ministry_id` (`ministry_id`),
  KEY `index_campus_involvements_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9894 DEFAULT CHARSET=utf8;

CREATE TABLE `cim_hrdb_access` (
  `access_id` int(50) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(50) NOT NULL DEFAULT '0',
  `person_id` int(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`access_id`),
  KEY `ciministry.cim_hrdb_access_viewer_id_index` (`viewer_id`),
  KEY `ciministry.cim_hrdb_access_person_id_index` (`person_id`),
  CONSTRAINT `FK_access_person` FOREIGN KEY (`person_id`) REFERENCES `cim_hrdb_person` (`person_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18929 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_admin` (
  `admin_id` int(1) NOT NULL AUTO_INCREMENT,
  `person_id` int(50) NOT NULL DEFAULT '0',
  `priv_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  KEY `FK_hrdbadmin_person` (`person_id`),
  KEY `FK_admin_priv` (`priv_id`),
  CONSTRAINT `FK_admin_priv` FOREIGN KEY (`priv_id`) REFERENCES `cim_hrdb_priv` (`priv_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_hrdbadmin_person` FOREIGN KEY (`person_id`) REFERENCES `cim_hrdb_person` (`person_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_assignment` (
  `assignment_id` int(50) NOT NULL AUTO_INCREMENT,
  `person_id` int(50) NOT NULL DEFAULT '0',
  `campus_id` int(50) NOT NULL DEFAULT '0',
  `assignmentstatus_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assignment_id`),
  KEY `ciministry.cim_hrdb_assignment_person_id_index` (`person_id`),
  KEY `ciministry.cim_hrdb_assignment_campus_id_index` (`campus_id`),
  CONSTRAINT `FK_assign_campus` FOREIGN KEY (`campus_id`) REFERENCES `cim_hrdb_campus` (`campus_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_assign_person` FOREIGN KEY (`person_id`) REFERENCES `cim_hrdb_person` (`person_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8491 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_assignmentstatus` (
  `assignmentstatus_id` int(10) NOT NULL AUTO_INCREMENT,
  `assignmentstatus_desc` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`assignmentstatus_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `cim_hrdb_campus` (
  `campus_id` int(50) NOT NULL AUTO_INCREMENT,
  `campus_desc` varchar(128) NOT NULL DEFAULT '',
  `campus_shortDesc` varchar(50) NOT NULL DEFAULT '',
  `accountgroup_id` int(11) DEFAULT '0',
  `region_id` int(11) DEFAULT '0',
  `campus_website` varchar(255) DEFAULT '',
  `campus_facebookgroup` varchar(255) DEFAULT NULL,
  `campus_gcxnamespace` varchar(255) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`campus_id`),
  KEY `ciministry.cim_hrdb_campus_region_id_index` (`region_id`),
  KEY `ciministry.cim_hrdb_campus_accountgroup_id_index` (`accountgroup_id`),
  KEY `index_ciministry.cim_hrdb_campus_on_longitude` (`longitude`),
  KEY `index_ciministry.cim_hrdb_campus_on_latitude` (`latitude`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_country` (
  `country_id` int(50) NOT NULL AUTO_INCREMENT,
  `country_desc` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `country_shortDesc` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `cim_hrdb_emerg` (
  `emerg_id` int(16) NOT NULL AUTO_INCREMENT,
  `person_id` int(16) NOT NULL DEFAULT '0',
  `emerg_passportNum` varchar(32) NOT NULL DEFAULT '',
  `emerg_passportOrigin` varchar(32) NOT NULL DEFAULT '',
  `emerg_passportExpiry` date NOT NULL DEFAULT '0000-00-00',
  `emerg_contactName` varchar(64) NOT NULL DEFAULT '',
  `emerg_contactRship` varchar(64) NOT NULL DEFAULT '',
  `emerg_contactHome` varchar(32) NOT NULL DEFAULT '',
  `emerg_contactWork` varchar(32) NOT NULL DEFAULT '',
  `emerg_contactMobile` varchar(32) NOT NULL DEFAULT '',
  `emerg_contactEmail` varchar(32) NOT NULL DEFAULT '',
  `emerg_birthdate` date NOT NULL DEFAULT '0000-00-00',
  `emerg_medicalNotes` text NOT NULL,
  `emerg_contact2Name` varchar(64) NOT NULL,
  `emerg_contact2Rship` varchar(64) NOT NULL,
  `emerg_contact2Home` varchar(64) NOT NULL,
  `emerg_contact2Work` varchar(64) NOT NULL,
  `emerg_contact2Mobile` varchar(64) NOT NULL,
  `emerg_contact2Email` varchar(64) NOT NULL,
  `emerg_meds` text NOT NULL,
  `health_province_id` int(11) DEFAULT NULL,
  `health_number` varchar(255) DEFAULT NULL,
  `medical_plan_number` varchar(255) DEFAULT NULL,
  `medical_plan_carrier` varchar(255) DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `doctor_phone` varchar(255) DEFAULT NULL,
  `dentist_name` varchar(255) DEFAULT NULL,
  `dentist_phone` varchar(255) DEFAULT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `blood_rh_factor` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `health_coverage_country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emerg_id`),
  KEY `ciministry.cim_hrdb_emerg_person_id_index` (`person_id`),
  CONSTRAINT `FK_emerg_person` FOREIGN KEY (`person_id`) REFERENCES `cim_hrdb_person` (`person_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11898 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_gender` (
  `gender_id` int(50) NOT NULL AUTO_INCREMENT,
  `gender_desc` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`gender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_person` (
  `person_id` int(50) NOT NULL AUTO_INCREMENT,
  `person_fname` varchar(50) NOT NULL DEFAULT '',
  `person_lname` varchar(50) NOT NULL DEFAULT '',
  `person_legal_fname` varchar(50) NOT NULL,
  `person_legal_lname` varchar(50) NOT NULL,
  `person_phone` varchar(50) NOT NULL DEFAULT '',
  `person_email` varchar(128) NOT NULL DEFAULT '',
  `person_addr` varchar(128) NOT NULL DEFAULT '',
  `person_city` varchar(50) NOT NULL DEFAULT '',
  `province_id` int(50) NOT NULL DEFAULT '0',
  `person_pc` varchar(50) NOT NULL DEFAULT '',
  `gender_id` int(50) NOT NULL DEFAULT '0',
  `person_local_phone` varchar(50) NOT NULL DEFAULT '',
  `person_local_addr` varchar(128) NOT NULL DEFAULT '',
  `person_local_city` varchar(50) NOT NULL DEFAULT '',
  `person_local_pc` varchar(50) NOT NULL DEFAULT '',
  `person_local_province_id` int(50) NOT NULL DEFAULT '0',
  `cell_phone` varchar(255) DEFAULT NULL,
  `local_valid_until` date DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `person_local_country_id` int(11) DEFAULT NULL,
  `person_mname` varchar(255) DEFAULT NULL,
  `person_mentor_id` int(11) DEFAULT NULL,
  `person_mentees_lft` int(11) DEFAULT NULL,
  `person_mentees_rgt` int(11) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `civicrm_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `ciministry.cim_hrdb_person_gender_id_index` (`gender_id`),
  KEY `ciministry.cim_hrdb_person_province_id_index` (`province_id`),
  KEY `index_ciministry.cim_hrdb_person_on_person_email` (`person_email`),
  KEY `index_ciministry.cim_hrdb_person_on_person_mentor_id` (`person_mentor_id`),
  KEY `index_ciministry.cim_hrdb_person_on_person_fname` (`person_fname`),
  KEY `index_ciministry.cim_hrdb_person_on_person_lname` (`person_lname`),
  KEY `index_emu.cim_hrdb_person_on_civicrm_id` (`civicrm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1401054061 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_person_year` (
  `personyear_id` int(50) NOT NULL AUTO_INCREMENT,
  `person_id` int(50) NOT NULL DEFAULT '0',
  `year_id` int(50) NOT NULL DEFAULT '0',
  `grad_date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`personyear_id`),
  KEY `FK_cim_hrdb_person_year` (`person_id`),
  KEY `1` (`year_id`),
  CONSTRAINT `1` FOREIGN KEY (`year_id`) REFERENCES `cim_hrdb_year_in_school` (`year_id`),
  CONSTRAINT `FK_year_person` FOREIGN KEY (`person_id`) REFERENCES `cim_hrdb_person` (`person_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3916 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `cim_hrdb_priv` (
  `priv_id` int(20) NOT NULL AUTO_INCREMENT,
  `priv_accesslevel` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_province` (
  `province_id` int(50) NOT NULL AUTO_INCREMENT,
  `province_desc` varchar(50) NOT NULL DEFAULT '',
  `province_shortDesc` varchar(50) NOT NULL DEFAULT '',
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_region` (
  `region_id` int(50) NOT NULL AUTO_INCREMENT,
  `reg_desc` varchar(64) NOT NULL DEFAULT '',
  `country_id` int(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `FK_region_country` (`country_id`),
  CONSTRAINT `FK_region_country` FOREIGN KEY (`country_id`) REFERENCES `cim_hrdb_country` (`country_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_staff` (
  `staff_id` int(50) NOT NULL AUTO_INCREMENT,
  `person_id` int(50) NOT NULL DEFAULT '0',
  `is_active` int(1) NOT NULL DEFAULT '1',
  `view_all_campuses` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `unique_person` (`person_id`),
  KEY `ciministry.cim_hrdb_staff_person_id_index` (`person_id`),
  CONSTRAINT `FK_staff_person` FOREIGN KEY (`person_id`) REFERENCES `cim_hrdb_person` (`person_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `cim_hrdb_year_in_school` (
  `year_id` int(11) NOT NULL AUTO_INCREMENT,
  `year_desc` char(50) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `translation_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `cost_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `optional` tinyint(1) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cost_items_type_index` (`type`),
  KEY `cost_items_year_index` (`year`),
  KEY `index_cost_items_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1450 DEFAULT CHARSET=latin1;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=latin1;

CREATE TABLE `custom_element_hidden_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

CREATE TABLE `custom_element_required_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=latin1;

CREATE TABLE `donation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `donation_types_description_index` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `event_group_resource_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_group_resource_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=latin1;

CREATE TABLE `event_group_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_group_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=latin1;

CREATE TABLE `event_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `long_desc` varchar(255) DEFAULT NULL,
  `default_text_area_length` int(11) DEFAULT '4000',
  `has_your_campuses` tinyint(1) DEFAULT NULL,
  `outgoing_email` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `content_type` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `show_mpdtool` tinyint(1) DEFAULT '0',
  `allows_multiple_applications_with_same_form` tinyint(1) DEFAULT NULL,
  `pat_title` varchar(255) DEFAULT NULL,
  `show_dates_as_distance` tinyint(1) DEFAULT '0',
  `automatic_acceptance` tinyint(1) DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `cost_item_instructions` varchar(255) DEFAULT NULL,
  `cost_item_phrase` varchar(255) DEFAULT NULL,
  `hide_profile_cost_item_link` tinyint(1) DEFAULT '0',
  `submit_text` text,
  `key_logo_attachment_id` int(11) DEFAULT NULL,
  `forward_to_cas` tinyint(1) DEFAULT '0',
  `record_of_funds_attachment_id` int(11) DEFAULT NULL,
  `support_address` text,
  `support_email` varchar(255) DEFAULT NULL,
  `has_interns` tinyint(1) DEFAULT '1',
  `has_team_leaders` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

CREATE TABLE `eventgroup_coordinators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) DEFAULT NULL,
  `feedback_type` text,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedbacks_viewer_id_index` (`viewer_id`),
  KEY `index_feedbacks_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

CREATE TABLE `form_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `answer` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_answers_question_id_index` (`question_id`,`instance_id`),
  KEY `form_answers_instance_id_index` (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=960796 DEFAULT CHARSET=latin1;

CREATE TABLE `form_element_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `flag_id` int(11) DEFAULT NULL,
  `value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_element_flags_element_id_index` (`element_id`),
  KEY `form_element_flags_flag_id_index` (`flag_id`),
  KEY `form_element_flags_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5738 DEFAULT CHARSET=latin1;

CREATE TABLE `form_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `text` text,
  `is_required` tinyint(1) DEFAULT NULL,
  `question_table` varchar(50) DEFAULT NULL,
  `question_column` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `dependency_id` int(11) DEFAULT NULL,
  `max_length` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `form_elements_parent_id_index` (`parent_id`),
  KEY `form_elements_type_index` (`type`),
  KEY `form_elements_position_index` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=48868 DEFAULT CHARSET=latin1;

CREATE TABLE `form_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `element_txt` varchar(255) DEFAULT NULL,
  `group_txt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `form_page_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `element_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_page_elements_page_id_index` (`page_id`),
  KEY `form_page_elements_element_id_index` (`element_id`),
  KEY `form_page_elements_position_index` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=22070 DEFAULT CHARSET=latin1;

CREATE TABLE `form_page_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `flag_id` int(11) DEFAULT NULL,
  `value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_page_flags_page_id_index` (`page_id`),
  KEY `form_page_flags_flag_id_index` (`flag_id`),
  KEY `form_page_flags_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=latin1;

CREATE TABLE `form_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `url_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4284 DEFAULT CHARSET=latin1;

CREATE TABLE `form_question_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `option` varchar(256) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_question_options_question_id_index` (`question_id`),
  KEY `form_question_options_option_index` (`option`),
  KEY `form_question_options_value_index` (`value`),
  KEY `form_question_options_position_index` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=33803 DEFAULT CHARSET=latin1;

CREATE TABLE `form_questionnaire_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_questionnaire_pages_questionnaire_id_index` (`questionnaire_id`),
  KEY `form_questionnaire_pages_page_id_index` (`page_id`),
  KEY `form_questionnaire_pages_position_index` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=4284 DEFAULT CHARSET=latin1;

CREATE TABLE `form_reference_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;

CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forms_questionnaire_id_index` (`questionnaire_id`),
  KEY `index_forms_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=latin1;

CREATE TABLE `involvement_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `school_year_id` int(11) DEFAULT NULL,
  `ministry_id` int(11) DEFAULT NULL,
  `ministry_role_id` int(11) DEFAULT NULL,
  `campus_involvement_id` int(11) DEFAULT NULL,
  `ministry_involvement_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4771 DEFAULT CHARSET=utf8;

CREATE TABLE `manual_donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivation_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `donor_name` varchar(255) DEFAULT NULL,
  `donation_type_id` int(11) DEFAULT NULL,
  `original_amount` decimal(8,2) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `conversion_rate` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manual_donations_motivation_code_index` (`motivation_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6140 DEFAULT CHARSET=latin1;

CREATE TABLE `ministries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `ministries_count` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ministries_on_parent_id` (`parent_id`),
  KEY `index_emu.ministries_on_lft` (`lft`),
  KEY `index_emu.ministries_on_rgt` (`rgt`),
  KEY `index_emu.ministries_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

CREATE TABLE `ministry_campuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ministry_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_ministry_campuses_on_ministry_id_and_campus_id` (`ministry_id`,`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

CREATE TABLE `ministry_involvements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `ministry_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `ministry_role_id` int(11) DEFAULT NULL,
  `responsible_person_id` int(11) DEFAULT NULL,
  `last_history_update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ministry_involvements_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14775 DEFAULT CHARSET=utf8;

CREATE TABLE `ministry_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ministry_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `involved` tinyint(1) DEFAULT NULL,
  `translation_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ministry_roles_on_ministry_id` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

CREATE TABLE `notification_acknowledgments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `message` text,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `ignore_begin` tinyint(1) DEFAULT NULL,
  `ignore_end` tinyint(1) DEFAULT NULL,
  `no_hide_button` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `allow_html` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `optin_cost_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `cost_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `optin_cost_items_profile_id_index` (`profile_id`),
  KEY `optin_cost_items_cost_item_id_index` (`cost_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2705 DEFAULT CHARSET=latin1;

CREATE TABLE `person_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `minor` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `staff_notes` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `perm_start_date` date DEFAULT NULL,
  `perm_end_date` date DEFAULT NULL,
  `perm_dorm` varchar(255) DEFAULT NULL,
  `perm_room` varchar(255) DEFAULT NULL,
  `perm_alternate_phone` varchar(255) DEFAULT NULL,
  `curr_start_date` date DEFAULT NULL,
  `curr_end_date` date DEFAULT NULL,
  `curr_dorm` varchar(255) DEFAULT NULL,
  `curr_room` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_person_extras_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22468 DEFAULT CHARSET=utf8;

CREATE TABLE `plugin_schema_info` (
  `plugin_name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preferences_viewer_id_index` (`viewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `prep_item_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

CREATE TABLE `prep_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `deadline` date DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `individual` tinyint(1) DEFAULT '0',
  `deadline_optional` tinyint(1) DEFAULT '0',
  `prep_item_category_id` int(11) DEFAULT NULL,
  `paperwork` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=latin1;

CREATE TABLE `prep_items_projects` (
  `prep_item_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `processor_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appln_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `processor_forms_appln_id_index` (`appln_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3646 DEFAULT CHARSET=latin1;

CREATE TABLE `processors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `processors_project_id_index` (`project_id`),
  KEY `processors_viewer_id_index` (`viewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=653 DEFAULT CHARSET=latin1;

CREATE TABLE `profile_donations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `auto_donation_id` int(11) DEFAULT NULL,
  `manual_donation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_donations_profile_id_index` (`profile_id`),
  KEY `profile_donations_type_index` (`type`),
  KEY `profile_donations_auto_donation_id_index` (`auto_donation_id`),
  KEY `profile_donations_manual_donation_id_index` (`manual_donation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84736 DEFAULT CHARSET=latin1;

CREATE TABLE `profile_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `profile_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=latin1;

CREATE TABLE `profile_prep_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `prep_item_id` int(11) DEFAULT NULL,
  `notes` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `checked_in` tinyint(1) DEFAULT '0',
  `received_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profile_prep_items_on_prep_item_id` (`prep_item_id`),
  KEY `index_profile_prep_items_on_profile_id` (`profile_id`),
  KEY `index_profile_prep_items_on_prep_item_id_and_profile_id` (`prep_item_id`,`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17038 DEFAULT CHARSET=latin1;

CREATE TABLE `profile_travel_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `travel_segment_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `eticket` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `confirmation_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_travel_segments_profile_id_index` (`profile_id`),
  KEY `profile_travel_segments_travel_segment_id_index` (`travel_segment_id`),
  KEY `profile_travel_segments_position_index` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=11214 DEFAULT CHARSET=latin1;

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appln_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `support_coach_id` int(11) DEFAULT NULL,
  `support_claimed` float DEFAULT NULL,
  `accepted_by_viewer_id` int(11) DEFAULT NULL,
  `as_intern` tinyint(1) DEFAULT '0',
  `motivation_code` varchar(255) DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `locked_by` int(11) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `accepted_by` int(11) DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `withdrawn_by` int(11) DEFAULT NULL,
  `withdrawn_at` datetime DEFAULT NULL,
  `status_when_withdrawn` varchar(255) DEFAULT NULL,
  `class_when_withdrawn` varchar(255) DEFAULT NULL,
  `reason_id` int(11) DEFAULT NULL,
  `reason_notes` varchar(255) DEFAULT NULL,
  `support_claimed_updated_at` datetime DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `cached_costing_total` decimal(8,2) DEFAULT NULL,
  `reuse_appln_id` int(11) DEFAULT NULL,
  `seen_help` tinyint(1) DEFAULT '0',
  `as_team_leader` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `profiles_appln_id_index` (`appln_id`),
  KEY `profiles_project_id_index` (`project_id`),
  KEY `profiles_support_coach_id_index` (`support_coach_id`),
  KEY `profiles_type_index` (`type`),
  KEY `profiles_viewer_id_index` (`viewer_id`),
  KEY `profiles_accepted_by_index` (`accepted_by`),
  KEY `profiles_locked_by_index` (`locked_by`),
  KEY `profiles_withdrawn_by_index` (`withdrawn_by`),
  KEY `profiles_reason_id_index` (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9481 DEFAULT CHARSET=latin1;

CREATE TABLE `project_administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_administrators_project_id_index` (`project_id`),
  KEY `project_administrators_viewer_id_index` (`viewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=latin1;

CREATE TABLE `project_directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_directors_project_id_index` (`project_id`),
  KEY `project_directors_viewer_id_index` (`viewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=latin1;

CREATE TABLE `project_donations` (
  `participant_motv_code` varchar(10) NOT NULL DEFAULT '',
  `participant_external_id` varchar(10) NOT NULL DEFAULT '',
  `donation_date` datetime DEFAULT '0000-00-00 00:00:00',
  `donation_reference_number` varchar(10) DEFAULT '',
  `donor_name` varchar(100) DEFAULT '',
  `donation_type` varchar(10) DEFAULT '',
  `original_amount` float DEFAULT '0',
  `amount` float DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `project_donations_participant_motv_code_index` (`participant_motv_code`)
) ENGINE=MyISAM AUTO_INCREMENT=53271 DEFAULT CHARSET=latin1 COMMENT='Truncated and re-loaded nightly by a DTS pkg on SQL2000-SRV';

CREATE TABLE `project_staffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_staffs_project_id_index` (`project_id`),
  KEY `project_staffs_viewer_id_index` (`viewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=836 DEFAULT CHARSET=latin1;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  `cost_center` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `hide_from_profile` tinyint(1) DEFAULT '0',
  `pulse_name` varchar(255) DEFAULT NULL,
  `itinerary_available` date DEFAULT NULL,
  `support_deadline` date DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `applicants_own_support_urls` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_projects_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=latin1;

CREATE TABLE `projects_coordinators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

CREATE TABLE `questionnaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=latin1;

CREATE TABLE `reason_for_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blurb` varchar(255) DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reason_for_withdrawals_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `reference_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_type` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `text` text,
  `event_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reference_emails_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1146 DEFAULT CHARSET=latin1;

CREATE TABLE `reference_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `email_sent_at` datetime DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `accountNo` varchar(255) DEFAULT NULL,
  `home_phone` varchar(255) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `mail` tinyint(1) DEFAULT '0',
  `email_sent` tinyint(1) DEFAULT '0',
  `reference_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appln_references_appln_id_index` (`instance_id`),
  KEY `appln_references_status_index` (`status`),
  KEY `appln_references_access_key_index` (`access_key`)
) ENGINE=InnoDB AUTO_INCREMENT=13207 DEFAULT CHARSET=latin1;

CREATE TABLE `report_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `element_id` int(11) DEFAULT NULL,
  `report_model_method_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `cost_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2847 DEFAULT CHARSET=latin1;

CREATE TABLE `report_model_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_model_id` int(11) DEFAULT NULL,
  `method_s` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

CREATE TABLE `report_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_s` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  `include_accepted` tinyint(1) DEFAULT '1',
  `include_applying` tinyint(1) DEFAULT '0',
  `include_staff` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=latin1;

CREATE TABLE `resource_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2308893 DEFAULT CHARSET=latin1;

CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `staff_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `ministry_role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;

CREATE TABLE `support_coaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_coaches_project_id_index` (`project_id`),
  KEY `support_coaches_viewer_id_index` (`viewer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1;

CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagee_type` varchar(255) DEFAULT NULL,
  `tagee_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taggings_tagee_type_index` (`tagee_type`),
  KEY `taggings_tagee_id_index` (`tagee_id`),
  KEY `taggings_tag_id_index` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2510 DEFAULT CHARSET=latin1;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `event_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tags_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;

CREATE TABLE `travel_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `departure_city` varchar(255) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `carrier` varchar(255) DEFAULT NULL,
  `arrival_city` varchar(255) DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `flight_no` varchar(255) DEFAULT NULL,
  `notes` text,
  `event_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_segments_year_index` (`year`),
  KEY `travel_segments_departure_city_index` (`departure_city`),
  KEY `travel_segments_departure_time_index` (`departure_time`),
  KEY `travel_segments_carrier_index` (`carrier`),
  KEY `travel_segments_arrival_city_index` (`arrival_city`),
  KEY `travel_segments_arrival_time_index` (`arrival_time`),
  KEY `travel_segments_flight_no_index` (`flight_no`),
  KEY `index_travel_segments_on_event_group_id` (`event_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3433 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('10');

INSERT INTO schema_migrations (version) VALUES ('100');

INSERT INTO schema_migrations (version) VALUES ('101');

INSERT INTO schema_migrations (version) VALUES ('102');

INSERT INTO schema_migrations (version) VALUES ('103');

INSERT INTO schema_migrations (version) VALUES ('104');

INSERT INTO schema_migrations (version) VALUES ('105');

INSERT INTO schema_migrations (version) VALUES ('106');

INSERT INTO schema_migrations (version) VALUES ('107');

INSERT INTO schema_migrations (version) VALUES ('108');

INSERT INTO schema_migrations (version) VALUES ('109');

INSERT INTO schema_migrations (version) VALUES ('11');

INSERT INTO schema_migrations (version) VALUES ('110');

INSERT INTO schema_migrations (version) VALUES ('111');

INSERT INTO schema_migrations (version) VALUES ('112');

INSERT INTO schema_migrations (version) VALUES ('113');

INSERT INTO schema_migrations (version) VALUES ('114');

INSERT INTO schema_migrations (version) VALUES ('115');

INSERT INTO schema_migrations (version) VALUES ('116');

INSERT INTO schema_migrations (version) VALUES ('117');

INSERT INTO schema_migrations (version) VALUES ('118');

INSERT INTO schema_migrations (version) VALUES ('119');

INSERT INTO schema_migrations (version) VALUES ('12');

INSERT INTO schema_migrations (version) VALUES ('120');

INSERT INTO schema_migrations (version) VALUES ('121');

INSERT INTO schema_migrations (version) VALUES ('122');

INSERT INTO schema_migrations (version) VALUES ('123');

INSERT INTO schema_migrations (version) VALUES ('124');

INSERT INTO schema_migrations (version) VALUES ('125');

INSERT INTO schema_migrations (version) VALUES ('126');

INSERT INTO schema_migrations (version) VALUES ('127');

INSERT INTO schema_migrations (version) VALUES ('128');

INSERT INTO schema_migrations (version) VALUES ('129');

INSERT INTO schema_migrations (version) VALUES ('13');

INSERT INTO schema_migrations (version) VALUES ('130');

INSERT INTO schema_migrations (version) VALUES ('131');

INSERT INTO schema_migrations (version) VALUES ('14');

INSERT INTO schema_migrations (version) VALUES ('15');

INSERT INTO schema_migrations (version) VALUES ('16');

INSERT INTO schema_migrations (version) VALUES ('17');

INSERT INTO schema_migrations (version) VALUES ('18');

INSERT INTO schema_migrations (version) VALUES ('19');

INSERT INTO schema_migrations (version) VALUES ('2');

INSERT INTO schema_migrations (version) VALUES ('20');

INSERT INTO schema_migrations (version) VALUES ('20080101010101');

INSERT INTO schema_migrations (version) VALUES ('20080101010102');

INSERT INTO schema_migrations (version) VALUES ('20080101010103');

INSERT INTO schema_migrations (version) VALUES ('20080101010104');

INSERT INTO schema_migrations (version) VALUES ('20080101010105');

INSERT INTO schema_migrations (version) VALUES ('20080101010106');

INSERT INTO schema_migrations (version) VALUES ('20080101010107');

INSERT INTO schema_migrations (version) VALUES ('20080101010108');

INSERT INTO schema_migrations (version) VALUES ('20080101010109');

INSERT INTO schema_migrations (version) VALUES ('20080101010110');

INSERT INTO schema_migrations (version) VALUES ('20080101010111');

INSERT INTO schema_migrations (version) VALUES ('20090101010101');

INSERT INTO schema_migrations (version) VALUES ('20090101010102');

INSERT INTO schema_migrations (version) VALUES ('20090101010103');

INSERT INTO schema_migrations (version) VALUES ('20090101010104');

INSERT INTO schema_migrations (version) VALUES ('20090101010105');

INSERT INTO schema_migrations (version) VALUES ('20090101010106');

INSERT INTO schema_migrations (version) VALUES ('20090101010107');

INSERT INTO schema_migrations (version) VALUES ('20090101010108');

INSERT INTO schema_migrations (version) VALUES ('20090102010101');

INSERT INTO schema_migrations (version) VALUES ('20090102010102');

INSERT INTO schema_migrations (version) VALUES ('20090102010103');

INSERT INTO schema_migrations (version) VALUES ('20090102010104');

INSERT INTO schema_migrations (version) VALUES ('20090102010105');

INSERT INTO schema_migrations (version) VALUES ('20090120044744');

INSERT INTO schema_migrations (version) VALUES ('20090120052126');

INSERT INTO schema_migrations (version) VALUES ('20090129213833');

INSERT INTO schema_migrations (version) VALUES ('20090129214108');

INSERT INTO schema_migrations (version) VALUES ('20090130205018');

INSERT INTO schema_migrations (version) VALUES ('20090131030011');

INSERT INTO schema_migrations (version) VALUES ('20090205164903');

INSERT INTO schema_migrations (version) VALUES ('20090205220010');

INSERT INTO schema_migrations (version) VALUES ('20090206162831');

INSERT INTO schema_migrations (version) VALUES ('20090211194433');

INSERT INTO schema_migrations (version) VALUES ('20090224210454');

INSERT INTO schema_migrations (version) VALUES ('20090225160126');

INSERT INTO schema_migrations (version) VALUES ('20090225192649');

INSERT INTO schema_migrations (version) VALUES ('20090227170135');

INSERT INTO schema_migrations (version) VALUES ('20090227173846');

INSERT INTO schema_migrations (version) VALUES ('20090311170722');

INSERT INTO schema_migrations (version) VALUES ('20090324195822');

INSERT INTO schema_migrations (version) VALUES ('20090602030150');

INSERT INTO schema_migrations (version) VALUES ('20090719234529');

INSERT INTO schema_migrations (version) VALUES ('20090916173113');

INSERT INTO schema_migrations (version) VALUES ('20100319192222');

INSERT INTO schema_migrations (version) VALUES ('20100511211337');

INSERT INTO schema_migrations (version) VALUES ('20100513144433');

INSERT INTO schema_migrations (version) VALUES ('20100514021149');

INSERT INTO schema_migrations (version) VALUES ('20100514021717');

INSERT INTO schema_migrations (version) VALUES ('20110624165737');

INSERT INTO schema_migrations (version) VALUES ('20110627195823');

INSERT INTO schema_migrations (version) VALUES ('20110704181406');

INSERT INTO schema_migrations (version) VALUES ('20110719155924');

INSERT INTO schema_migrations (version) VALUES ('20110803110149');

INSERT INTO schema_migrations (version) VALUES ('20110803125340');

INSERT INTO schema_migrations (version) VALUES ('20110804195039');

INSERT INTO schema_migrations (version) VALUES ('20110829181544');

INSERT INTO schema_migrations (version) VALUES ('20110829185446');

INSERT INTO schema_migrations (version) VALUES ('20110927160835');

INSERT INTO schema_migrations (version) VALUES ('20110927212829');

INSERT INTO schema_migrations (version) VALUES ('20110929170203');

INSERT INTO schema_migrations (version) VALUES ('20111003150523');

INSERT INTO schema_migrations (version) VALUES ('20111021153332');

INSERT INTO schema_migrations (version) VALUES ('20120322191853');

INSERT INTO schema_migrations (version) VALUES ('20120322192523');

INSERT INTO schema_migrations (version) VALUES ('20120327165547');

INSERT INTO schema_migrations (version) VALUES ('20120821201902');

INSERT INTO schema_migrations (version) VALUES ('20121009085913');

INSERT INTO schema_migrations (version) VALUES ('20121009131315');

INSERT INTO schema_migrations (version) VALUES ('20121011162936');

INSERT INTO schema_migrations (version) VALUES ('20121011170312');

INSERT INTO schema_migrations (version) VALUES ('20121011170436');

INSERT INTO schema_migrations (version) VALUES ('20121012034309');

INSERT INTO schema_migrations (version) VALUES ('20121012034801');

INSERT INTO schema_migrations (version) VALUES ('20121012050528');

INSERT INTO schema_migrations (version) VALUES ('20121019041255');

INSERT INTO schema_migrations (version) VALUES ('20121019044012');

INSERT INTO schema_migrations (version) VALUES ('20121107201422');

INSERT INTO schema_migrations (version) VALUES ('20121107202023');

INSERT INTO schema_migrations (version) VALUES ('20121108201616');

INSERT INTO schema_migrations (version) VALUES ('20121109211139');

INSERT INTO schema_migrations (version) VALUES ('20121112192947');

INSERT INTO schema_migrations (version) VALUES ('20121112220650');

INSERT INTO schema_migrations (version) VALUES ('20121127231025');

INSERT INTO schema_migrations (version) VALUES ('20121127233906');

INSERT INTO schema_migrations (version) VALUES ('20121203193119');

INSERT INTO schema_migrations (version) VALUES ('20121203210528');

INSERT INTO schema_migrations (version) VALUES ('20140228223919');

INSERT INTO schema_migrations (version) VALUES ('20140303163727');

INSERT INTO schema_migrations (version) VALUES ('20140304225227');

INSERT INTO schema_migrations (version) VALUES ('20140304230800');

INSERT INTO schema_migrations (version) VALUES ('20140328193302');

INSERT INTO schema_migrations (version) VALUES ('20140405001244');

INSERT INTO schema_migrations (version) VALUES ('20140923143519');

INSERT INTO schema_migrations (version) VALUES ('20140923155829');

INSERT INTO schema_migrations (version) VALUES ('20140923172233');

INSERT INTO schema_migrations (version) VALUES ('20150406222201');

INSERT INTO schema_migrations (version) VALUES ('20150409165036');

INSERT INTO schema_migrations (version) VALUES ('21');

INSERT INTO schema_migrations (version) VALUES ('22');

INSERT INTO schema_migrations (version) VALUES ('23');

INSERT INTO schema_migrations (version) VALUES ('24');

INSERT INTO schema_migrations (version) VALUES ('25');

INSERT INTO schema_migrations (version) VALUES ('26');

INSERT INTO schema_migrations (version) VALUES ('27');

INSERT INTO schema_migrations (version) VALUES ('28');

INSERT INTO schema_migrations (version) VALUES ('29');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('30');

INSERT INTO schema_migrations (version) VALUES ('31');

INSERT INTO schema_migrations (version) VALUES ('32');

INSERT INTO schema_migrations (version) VALUES ('33');

INSERT INTO schema_migrations (version) VALUES ('35');

INSERT INTO schema_migrations (version) VALUES ('36');

INSERT INTO schema_migrations (version) VALUES ('37');

INSERT INTO schema_migrations (version) VALUES ('38');

INSERT INTO schema_migrations (version) VALUES ('39');

INSERT INTO schema_migrations (version) VALUES ('4');

INSERT INTO schema_migrations (version) VALUES ('40');

INSERT INTO schema_migrations (version) VALUES ('41');

INSERT INTO schema_migrations (version) VALUES ('42');

INSERT INTO schema_migrations (version) VALUES ('43');

INSERT INTO schema_migrations (version) VALUES ('44');

INSERT INTO schema_migrations (version) VALUES ('45');

INSERT INTO schema_migrations (version) VALUES ('46');

INSERT INTO schema_migrations (version) VALUES ('47');

INSERT INTO schema_migrations (version) VALUES ('48');

INSERT INTO schema_migrations (version) VALUES ('49');

INSERT INTO schema_migrations (version) VALUES ('5');

INSERT INTO schema_migrations (version) VALUES ('51');

INSERT INTO schema_migrations (version) VALUES ('52');

INSERT INTO schema_migrations (version) VALUES ('53');

INSERT INTO schema_migrations (version) VALUES ('54');

INSERT INTO schema_migrations (version) VALUES ('55');

INSERT INTO schema_migrations (version) VALUES ('56');

INSERT INTO schema_migrations (version) VALUES ('57');

INSERT INTO schema_migrations (version) VALUES ('58');

INSERT INTO schema_migrations (version) VALUES ('59');

INSERT INTO schema_migrations (version) VALUES ('6');

INSERT INTO schema_migrations (version) VALUES ('60');

INSERT INTO schema_migrations (version) VALUES ('61');

INSERT INTO schema_migrations (version) VALUES ('62');

INSERT INTO schema_migrations (version) VALUES ('63');

INSERT INTO schema_migrations (version) VALUES ('64');

INSERT INTO schema_migrations (version) VALUES ('65');

INSERT INTO schema_migrations (version) VALUES ('66');

INSERT INTO schema_migrations (version) VALUES ('67');

INSERT INTO schema_migrations (version) VALUES ('68');

INSERT INTO schema_migrations (version) VALUES ('69');

INSERT INTO schema_migrations (version) VALUES ('7');

INSERT INTO schema_migrations (version) VALUES ('70');

INSERT INTO schema_migrations (version) VALUES ('71');

INSERT INTO schema_migrations (version) VALUES ('72');

INSERT INTO schema_migrations (version) VALUES ('73');

INSERT INTO schema_migrations (version) VALUES ('74');

INSERT INTO schema_migrations (version) VALUES ('75');

INSERT INTO schema_migrations (version) VALUES ('76');

INSERT INTO schema_migrations (version) VALUES ('77');

INSERT INTO schema_migrations (version) VALUES ('78');

INSERT INTO schema_migrations (version) VALUES ('79');

INSERT INTO schema_migrations (version) VALUES ('8');

INSERT INTO schema_migrations (version) VALUES ('80');

INSERT INTO schema_migrations (version) VALUES ('81');

INSERT INTO schema_migrations (version) VALUES ('82');

INSERT INTO schema_migrations (version) VALUES ('83');

INSERT INTO schema_migrations (version) VALUES ('84');

INSERT INTO schema_migrations (version) VALUES ('85');

INSERT INTO schema_migrations (version) VALUES ('86');

INSERT INTO schema_migrations (version) VALUES ('87');

INSERT INTO schema_migrations (version) VALUES ('88');

INSERT INTO schema_migrations (version) VALUES ('89');

INSERT INTO schema_migrations (version) VALUES ('9');

INSERT INTO schema_migrations (version) VALUES ('90');

INSERT INTO schema_migrations (version) VALUES ('91');

INSERT INTO schema_migrations (version) VALUES ('92');

INSERT INTO schema_migrations (version) VALUES ('93');

INSERT INTO schema_migrations (version) VALUES ('94');

INSERT INTO schema_migrations (version) VALUES ('95');

INSERT INTO schema_migrations (version) VALUES ('96');

INSERT INTO schema_migrations (version) VALUES ('97');

INSERT INTO schema_migrations (version) VALUES ('98');

INSERT INTO schema_migrations (version) VALUES ('99');