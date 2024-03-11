
use map;
drop table if exists space_logs;
create table space_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists space_insert_trigger;
	 create  trigger space_insert_trigger
		after insert
		on map.space
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,space_name:', NEW.space_name  ,'  ,space_parent:', NEW.space_parent  ,'  ,space_order:', NEW.space_order  ,'  ,description:', NEW.description  ,'  ,sts:', NEW.sts  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', NEW.plat_uuid   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO space_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists space_update_trigger;
	 create trigger space_update_trigger
				after update
				on map.space
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,space_name:', NEW.space_name  ,'  ,space_parent:', NEW.space_parent  ,'  ,space_order:', NEW.space_order  ,'  ,description:', NEW.description  ,'  ,sts:', NEW.sts  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', NEW.plat_uuid  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,space_name:', old.space_name  ,'  ,space_parent:', old.space_parent  ,'  ,space_order:', old.space_order  ,'  ,description:', old.description  ,'  ,sts:', old.sts  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', old.plat_uuid   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO space_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists space_delete_trigger; 
	create  trigger space_delete_trigger
    after delete
    on map.space
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,space_name:', old.space_name  ,'  ,space_parent:', old.space_parent  ,'  ,space_order:', old.space_order  ,'  ,description:', old.description  ,'  ,sts:', old.sts  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', old.plat_uuid   );
	INSERT INTO space_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use map;
drop table if exists zone_logs;
create table zone_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists zone_insert_trigger;
	 create  trigger zone_insert_trigger
		after insert
		on map.zone
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,zone_name:', NEW.zone_name  ,'  ,zone_type:', NEW.zone_type  ,'  ,zone_class:', NEW.zone_class  ,'  ,zone_def:', NEW.zone_def  ,'  ,description:', NEW.description  ,'  ,sts:', NEW.sts  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', NEW.plat_uuid   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO zone_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists zone_update_trigger;
	 create trigger zone_update_trigger
				after update
				on map.zone
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,zone_name:', NEW.zone_name  ,'  ,zone_type:', NEW.zone_type  ,'  ,zone_class:', NEW.zone_class  ,'  ,zone_def:', NEW.zone_def  ,'  ,description:', NEW.description  ,'  ,sts:', NEW.sts  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', NEW.plat_uuid  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,zone_name:', old.zone_name  ,'  ,zone_type:', old.zone_type  ,'  ,zone_class:', old.zone_class  ,'  ,zone_def:', old.zone_def  ,'  ,description:', old.description  ,'  ,sts:', old.sts  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', old.plat_uuid   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO zone_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists zone_delete_trigger; 
	create  trigger zone_delete_trigger
    after delete
    on map.zone
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,zone_name:', old.zone_name  ,'  ,zone_type:', old.zone_type  ,'  ,zone_class:', old.zone_class  ,'  ,zone_def:', old.zone_def  ,'  ,description:', old.description  ,'  ,sts:', old.sts  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,plat_uuid:', old.plat_uuid   );
	INSERT INTO zone_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use person;
drop table if exists person_logs;
create table person_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists person_insert_trigger;
	 create  trigger person_insert_trigger
		after insert
		on person.person
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,person_cn_name:', NEW.person_cn_name  ,'  ,person_en_name:', NEW.person_en_name  ,'  ,person_document_id:', NEW.person_document_id  ,'  ,person_id_number:', NEW.person_id_number  ,'  ,external_uuid:', NEW.external_uuid  ,'  ,id_expiry_date:', NEW.id_expiry_date  ,'  ,id_country:', NEW.id_country  ,'  ,id_type:', NEW.id_type  ,'  ,person_sex:', NEW.person_sex  ,'  ,person_birthday:', NEW.person_birthday  ,'  ,person_type:', NEW.person_type  ,'  ,person_tag:', NEW.person_tag  ,'  ,description:', NEW.description  ,'  ,sts:', NEW.sts  ,'  ,expire_date:',  IF(NEW.expire_date IS NOT NULL,DATE_FORMAT(NEW.expire_date, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,phone:', NEW.phone  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,remark:',JSON_OBJECT('remark',  NEW.remark)  ,'  ,privilege:', NEW.privilege  ,'  ,image_license_days:', NEW.image_license_days  ,'  ,external_info:',JSON_OBJECT('external_info',  NEW.external_info)  ,'  ,welcome_words:', NEW.welcome_words  ,'  ,en_or_disable_reason:', NEW.en_or_disable_reason   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO person_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists person_update_trigger;
	 create trigger person_update_trigger
				after update
				on person.person
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,person_cn_name:', NEW.person_cn_name  ,'  ,person_en_name:', NEW.person_en_name  ,'  ,person_document_id:', NEW.person_document_id  ,'  ,person_id_number:', NEW.person_id_number  ,'  ,external_uuid:', NEW.external_uuid  ,'  ,id_expiry_date:', NEW.id_expiry_date  ,'  ,id_country:', NEW.id_country  ,'  ,id_type:', NEW.id_type  ,'  ,person_sex:', NEW.person_sex  ,'  ,person_birthday:', NEW.person_birthday  ,'  ,person_type:', NEW.person_type  ,'  ,person_tag:', NEW.person_tag  ,'  ,description:', NEW.description  ,'  ,sts:', NEW.sts  ,'  ,expire_date:',  IF(NEW.expire_date IS NOT NULL,DATE_FORMAT(NEW.expire_date, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,phone:', NEW.phone  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,remark:',JSON_OBJECT('remark',  NEW.remark)  ,'  ,privilege:', NEW.privilege  ,'  ,image_license_days:', NEW.image_license_days  ,'  ,external_info:',JSON_OBJECT('external_info',  NEW.external_info)  ,'  ,welcome_words:', NEW.welcome_words  ,'  ,en_or_disable_reason:', NEW.en_or_disable_reason  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,person_cn_name:', old.person_cn_name  ,'  ,person_en_name:', old.person_en_name  ,'  ,person_document_id:', old.person_document_id  ,'  ,person_id_number:', old.person_id_number  ,'  ,external_uuid:', old.external_uuid  ,'  ,id_expiry_date:', old.id_expiry_date  ,'  ,id_country:', old.id_country  ,'  ,id_type:', old.id_type  ,'  ,person_sex:', old.person_sex  ,'  ,person_birthday:', old.person_birthday  ,'  ,person_type:', old.person_type  ,'  ,person_tag:', old.person_tag  ,'  ,description:', old.description  ,'  ,sts:', old.sts  ,'  ,expire_date:', IF(NEW.expire_date IS NOT NULL,DATE_FORMAT(NEW.expire_date, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,phone:', old.phone  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,remark:',JSON_OBJECT('remark',  old.remark)  ,'  ,privilege:', old.privilege  ,'  ,image_license_days:', old.image_license_days  ,'  ,external_info:',JSON_OBJECT('external_info',  old.external_info)  ,'  ,welcome_words:', old.welcome_words  ,'  ,en_or_disable_reason:', old.en_or_disable_reason   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO person_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists person_delete_trigger; 
	create  trigger person_delete_trigger
    after delete
    on person.person
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,person_cn_name:', old.person_cn_name  ,'  ,person_en_name:', old.person_en_name  ,'  ,person_document_id:', old.person_document_id  ,'  ,person_id_number:', old.person_id_number  ,'  ,external_uuid:', old.external_uuid  ,'  ,id_expiry_date:', old.id_expiry_date  ,'  ,id_country:', old.id_country  ,'  ,id_type:', old.id_type  ,'  ,person_sex:', old.person_sex  ,'  ,person_birthday:', old.person_birthday  ,'  ,person_type:', old.person_type  ,'  ,person_tag:', old.person_tag  ,'  ,description:', old.description  ,'  ,sts:', old.sts  ,'  ,expire_date:', IF(NEW.expire_date IS NOT NULL,DATE_FORMAT(NEW.expire_date, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,phone:', old.phone  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,remark:',JSON_OBJECT('remark',  old.remark)  ,'  ,privilege:', old.privilege  ,'  ,image_license_days:', old.image_license_days  ,'  ,external_info:',JSON_OBJECT('external_info',  old.external_info)  ,'  ,welcome_words:', old.welcome_words  ,'  ,en_or_disable_reason:', old.en_or_disable_reason   );
	INSERT INTO person_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use person;
drop table if exists person_group_logs;
create table person_group_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists person_group_insert_trigger;
	 create  trigger person_group_insert_trigger
		after insert
		on person.person_group
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,group_cn_name:', NEW.group_cn_name  ,'  ,group_en_name:', NEW.group_en_name  ,'  ,group_type:', NEW.group_type  ,'  ,description:', NEW.description  ,'  ,in_group_valid_hour:', NEW.in_group_valid_hour  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,privilege:', NEW.privilege   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO person_group_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists person_group_update_trigger;
	 create trigger person_group_update_trigger
				after update
				on person.person_group
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,group_cn_name:', NEW.group_cn_name  ,'  ,group_en_name:', NEW.group_en_name  ,'  ,group_type:', NEW.group_type  ,'  ,description:', NEW.description  ,'  ,in_group_valid_hour:', NEW.in_group_valid_hour  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,privilege:', NEW.privilege  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,group_cn_name:', old.group_cn_name  ,'  ,group_en_name:', old.group_en_name  ,'  ,group_type:', old.group_type  ,'  ,description:', old.description  ,'  ,in_group_valid_hour:', old.in_group_valid_hour  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,privilege:', old.privilege   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO person_group_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists person_group_delete_trigger; 
	create  trigger person_group_delete_trigger
    after delete
    on person.person_group
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,group_cn_name:', old.group_cn_name  ,'  ,group_en_name:', old.group_en_name  ,'  ,group_type:', old.group_type  ,'  ,description:', old.description  ,'  ,in_group_valid_hour:', old.in_group_valid_hour  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,privilege:', old.privilege   );
	INSERT INTO person_group_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use person;
drop table if exists person_group_member_logs;
create table person_group_member_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists person_group_member_insert_trigger;
	 create  trigger person_group_member_insert_trigger
		after insert
		on person.person_group_member
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,person_group_uuid:', NEW.person_group_uuid  ,'  ,person_uuid:', NEW.person_uuid  ,'  ,description:', NEW.description  ,'  ,privilege:', NEW.privilege  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO person_group_member_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.person_group_uuid, operate_paramsVal);
			END;
drop trigger if exists person_group_member_update_trigger;
	 create trigger person_group_member_update_trigger
				after update
				on person.person_group_member
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,person_group_uuid:', NEW.person_group_uuid  ,'  ,person_uuid:', NEW.person_uuid  ,'  ,description:', NEW.description  ,'  ,privilege:', NEW.privilege  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,person_group_uuid:', old.person_group_uuid  ,'  ,person_uuid:', old.person_uuid  ,'  ,description:', old.description  ,'  ,privilege:', old.privilege  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO person_group_member_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.person_group_uuid, concat(old_params,new_params));
			end;
drop trigger if exists person_group_member_delete_trigger; 
	create  trigger person_group_member_delete_trigger
    after delete
    on person.person_group_member
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,person_group_uuid:', old.person_group_uuid  ,'  ,person_uuid:', old.person_uuid  ,'  ,description:', old.description  ,'  ,privilege:', old.privilege  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   );
	INSERT INTO person_group_member_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.person_group_uuid, old_paramsVal);
end;

use person;
drop table if exists person_image_logs;
create table person_image_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists person_image_insert_trigger;
	 create  trigger person_image_insert_trigger
		after insert
		on person.person_image
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,avatar_image:', NEW.avatar_image  ,'  ,image_feature:', NEW.image_feature  ,'  ,model_version:', NEW.model_version  ,'  ,person_uuid:', NEW.person_uuid  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO person_image_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists person_image_update_trigger;
	 create trigger person_image_update_trigger
				after update
				on person.person_image
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,avatar_image:', NEW.avatar_image  ,'  ,image_feature:', NEW.image_feature  ,'  ,model_version:', NEW.model_version  ,'  ,person_uuid:', NEW.person_uuid  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,avatar_image:', old.avatar_image  ,'  ,image_feature:', old.image_feature  ,'  ,model_version:', old.model_version  ,'  ,person_uuid:', old.person_uuid  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO person_image_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists person_image_delete_trigger; 
	create  trigger person_image_delete_trigger
    after delete
    on person.person_image
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,avatar_image:', old.avatar_image  ,'  ,image_feature:', old.image_feature  ,'  ,model_version:', old.model_version  ,'  ,person_uuid:', old.person_uuid  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   );
	INSERT INTO person_image_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use policy_control;
drop table if exists control_device_group_relation_logs;
create table control_device_group_relation_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists control_device_group_relation_insert_trigger;
	 create  trigger control_device_group_relation_insert_trigger
		after insert
		on policy_control.control_device_group_relation
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,gate_control_policy_uuid:', NEW.gate_control_policy_uuid  ,'  ,device_group_id:', NEW.device_group_id  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO control_device_group_relation_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists control_device_group_relation_update_trigger;
	 create trigger control_device_group_relation_update_trigger
				after update
				on policy_control.control_device_group_relation
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,gate_control_policy_uuid:', NEW.gate_control_policy_uuid  ,'  ,device_group_id:', NEW.device_group_id  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,gate_control_policy_uuid:', old.gate_control_policy_uuid  ,'  ,device_group_id:', old.device_group_id  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO control_device_group_relation_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists control_device_group_relation_delete_trigger; 
	create  trigger control_device_group_relation_delete_trigger
    after delete
    on policy_control.control_device_group_relation
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,gate_control_policy_uuid:', old.gate_control_policy_uuid  ,'  ,device_group_id:', old.device_group_id  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   );
	INSERT INTO control_device_group_relation_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use policy_control;
drop table if exists control_policy_device_relation_logs;
create table control_policy_device_relation_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists control_policy_device_relation_insert_trigger;
	 create  trigger control_policy_device_relation_insert_trigger
		after insert
		on policy_control.control_policy_device_relation
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,gate_control_policy_uuid:', NEW.gate_control_policy_uuid  ,'  ,monitor_device_id:', NEW.monitor_device_id  ,'  ,device_group_Id:', NEW.device_group_Id  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,import_source:', NEW.import_source   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO control_policy_device_relation_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists control_policy_device_relation_update_trigger;
	 create trigger control_policy_device_relation_update_trigger
				after update
				on policy_control.control_policy_device_relation
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,gate_control_policy_uuid:', NEW.gate_control_policy_uuid  ,'  ,monitor_device_id:', NEW.monitor_device_id  ,'  ,device_group_Id:', NEW.device_group_Id  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,import_source:', NEW.import_source  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,gate_control_policy_uuid:', old.gate_control_policy_uuid  ,'  ,monitor_device_id:', old.monitor_device_id  ,'  ,device_group_Id:', old.device_group_Id  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,import_source:', old.import_source   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO control_policy_device_relation_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists control_policy_device_relation_delete_trigger; 
	create  trigger control_policy_device_relation_delete_trigger
    after delete
    on policy_control.control_policy_device_relation
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,gate_control_policy_uuid:', old.gate_control_policy_uuid  ,'  ,monitor_device_id:', old.monitor_device_id  ,'  ,device_group_Id:', old.device_group_Id  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,import_source:', old.import_source   );
	INSERT INTO control_policy_device_relation_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use policy_control;
drop table if exists control_policy_target_relation_logs;
create table control_policy_target_relation_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists control_policy_target_relation_insert_trigger;
	 create  trigger control_policy_target_relation_insert_trigger
		after insert
		on policy_control.control_policy_target_relation
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,gate_control_policy_uuid:', NEW.gate_control_policy_uuid  ,'  ,control_target_definition_uuid:', NEW.control_target_definition_uuid  ,'  ,control_target_value:', NEW.control_target_value  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,control_operator:', NEW.control_operator  ,'  ,matching_threshold:', NEW.matching_threshold  ,'  ,class_id:', NEW.class_id   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO control_policy_target_relation_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists control_policy_target_relation_update_trigger;
	 create trigger control_policy_target_relation_update_trigger
				after update
				on policy_control.control_policy_target_relation
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,gate_control_policy_uuid:', NEW.gate_control_policy_uuid  ,'  ,control_target_definition_uuid:', NEW.control_target_definition_uuid  ,'  ,control_target_value:', NEW.control_target_value  ,'  ,privilege:', NEW.privilege  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,control_operator:', NEW.control_operator  ,'  ,matching_threshold:', NEW.matching_threshold  ,'  ,class_id:', NEW.class_id  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,gate_control_policy_uuid:', old.gate_control_policy_uuid  ,'  ,control_target_definition_uuid:', old.control_target_definition_uuid  ,'  ,control_target_value:', old.control_target_value  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,control_operator:', old.control_operator  ,'  ,matching_threshold:', old.matching_threshold  ,'  ,class_id:', old.class_id   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO control_policy_target_relation_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists control_policy_target_relation_delete_trigger; 
	create  trigger control_policy_target_relation_delete_trigger
    after delete
    on policy_control.control_policy_target_relation
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,gate_control_policy_uuid:', old.gate_control_policy_uuid  ,'  ,control_target_definition_uuid:', old.control_target_definition_uuid  ,'  ,control_target_value:', old.control_target_value  ,'  ,privilege:', old.privilege  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,control_operator:', old.control_operator  ,'  ,matching_threshold:', old.matching_threshold  ,'  ,class_id:', old.class_id   );
	INSERT INTO control_policy_target_relation_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use policy_control;
drop table if exists gate_control_policy_logs;
create table gate_control_policy_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists gate_control_policy_insert_trigger;
	 create  trigger gate_control_policy_insert_trigger
		after insert
		on policy_control.gate_control_policy
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,external_policy_id:', NEW.external_policy_id  ,'  ,policy_name:', NEW.policy_name  ,'  ,policy_type:', NEW.policy_type  ,'  ,valid_period_from:', NEW.valid_period_from  ,'  ,valid_period_to:', NEW.valid_period_to  ,'  ,control_period_from:', NEW.control_period_from  ,'  ,control_period_to:', NEW.control_period_to  ,'  ,control_period_weekday:', NEW.control_period_weekday  ,'  ,description:', NEW.description  ,'  ,privilege:', NEW.privilege  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,zone_id:', NEW.zone_id  ,'  ,working_times:', NEW.working_times  ,'  ,holidays:', NEW.holidays  ,'  ,makeups:', NEW.makeups   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO gate_control_policy_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists gate_control_policy_update_trigger;
	 create trigger gate_control_policy_update_trigger
				after update
				on policy_control.gate_control_policy
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,external_policy_id:', NEW.external_policy_id  ,'  ,policy_name:', NEW.policy_name  ,'  ,policy_type:', NEW.policy_type  ,'  ,valid_period_from:', NEW.valid_period_from  ,'  ,valid_period_to:', NEW.valid_period_to  ,'  ,control_period_from:', NEW.control_period_from  ,'  ,control_period_to:', NEW.control_period_to  ,'  ,control_period_weekday:', NEW.control_period_weekday  ,'  ,description:', NEW.description  ,'  ,privilege:', NEW.privilege  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,zone_id:', NEW.zone_id  ,'  ,working_times:', NEW.working_times  ,'  ,holidays:', NEW.holidays  ,'  ,makeups:', NEW.makeups  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,external_policy_id:', old.external_policy_id  ,'  ,policy_name:', old.policy_name  ,'  ,policy_type:', old.policy_type  ,'  ,valid_period_from:', old.valid_period_from  ,'  ,valid_period_to:', old.valid_period_to  ,'  ,control_period_from:', old.control_period_from  ,'  ,control_period_to:', old.control_period_to  ,'  ,control_period_weekday:', old.control_period_weekday  ,'  ,description:', old.description  ,'  ,privilege:', old.privilege  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,zone_id:', old.zone_id  ,'  ,working_times:', old.working_times  ,'  ,holidays:', old.holidays  ,'  ,makeups:', old.makeups   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO gate_control_policy_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists gate_control_policy_delete_trigger; 
	create  trigger gate_control_policy_delete_trigger
    after delete
    on policy_control.gate_control_policy
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,external_policy_id:', old.external_policy_id  ,'  ,policy_name:', old.policy_name  ,'  ,policy_type:', old.policy_type  ,'  ,valid_period_from:', old.valid_period_from  ,'  ,valid_period_to:', old.valid_period_to  ,'  ,control_period_from:', old.control_period_from  ,'  ,control_period_to:', old.control_period_to  ,'  ,control_period_weekday:', old.control_period_weekday  ,'  ,description:', old.description  ,'  ,privilege:', old.privilege  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,zone_id:', old.zone_id  ,'  ,working_times:', old.working_times  ,'  ,holidays:', old.holidays  ,'  ,makeups:', old.makeups   );
	INSERT INTO gate_control_policy_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use sensebi;
drop table if exists t_hello_device_logs;
create table t_hello_device_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists t_hello_device_insert_trigger;
	 create  trigger t_hello_device_insert_trigger
		after insert
		on sensebi.t_hello_device
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,UUID:', NEW.UUID  ,'  ,COMPANY_ID:', NEW.COMPANY_ID  ,'  ,DUID:', NEW.DUID  ,'  ,DEVICE_ID:', NEW.DEVICE_ID  ,'  ,DEVICE_SN:', NEW.DEVICE_SN  ,'  ,CREATE_TS:',  IF(NEW.CREATE_TS IS NOT NULL,DATE_FORMAT(NEW.CREATE_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,CREATE_USER:', NEW.CREATE_USER  ,'  ,LAST_MOD_TS:',  IF(NEW.LAST_MOD_TS IS NOT NULL,DATE_FORMAT(NEW.LAST_MOD_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,LAST_MOD_USER:', NEW.LAST_MOD_USER   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO t_hello_device_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists t_hello_device_update_trigger;
	 create trigger t_hello_device_update_trigger
				after update
				on sensebi.t_hello_device
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,UUID:', NEW.UUID  ,'  ,COMPANY_ID:', NEW.COMPANY_ID  ,'  ,DUID:', NEW.DUID  ,'  ,DEVICE_ID:', NEW.DEVICE_ID  ,'  ,DEVICE_SN:', NEW.DEVICE_SN  ,'  ,CREATE_TS:',  IF(NEW.CREATE_TS IS NOT NULL,DATE_FORMAT(NEW.CREATE_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,CREATE_USER:', NEW.CREATE_USER  ,'  ,LAST_MOD_TS:',  IF(NEW.LAST_MOD_TS IS NOT NULL,DATE_FORMAT(NEW.LAST_MOD_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,LAST_MOD_USER:', NEW.LAST_MOD_USER  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,UUID:', old.UUID  ,'  ,COMPANY_ID:', old.COMPANY_ID  ,'  ,DUID:', old.DUID  ,'  ,DEVICE_ID:', old.DEVICE_ID  ,'  ,DEVICE_SN:', old.DEVICE_SN  ,'  ,CREATE_TS:', IF(NEW.CREATE_TS IS NOT NULL,DATE_FORMAT(NEW.CREATE_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,CREATE_USER:', old.CREATE_USER  ,'  ,LAST_MOD_TS:', IF(NEW.LAST_MOD_TS IS NOT NULL,DATE_FORMAT(NEW.LAST_MOD_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,LAST_MOD_USER:', old.LAST_MOD_USER   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO t_hello_device_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists t_hello_device_delete_trigger; 
	create  trigger t_hello_device_delete_trigger
    after delete
    on sensebi.t_hello_device
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,UUID:', old.UUID  ,'  ,COMPANY_ID:', old.COMPANY_ID  ,'  ,DUID:', old.DUID  ,'  ,DEVICE_ID:', old.DEVICE_ID  ,'  ,DEVICE_SN:', old.DEVICE_SN  ,'  ,CREATE_TS:', IF(NEW.CREATE_TS IS NOT NULL,DATE_FORMAT(NEW.CREATE_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,CREATE_USER:', old.CREATE_USER  ,'  ,LAST_MOD_TS:', IF(NEW.LAST_MOD_TS IS NOT NULL,DATE_FORMAT(NEW.LAST_MOD_TS, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,LAST_MOD_USER:', old.LAST_MOD_USER   );
	INSERT INTO t_hello_device_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use system_config_handler;
drop table if exists system_config_logs;
create table system_config_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists system_config_insert_trigger;
	 create  trigger system_config_insert_trigger
		after insert
		on system_config_handler.system_config
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,variable:', NEW.variable  ,'  ,value:', NEW.value  ,'  ,desc:', NEW.desc  ,'  ,desc_en:', NEW.desc_en  ,'  ,tag:', NEW.tag  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO system_config_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.variable, operate_paramsVal);
			END;
drop trigger if exists system_config_update_trigger;
	 create trigger system_config_update_trigger
				after update
				on system_config_handler.system_config
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,variable:', NEW.variable  ,'  ,value:', NEW.value  ,'  ,desc:', NEW.desc  ,'  ,desc_en:', NEW.desc_en  ,'  ,tag:', NEW.tag  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,variable:', old.variable  ,'  ,value:', old.value  ,'  ,desc:', old.desc  ,'  ,desc_en:', old.desc_en  ,'  ,tag:', old.tag  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO system_config_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.variable, concat(old_params,new_params));
			end;
drop trigger if exists system_config_delete_trigger; 
	create  trigger system_config_delete_trigger
    after delete
    on system_config_handler.system_config
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,variable:', old.variable  ,'  ,value:', old.value  ,'  ,desc:', old.desc  ,'  ,desc_en:', old.desc_en  ,'  ,tag:', old.tag  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   );
	INSERT INTO system_config_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.variable, old_paramsVal);
end;

use device;
drop table if exists bi_device_info_logs;
create table bi_device_info_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists bi_device_info_insert_trigger;
	 create  trigger bi_device_info_insert_trigger
		after insert
		on device.bi_device_info
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,device_uuid:', NEW.device_uuid  ,'  ,server_verify:', NEW.server_verify  ,'  ,server_address:', NEW.server_address  ,'  ,ntp_server_address:', NEW.ntp_server_address  ,'  ,other_server:', NEW.other_server  ,'  ,other_server_address:', NEW.other_server_address  ,'  ,network_relay_address:', NEW.network_relay_address  ,'  ,face_update_threshold:', NEW.face_update_threshold  ,'  ,yaw:', NEW.yaw  ,'  ,pitch:', NEW.pitch  ,'  ,roll:', NEW.roll  ,'  ,face_width:', NEW.face_width  ,'  ,wake_up_distance:', NEW.wake_up_distance  ,'  ,recognition_distance:', NEW.recognition_distance  ,'  ,liveness:', NEW.liveness  ,'  ,liveness_threshold:', NEW.liveness_threshold  ,'  ,verify_threshold:', NEW.verify_threshold  ,'  ,logo:', NEW.logo  ,'  ,video_tip:', NEW.video_tip  ,'  ,welcome_tip:', NEW.welcome_tip  ,'  ,show_name:', NEW.show_name  ,'  ,show_avatar_type:', NEW.show_avatar_type  ,'  ,verify_fault_role_tip:', NEW.verify_fault_role_tip  ,'  ,liveness_success_role_tip:', NEW.liveness_success_role_tip  ,'  ,liveness_success_tip:', NEW.liveness_success_tip  ,'  ,verify_success_tip:', NEW.verify_success_tip  ,'  ,verify_fault_tip:', NEW.verify_fault_tip  ,'  ,use_show_avatar:', NEW.use_show_avatar  ,'  ,show_user_name:', NEW.show_user_name  ,'  ,show_user_info:', NEW.show_user_info  ,'  ,auto_led:', NEW.auto_led  ,'  ,fill_light:', NEW.fill_light  ,'  ,forced_open_upload:', NEW.forced_open_upload  ,'  ,dismantle_upload:', NEW.dismantle_upload  ,'  ,guest_notification:', NEW.guest_notification  ,'  ,voice:', NEW.voice  ,'  ,voice_broadcast:', NEW.voice_broadcast  ,'  ,infrared_probe:', NEW.infrared_probe  ,'  ,start_time:', NEW.start_time  ,'  ,end_time:', NEW.end_time  ,'  ,buzzer_status:', NEW.buzzer_status  ,'  ,gpio_a:', NEW.gpio_a  ,'  ,gpio_b:', NEW.gpio_b  ,'  ,gpio_c:', NEW.gpio_c  ,'  ,papl_gpio_a:', NEW.papl_gpio_a  ,'  ,papl_gpio_b:', NEW.papl_gpio_b  ,'  ,papl_gpio_c:', NEW.papl_gpio_c  ,'  ,papl_gpio_d:', NEW.papl_gpio_d  ,'  ,papl_gpio_e:', NEW.papl_gpio_e  ,'  ,papl_gpio_f:', NEW.papl_gpio_f  ,'  ,open_door_time:', NEW.open_door_time  ,'  ,open_interval:', NEW.open_interval  ,'  ,keep_door_open_duration:', NEW.keep_door_open_duration  ,'  ,wigan_input:', NEW.wigan_input  ,'  ,open_door_type:', NEW.open_door_type  ,'  ,standby_open:', NEW.standby_open  ,'  ,face_num:', NEW.face_num  ,'  ,no_action_threshold:', NEW.no_action_threshold  ,'  ,no_match_threshold:', NEW.no_match_threshold  ,'  ,config_default_flag:', NEW.config_default_flag  ,'  ,device_run_type:', NEW.device_run_type  ,'  ,auto_reboot:', NEW.auto_reboot  ,'  ,reboot_time:', NEW.reboot_time  ,'  ,wait_time:', NEW.wait_time  ,'  ,simplify_model:', NEW.simplify_model  ,'  ,admin_pwd:', NEW.admin_pwd  ,'  ,dormancy_type:', NEW.dormancy_type  ,'  ,language_type:', NEW.language_type  ,'  ,use_mode:', NEW.use_mode  ,'  ,pro_use_mode:', NEW.pro_use_mode  ,'  ,mode:', NEW.mode  ,'  ,bluetooth_mac:', NEW.bluetooth_mac  ,'  ,change_server_url:', NEW.change_server_url  ,'  ,device_reboot_time:', NEW.device_reboot_time  ,'  ,access_control_status:', NEW.access_control_status  ,'  ,access_control_timetable:', NEW.access_control_timetable  ,'  ,timetable_upd_ts:', NEW.timetable_upd_ts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_product_type_uuid:', NEW.device_product_type_uuid  ,'  ,device_type_uuid:', NEW.device_type_uuid  ,'  ,sts:', NEW.sts  ,'  ,black_list_open:', NEW.black_list_open  ,'  ,black_list_tip:', NEW.black_list_tip  ,'  ,device_button_name1:', NEW.device_button_name1  ,'  ,device_button_value1:', NEW.device_button_value1  ,'  ,device_button_name2:', NEW.device_button_name2  ,'  ,device_button_value2:', NEW.device_button_value2  ,'  ,device_button_name3:', NEW.device_button_name3  ,'  ,device_button_value3:', NEW.device_button_value3  ,'  ,device_button_name4:', NEW.device_button_name4  ,'  ,device_button_value4:', NEW.device_button_value4  ,'  ,device_button_name5:', NEW.device_button_name5  ,'  ,device_button_value5:', NEW.device_button_value5  ,'  ,device_button_name6:', NEW.device_button_name6  ,'  ,device_button_value6:', NEW.device_button_value6  ,'  ,temperature_detect:', NEW.temperature_detect  ,'  ,fever_temperature:', NEW.fever_temperature  ,'  ,no_access_to_fevers:', NEW.no_access_to_fevers  ,'  ,show_thermal_screen:', NEW.show_thermal_screen  ,'  ,indoor_temperature:', NEW.indoor_temperature  ,'  ,temperature_detect_distance:', NEW.temperature_detect_distance  ,'  ,quick_detect_mode:', NEW.quick_detect_mode  ,'  ,mask_detect:', NEW.mask_detect  ,'  ,no_access_without_mask:', NEW.no_access_without_mask  ,'  ,certificate_threshold:', NEW.certificate_threshold  ,'  ,strong_hint:', NEW.strong_hint  ,'  ,save_elec_mode:', NEW.save_elec_mode  ,'  ,touch_recognition:', NEW.touch_recognition  ,'  ,touch_recognition_custom_picture:', NEW.touch_recognition_custom_picture  ,'  ,touch_recognition_return_time:', NEW.touch_recognition_return_time  ,'  ,touch_recognition_timeout:', NEW.touch_recognition_timeout  ,'  ,door_sensor_timeout:', NEW.door_sensor_timeout  ,'  ,wake_distance:', NEW.wake_distance  ,'  ,wifi_ssid:', NEW.wifi_ssid  ,'  ,wifi_pwd:', NEW.wifi_pwd  ,'  ,ntp_set:', NEW.ntp_set  ,'  ,short_exposure:', NEW.short_exposure  ,'  ,sleep_time:', NEW.sleep_time  ,'  ,standby_touch_wakeup:', NEW.standby_touch_wakeup  ,'  ,screen_brightness:', NEW.screen_brightness  ,'  ,sound_volume:', NEW.sound_volume  ,'  ,setup_env:', NEW.setup_env  ,'  ,no_access_with_mask:', NEW.no_access_with_mask   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO bi_device_info_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists bi_device_info_update_trigger;
	 create trigger bi_device_info_update_trigger
				after update
				on device.bi_device_info
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,device_uuid:', NEW.device_uuid  ,'  ,server_verify:', NEW.server_verify  ,'  ,server_address:', NEW.server_address  ,'  ,ntp_server_address:', NEW.ntp_server_address  ,'  ,other_server:', NEW.other_server  ,'  ,other_server_address:', NEW.other_server_address  ,'  ,network_relay_address:', NEW.network_relay_address  ,'  ,face_update_threshold:', NEW.face_update_threshold  ,'  ,yaw:', NEW.yaw  ,'  ,pitch:', NEW.pitch  ,'  ,roll:', NEW.roll  ,'  ,face_width:', NEW.face_width  ,'  ,wake_up_distance:', NEW.wake_up_distance  ,'  ,recognition_distance:', NEW.recognition_distance  ,'  ,liveness:', NEW.liveness  ,'  ,liveness_threshold:', NEW.liveness_threshold  ,'  ,verify_threshold:', NEW.verify_threshold  ,'  ,logo:', NEW.logo  ,'  ,video_tip:', NEW.video_tip  ,'  ,welcome_tip:', NEW.welcome_tip  ,'  ,show_name:', NEW.show_name  ,'  ,show_avatar_type:', NEW.show_avatar_type  ,'  ,verify_fault_role_tip:', NEW.verify_fault_role_tip  ,'  ,liveness_success_role_tip:', NEW.liveness_success_role_tip  ,'  ,liveness_success_tip:', NEW.liveness_success_tip  ,'  ,verify_success_tip:', NEW.verify_success_tip  ,'  ,verify_fault_tip:', NEW.verify_fault_tip  ,'  ,use_show_avatar:', NEW.use_show_avatar  ,'  ,show_user_name:', NEW.show_user_name  ,'  ,show_user_info:', NEW.show_user_info  ,'  ,auto_led:', NEW.auto_led  ,'  ,fill_light:', NEW.fill_light  ,'  ,forced_open_upload:', NEW.forced_open_upload  ,'  ,dismantle_upload:', NEW.dismantle_upload  ,'  ,guest_notification:', NEW.guest_notification  ,'  ,voice:', NEW.voice  ,'  ,voice_broadcast:', NEW.voice_broadcast  ,'  ,infrared_probe:', NEW.infrared_probe  ,'  ,start_time:', NEW.start_time  ,'  ,end_time:', NEW.end_time  ,'  ,buzzer_status:', NEW.buzzer_status  ,'  ,gpio_a:', NEW.gpio_a  ,'  ,gpio_b:', NEW.gpio_b  ,'  ,gpio_c:', NEW.gpio_c  ,'  ,papl_gpio_a:', NEW.papl_gpio_a  ,'  ,papl_gpio_b:', NEW.papl_gpio_b  ,'  ,papl_gpio_c:', NEW.papl_gpio_c  ,'  ,papl_gpio_d:', NEW.papl_gpio_d  ,'  ,papl_gpio_e:', NEW.papl_gpio_e  ,'  ,papl_gpio_f:', NEW.papl_gpio_f  ,'  ,open_door_time:', NEW.open_door_time  ,'  ,open_interval:', NEW.open_interval  ,'  ,keep_door_open_duration:', NEW.keep_door_open_duration  ,'  ,wigan_input:', NEW.wigan_input  ,'  ,open_door_type:', NEW.open_door_type  ,'  ,standby_open:', NEW.standby_open  ,'  ,face_num:', NEW.face_num  ,'  ,no_action_threshold:', NEW.no_action_threshold  ,'  ,no_match_threshold:', NEW.no_match_threshold  ,'  ,config_default_flag:', NEW.config_default_flag  ,'  ,device_run_type:', NEW.device_run_type  ,'  ,auto_reboot:', NEW.auto_reboot  ,'  ,reboot_time:', NEW.reboot_time  ,'  ,wait_time:', NEW.wait_time  ,'  ,simplify_model:', NEW.simplify_model  ,'  ,admin_pwd:', NEW.admin_pwd  ,'  ,dormancy_type:', NEW.dormancy_type  ,'  ,language_type:', NEW.language_type  ,'  ,use_mode:', NEW.use_mode  ,'  ,pro_use_mode:', NEW.pro_use_mode  ,'  ,mode:', NEW.mode  ,'  ,bluetooth_mac:', NEW.bluetooth_mac  ,'  ,change_server_url:', NEW.change_server_url  ,'  ,device_reboot_time:', NEW.device_reboot_time  ,'  ,access_control_status:', NEW.access_control_status  ,'  ,access_control_timetable:', NEW.access_control_timetable  ,'  ,timetable_upd_ts:', NEW.timetable_upd_ts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_product_type_uuid:', NEW.device_product_type_uuid  ,'  ,device_type_uuid:', NEW.device_type_uuid  ,'  ,sts:', NEW.sts  ,'  ,black_list_open:', NEW.black_list_open  ,'  ,black_list_tip:', NEW.black_list_tip  ,'  ,device_button_name1:', NEW.device_button_name1  ,'  ,device_button_value1:', NEW.device_button_value1  ,'  ,device_button_name2:', NEW.device_button_name2  ,'  ,device_button_value2:', NEW.device_button_value2  ,'  ,device_button_name3:', NEW.device_button_name3  ,'  ,device_button_value3:', NEW.device_button_value3  ,'  ,device_button_name4:', NEW.device_button_name4  ,'  ,device_button_value4:', NEW.device_button_value4  ,'  ,device_button_name5:', NEW.device_button_name5  ,'  ,device_button_value5:', NEW.device_button_value5  ,'  ,device_button_name6:', NEW.device_button_name6  ,'  ,device_button_value6:', NEW.device_button_value6  ,'  ,temperature_detect:', NEW.temperature_detect  ,'  ,fever_temperature:', NEW.fever_temperature  ,'  ,no_access_to_fevers:', NEW.no_access_to_fevers  ,'  ,show_thermal_screen:', NEW.show_thermal_screen  ,'  ,indoor_temperature:', NEW.indoor_temperature  ,'  ,temperature_detect_distance:', NEW.temperature_detect_distance  ,'  ,quick_detect_mode:', NEW.quick_detect_mode  ,'  ,mask_detect:', NEW.mask_detect  ,'  ,no_access_without_mask:', NEW.no_access_without_mask  ,'  ,certificate_threshold:', NEW.certificate_threshold  ,'  ,strong_hint:', NEW.strong_hint  ,'  ,save_elec_mode:', NEW.save_elec_mode  ,'  ,touch_recognition:', NEW.touch_recognition  ,'  ,touch_recognition_custom_picture:', NEW.touch_recognition_custom_picture  ,'  ,touch_recognition_return_time:', NEW.touch_recognition_return_time  ,'  ,touch_recognition_timeout:', NEW.touch_recognition_timeout  ,'  ,door_sensor_timeout:', NEW.door_sensor_timeout  ,'  ,wake_distance:', NEW.wake_distance  ,'  ,wifi_ssid:', NEW.wifi_ssid  ,'  ,wifi_pwd:', NEW.wifi_pwd  ,'  ,ntp_set:', NEW.ntp_set  ,'  ,short_exposure:', NEW.short_exposure  ,'  ,sleep_time:', NEW.sleep_time  ,'  ,standby_touch_wakeup:', NEW.standby_touch_wakeup  ,'  ,screen_brightness:', NEW.screen_brightness  ,'  ,sound_volume:', NEW.sound_volume  ,'  ,setup_env:', NEW.setup_env  ,'  ,no_access_with_mask:', NEW.no_access_with_mask  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,device_uuid:', old.device_uuid  ,'  ,server_verify:', old.server_verify  ,'  ,server_address:', old.server_address  ,'  ,ntp_server_address:', old.ntp_server_address  ,'  ,other_server:', old.other_server  ,'  ,other_server_address:', old.other_server_address  ,'  ,network_relay_address:', old.network_relay_address  ,'  ,face_update_threshold:', old.face_update_threshold  ,'  ,yaw:', old.yaw  ,'  ,pitch:', old.pitch  ,'  ,roll:', old.roll  ,'  ,face_width:', old.face_width  ,'  ,wake_up_distance:', old.wake_up_distance  ,'  ,recognition_distance:', old.recognition_distance  ,'  ,liveness:', old.liveness  ,'  ,liveness_threshold:', old.liveness_threshold  ,'  ,verify_threshold:', old.verify_threshold  ,'  ,logo:', old.logo  ,'  ,video_tip:', old.video_tip  ,'  ,welcome_tip:', old.welcome_tip  ,'  ,show_name:', old.show_name  ,'  ,show_avatar_type:', old.show_avatar_type  ,'  ,verify_fault_role_tip:', old.verify_fault_role_tip  ,'  ,liveness_success_role_tip:', old.liveness_success_role_tip  ,'  ,liveness_success_tip:', old.liveness_success_tip  ,'  ,verify_success_tip:', old.verify_success_tip  ,'  ,verify_fault_tip:', old.verify_fault_tip  ,'  ,use_show_avatar:', old.use_show_avatar  ,'  ,show_user_name:', old.show_user_name  ,'  ,show_user_info:', old.show_user_info  ,'  ,auto_led:', old.auto_led  ,'  ,fill_light:', old.fill_light  ,'  ,forced_open_upload:', old.forced_open_upload  ,'  ,dismantle_upload:', old.dismantle_upload  ,'  ,guest_notification:', old.guest_notification  ,'  ,voice:', old.voice  ,'  ,voice_broadcast:', old.voice_broadcast  ,'  ,infrared_probe:', old.infrared_probe  ,'  ,start_time:', old.start_time  ,'  ,end_time:', old.end_time  ,'  ,buzzer_status:', old.buzzer_status  ,'  ,gpio_a:', old.gpio_a  ,'  ,gpio_b:', old.gpio_b  ,'  ,gpio_c:', old.gpio_c  ,'  ,papl_gpio_a:', old.papl_gpio_a  ,'  ,papl_gpio_b:', old.papl_gpio_b  ,'  ,papl_gpio_c:', old.papl_gpio_c  ,'  ,papl_gpio_d:', old.papl_gpio_d  ,'  ,papl_gpio_e:', old.papl_gpio_e  ,'  ,papl_gpio_f:', old.papl_gpio_f  ,'  ,open_door_time:', old.open_door_time  ,'  ,open_interval:', old.open_interval  ,'  ,keep_door_open_duration:', old.keep_door_open_duration  ,'  ,wigan_input:', old.wigan_input  ,'  ,open_door_type:', old.open_door_type  ,'  ,standby_open:', old.standby_open  ,'  ,face_num:', old.face_num  ,'  ,no_action_threshold:', old.no_action_threshold  ,'  ,no_match_threshold:', old.no_match_threshold  ,'  ,config_default_flag:', old.config_default_flag  ,'  ,device_run_type:', old.device_run_type  ,'  ,auto_reboot:', old.auto_reboot  ,'  ,reboot_time:', old.reboot_time  ,'  ,wait_time:', old.wait_time  ,'  ,simplify_model:', old.simplify_model  ,'  ,admin_pwd:', old.admin_pwd  ,'  ,dormancy_type:', old.dormancy_type  ,'  ,language_type:', old.language_type  ,'  ,use_mode:', old.use_mode  ,'  ,pro_use_mode:', old.pro_use_mode  ,'  ,mode:', old.mode  ,'  ,bluetooth_mac:', old.bluetooth_mac  ,'  ,change_server_url:', old.change_server_url  ,'  ,device_reboot_time:', old.device_reboot_time  ,'  ,access_control_status:', old.access_control_status  ,'  ,access_control_timetable:', old.access_control_timetable  ,'  ,timetable_upd_ts:', old.timetable_upd_ts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_product_type_uuid:', old.device_product_type_uuid  ,'  ,device_type_uuid:', old.device_type_uuid  ,'  ,sts:', old.sts  ,'  ,black_list_open:', old.black_list_open  ,'  ,black_list_tip:', old.black_list_tip  ,'  ,device_button_name1:', old.device_button_name1  ,'  ,device_button_value1:', old.device_button_value1  ,'  ,device_button_name2:', old.device_button_name2  ,'  ,device_button_value2:', old.device_button_value2  ,'  ,device_button_name3:', old.device_button_name3  ,'  ,device_button_value3:', old.device_button_value3  ,'  ,device_button_name4:', old.device_button_name4  ,'  ,device_button_value4:', old.device_button_value4  ,'  ,device_button_name5:', old.device_button_name5  ,'  ,device_button_value5:', old.device_button_value5  ,'  ,device_button_name6:', old.device_button_name6  ,'  ,device_button_value6:', old.device_button_value6  ,'  ,temperature_detect:', old.temperature_detect  ,'  ,fever_temperature:', old.fever_temperature  ,'  ,no_access_to_fevers:', old.no_access_to_fevers  ,'  ,show_thermal_screen:', old.show_thermal_screen  ,'  ,indoor_temperature:', old.indoor_temperature  ,'  ,temperature_detect_distance:', old.temperature_detect_distance  ,'  ,quick_detect_mode:', old.quick_detect_mode  ,'  ,mask_detect:', old.mask_detect  ,'  ,no_access_without_mask:', old.no_access_without_mask  ,'  ,certificate_threshold:', old.certificate_threshold  ,'  ,strong_hint:', old.strong_hint  ,'  ,save_elec_mode:', old.save_elec_mode  ,'  ,touch_recognition:', old.touch_recognition  ,'  ,touch_recognition_custom_picture:', old.touch_recognition_custom_picture  ,'  ,touch_recognition_return_time:', old.touch_recognition_return_time  ,'  ,touch_recognition_timeout:', old.touch_recognition_timeout  ,'  ,door_sensor_timeout:', old.door_sensor_timeout  ,'  ,wake_distance:', old.wake_distance  ,'  ,wifi_ssid:', old.wifi_ssid  ,'  ,wifi_pwd:', old.wifi_pwd  ,'  ,ntp_set:', old.ntp_set  ,'  ,short_exposure:', old.short_exposure  ,'  ,sleep_time:', old.sleep_time  ,'  ,standby_touch_wakeup:', old.standby_touch_wakeup  ,'  ,screen_brightness:', old.screen_brightness  ,'  ,sound_volume:', old.sound_volume  ,'  ,setup_env:', old.setup_env  ,'  ,no_access_with_mask:', old.no_access_with_mask   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO bi_device_info_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists bi_device_info_delete_trigger; 
	create  trigger bi_device_info_delete_trigger
    after delete
    on device.bi_device_info
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,device_uuid:', old.device_uuid  ,'  ,server_verify:', old.server_verify  ,'  ,server_address:', old.server_address  ,'  ,ntp_server_address:', old.ntp_server_address  ,'  ,other_server:', old.other_server  ,'  ,other_server_address:', old.other_server_address  ,'  ,network_relay_address:', old.network_relay_address  ,'  ,face_update_threshold:', old.face_update_threshold  ,'  ,yaw:', old.yaw  ,'  ,pitch:', old.pitch  ,'  ,roll:', old.roll  ,'  ,face_width:', old.face_width  ,'  ,wake_up_distance:', old.wake_up_distance  ,'  ,recognition_distance:', old.recognition_distance  ,'  ,liveness:', old.liveness  ,'  ,liveness_threshold:', old.liveness_threshold  ,'  ,verify_threshold:', old.verify_threshold  ,'  ,logo:', old.logo  ,'  ,video_tip:', old.video_tip  ,'  ,welcome_tip:', old.welcome_tip  ,'  ,show_name:', old.show_name  ,'  ,show_avatar_type:', old.show_avatar_type  ,'  ,verify_fault_role_tip:', old.verify_fault_role_tip  ,'  ,liveness_success_role_tip:', old.liveness_success_role_tip  ,'  ,liveness_success_tip:', old.liveness_success_tip  ,'  ,verify_success_tip:', old.verify_success_tip  ,'  ,verify_fault_tip:', old.verify_fault_tip  ,'  ,use_show_avatar:', old.use_show_avatar  ,'  ,show_user_name:', old.show_user_name  ,'  ,show_user_info:', old.show_user_info  ,'  ,auto_led:', old.auto_led  ,'  ,fill_light:', old.fill_light  ,'  ,forced_open_upload:', old.forced_open_upload  ,'  ,dismantle_upload:', old.dismantle_upload  ,'  ,guest_notification:', old.guest_notification  ,'  ,voice:', old.voice  ,'  ,voice_broadcast:', old.voice_broadcast  ,'  ,infrared_probe:', old.infrared_probe  ,'  ,start_time:', old.start_time  ,'  ,end_time:', old.end_time  ,'  ,buzzer_status:', old.buzzer_status  ,'  ,gpio_a:', old.gpio_a  ,'  ,gpio_b:', old.gpio_b  ,'  ,gpio_c:', old.gpio_c  ,'  ,papl_gpio_a:', old.papl_gpio_a  ,'  ,papl_gpio_b:', old.papl_gpio_b  ,'  ,papl_gpio_c:', old.papl_gpio_c  ,'  ,papl_gpio_d:', old.papl_gpio_d  ,'  ,papl_gpio_e:', old.papl_gpio_e  ,'  ,papl_gpio_f:', old.papl_gpio_f  ,'  ,open_door_time:', old.open_door_time  ,'  ,open_interval:', old.open_interval  ,'  ,keep_door_open_duration:', old.keep_door_open_duration  ,'  ,wigan_input:', old.wigan_input  ,'  ,open_door_type:', old.open_door_type  ,'  ,standby_open:', old.standby_open  ,'  ,face_num:', old.face_num  ,'  ,no_action_threshold:', old.no_action_threshold  ,'  ,no_match_threshold:', old.no_match_threshold  ,'  ,config_default_flag:', old.config_default_flag  ,'  ,device_run_type:', old.device_run_type  ,'  ,auto_reboot:', old.auto_reboot  ,'  ,reboot_time:', old.reboot_time  ,'  ,wait_time:', old.wait_time  ,'  ,simplify_model:', old.simplify_model  ,'  ,admin_pwd:', old.admin_pwd  ,'  ,dormancy_type:', old.dormancy_type  ,'  ,language_type:', old.language_type  ,'  ,use_mode:', old.use_mode  ,'  ,pro_use_mode:', old.pro_use_mode  ,'  ,mode:', old.mode  ,'  ,bluetooth_mac:', old.bluetooth_mac  ,'  ,change_server_url:', old.change_server_url  ,'  ,device_reboot_time:', old.device_reboot_time  ,'  ,access_control_status:', old.access_control_status  ,'  ,access_control_timetable:', old.access_control_timetable  ,'  ,timetable_upd_ts:', old.timetable_upd_ts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_product_type_uuid:', old.device_product_type_uuid  ,'  ,device_type_uuid:', old.device_type_uuid  ,'  ,sts:', old.sts  ,'  ,black_list_open:', old.black_list_open  ,'  ,black_list_tip:', old.black_list_tip  ,'  ,device_button_name1:', old.device_button_name1  ,'  ,device_button_value1:', old.device_button_value1  ,'  ,device_button_name2:', old.device_button_name2  ,'  ,device_button_value2:', old.device_button_value2  ,'  ,device_button_name3:', old.device_button_name3  ,'  ,device_button_value3:', old.device_button_value3  ,'  ,device_button_name4:', old.device_button_name4  ,'  ,device_button_value4:', old.device_button_value4  ,'  ,device_button_name5:', old.device_button_name5  ,'  ,device_button_value5:', old.device_button_value5  ,'  ,device_button_name6:', old.device_button_name6  ,'  ,device_button_value6:', old.device_button_value6  ,'  ,temperature_detect:', old.temperature_detect  ,'  ,fever_temperature:', old.fever_temperature  ,'  ,no_access_to_fevers:', old.no_access_to_fevers  ,'  ,show_thermal_screen:', old.show_thermal_screen  ,'  ,indoor_temperature:', old.indoor_temperature  ,'  ,temperature_detect_distance:', old.temperature_detect_distance  ,'  ,quick_detect_mode:', old.quick_detect_mode  ,'  ,mask_detect:', old.mask_detect  ,'  ,no_access_without_mask:', old.no_access_without_mask  ,'  ,certificate_threshold:', old.certificate_threshold  ,'  ,strong_hint:', old.strong_hint  ,'  ,save_elec_mode:', old.save_elec_mode  ,'  ,touch_recognition:', old.touch_recognition  ,'  ,touch_recognition_custom_picture:', old.touch_recognition_custom_picture  ,'  ,touch_recognition_return_time:', old.touch_recognition_return_time  ,'  ,touch_recognition_timeout:', old.touch_recognition_timeout  ,'  ,door_sensor_timeout:', old.door_sensor_timeout  ,'  ,wake_distance:', old.wake_distance  ,'  ,wifi_ssid:', old.wifi_ssid  ,'  ,wifi_pwd:', old.wifi_pwd  ,'  ,ntp_set:', old.ntp_set  ,'  ,short_exposure:', old.short_exposure  ,'  ,sleep_time:', old.sleep_time  ,'  ,standby_touch_wakeup:', old.standby_touch_wakeup  ,'  ,screen_brightness:', old.screen_brightness  ,'  ,sound_volume:', old.sound_volume  ,'  ,setup_env:', old.setup_env  ,'  ,no_access_with_mask:', old.no_access_with_mask   );
	INSERT INTO bi_device_info_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use device;
drop table if exists device_logs;
create table device_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists device_insert_trigger;
	 create  trigger device_insert_trigger
		after insert
		on device.device
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,external_did:', NEW.external_did  ,'  ,device_serial_no:', NEW.device_serial_no  ,'  ,device_secret:', NEW.device_secret  ,'  ,device_cn_name:', NEW.device_cn_name  ,'  ,device_en_name:', NEW.device_en_name  ,'  ,device_port:', NEW.device_port  ,'  ,device_ip:', NEW.device_ip  ,'  ,device_uri:', NEW.device_uri  ,'  ,device_version:', NEW.device_version  ,'  ,device_conn_type:', NEW.device_conn_type  ,'  ,device_protocol:', NEW.device_protocol  ,'  ,last_checked_ts:',  IF(NEW.last_checked_ts IS NOT NULL,DATE_FORMAT(NEW.last_checked_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,product_typeuuid:', NEW.product_typeuuid  ,'  ,device_typeuuid:', NEW.device_typeuuid  ,'  ,device_tag:', NEW.device_tag  ,'  ,target_group:', NEW.target_group  ,'  ,matching_threshold:', NEW.matching_threshold  ,'  ,face_attribute:', NEW.face_attribute  ,'  ,liveness_check:', NEW.liveness_check  ,'  ,ingress_qc_threshold:', NEW.ingress_qc_threshold  ,'  ,ingress_angle_threshold:', NEW.ingress_angle_threshold  ,'  ,frameRate:', NEW.frameRate  ,'  ,stream_height:', NEW.stream_height  ,'  ,stream_width:', NEW.stream_width  ,'  ,description:', NEW.description  ,'  ,privilege:', NEW.privilege  ,'  ,bk_image_storage:', NEW.bk_image_storage  ,'  ,bounding_box_size_threshold:', NEW.bounding_box_size_threshold  ,'  ,remark:',JSON_OBJECT('remark',  NEW.remark)  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_templateuuid:', NEW.device_templateuuid  ,'  ,access_control_sts:', NEW.access_control_sts  ,'  ,frame_skip:', NEW.frame_skip  ,'  ,in_out_direction:', NEW.in_out_direction   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO device_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists device_update_trigger;
	 create trigger device_update_trigger
				after update
				on device.device
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,external_did:', NEW.external_did  ,'  ,device_serial_no:', NEW.device_serial_no  ,'  ,device_secret:', NEW.device_secret  ,'  ,device_cn_name:', NEW.device_cn_name  ,'  ,device_en_name:', NEW.device_en_name  ,'  ,device_port:', NEW.device_port  ,'  ,device_ip:', NEW.device_ip  ,'  ,device_uri:', NEW.device_uri  ,'  ,device_version:', NEW.device_version  ,'  ,device_conn_type:', NEW.device_conn_type  ,'  ,device_protocol:', NEW.device_protocol  ,'  ,last_checked_ts:',  IF(NEW.last_checked_ts IS NOT NULL,DATE_FORMAT(NEW.last_checked_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,product_typeuuid:', NEW.product_typeuuid  ,'  ,device_typeuuid:', NEW.device_typeuuid  ,'  ,device_tag:', NEW.device_tag  ,'  ,target_group:', NEW.target_group  ,'  ,matching_threshold:', NEW.matching_threshold  ,'  ,face_attribute:', NEW.face_attribute  ,'  ,liveness_check:', NEW.liveness_check  ,'  ,ingress_qc_threshold:', NEW.ingress_qc_threshold  ,'  ,ingress_angle_threshold:', NEW.ingress_angle_threshold  ,'  ,frameRate:', NEW.frameRate  ,'  ,stream_height:', NEW.stream_height  ,'  ,stream_width:', NEW.stream_width  ,'  ,description:', NEW.description  ,'  ,privilege:', NEW.privilege  ,'  ,bk_image_storage:', NEW.bk_image_storage  ,'  ,bounding_box_size_threshold:', NEW.bounding_box_size_threshold  ,'  ,remark:',JSON_OBJECT('remark',  NEW.remark)  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_templateuuid:', NEW.device_templateuuid  ,'  ,access_control_sts:', NEW.access_control_sts  ,'  ,frame_skip:', NEW.frame_skip  ,'  ,in_out_direction:', NEW.in_out_direction  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,external_did:', old.external_did  ,'  ,device_serial_no:', old.device_serial_no  ,'  ,device_secret:', old.device_secret  ,'  ,device_cn_name:', old.device_cn_name  ,'  ,device_en_name:', old.device_en_name  ,'  ,device_port:', old.device_port  ,'  ,device_ip:', old.device_ip  ,'  ,device_uri:', old.device_uri  ,'  ,device_version:', old.device_version  ,'  ,device_conn_type:', old.device_conn_type  ,'  ,device_protocol:', old.device_protocol  ,'  ,last_checked_ts:', IF(NEW.last_checked_ts IS NOT NULL,DATE_FORMAT(NEW.last_checked_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,product_typeuuid:', old.product_typeuuid  ,'  ,device_typeuuid:', old.device_typeuuid  ,'  ,device_tag:', old.device_tag  ,'  ,target_group:', old.target_group  ,'  ,matching_threshold:', old.matching_threshold  ,'  ,face_attribute:', old.face_attribute  ,'  ,liveness_check:', old.liveness_check  ,'  ,ingress_qc_threshold:', old.ingress_qc_threshold  ,'  ,ingress_angle_threshold:', old.ingress_angle_threshold  ,'  ,frameRate:', old.frameRate  ,'  ,stream_height:', old.stream_height  ,'  ,stream_width:', old.stream_width  ,'  ,description:', old.description  ,'  ,privilege:', old.privilege  ,'  ,bk_image_storage:', old.bk_image_storage  ,'  ,bounding_box_size_threshold:', old.bounding_box_size_threshold  ,'  ,remark:',JSON_OBJECT('remark',  old.remark)  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_templateuuid:', old.device_templateuuid  ,'  ,access_control_sts:', old.access_control_sts  ,'  ,frame_skip:', old.frame_skip  ,'  ,in_out_direction:', old.in_out_direction   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO device_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists device_delete_trigger; 
	create  trigger device_delete_trigger
    after delete
    on device.device
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,external_did:', old.external_did  ,'  ,device_serial_no:', old.device_serial_no  ,'  ,device_secret:', old.device_secret  ,'  ,device_cn_name:', old.device_cn_name  ,'  ,device_en_name:', old.device_en_name  ,'  ,device_port:', old.device_port  ,'  ,device_ip:', old.device_ip  ,'  ,device_uri:', old.device_uri  ,'  ,device_version:', old.device_version  ,'  ,device_conn_type:', old.device_conn_type  ,'  ,device_protocol:', old.device_protocol  ,'  ,last_checked_ts:', IF(NEW.last_checked_ts IS NOT NULL,DATE_FORMAT(NEW.last_checked_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,product_typeuuid:', old.product_typeuuid  ,'  ,device_typeuuid:', old.device_typeuuid  ,'  ,device_tag:', old.device_tag  ,'  ,target_group:', old.target_group  ,'  ,matching_threshold:', old.matching_threshold  ,'  ,face_attribute:', old.face_attribute  ,'  ,liveness_check:', old.liveness_check  ,'  ,ingress_qc_threshold:', old.ingress_qc_threshold  ,'  ,ingress_angle_threshold:', old.ingress_angle_threshold  ,'  ,frameRate:', old.frameRate  ,'  ,stream_height:', old.stream_height  ,'  ,stream_width:', old.stream_width  ,'  ,description:', old.description  ,'  ,privilege:', old.privilege  ,'  ,bk_image_storage:', old.bk_image_storage  ,'  ,bounding_box_size_threshold:', old.bounding_box_size_threshold  ,'  ,remark:',JSON_OBJECT('remark',  old.remark)  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,device_templateuuid:', old.device_templateuuid  ,'  ,access_control_sts:', old.access_control_sts  ,'  ,frame_skip:', old.frame_skip  ,'  ,in_out_direction:', old.in_out_direction   );
	INSERT INTO device_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use device;
drop table if exists device_group_logs;
create table device_group_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists device_group_insert_trigger;
	 create  trigger device_group_insert_trigger
		after insert
		on device.device_group
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,uuid:', NEW.uuid  ,'  ,name:', NEW.name  ,'  ,privilege:', NEW.privilege  ,'  ,product_type_id:', NEW.product_type_id  ,'  ,device_type_id:', NEW.device_type_id  ,'  ,remark:',JSON_OBJECT('remark',  NEW.remark)  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO device_group_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.uuid, operate_paramsVal);
			END;
drop trigger if exists device_group_update_trigger;
	 create trigger device_group_update_trigger
				after update
				on device.device_group
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,uuid:', NEW.uuid  ,'  ,name:', NEW.name  ,'  ,privilege:', NEW.privilege  ,'  ,product_type_id:', NEW.product_type_id  ,'  ,device_type_id:', NEW.device_type_id  ,'  ,remark:',JSON_OBJECT('remark',  NEW.remark)  ,'  ,sts:', NEW.sts  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', NEW.last_mod_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,uuid:', old.uuid  ,'  ,name:', old.name  ,'  ,privilege:', old.privilege  ,'  ,product_type_id:', old.product_type_id  ,'  ,device_type_id:', old.device_type_id  ,'  ,remark:',JSON_OBJECT('remark',  old.remark)  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO device_group_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.uuid, concat(old_params,new_params));
			end;
drop trigger if exists device_group_delete_trigger; 
	create  trigger device_group_delete_trigger
    after delete
    on device.device_group
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,uuid:', old.uuid  ,'  ,name:', old.name  ,'  ,privilege:', old.privilege  ,'  ,product_type_id:', old.product_type_id  ,'  ,device_type_id:', old.device_type_id  ,'  ,remark:',JSON_OBJECT('remark',  old.remark)  ,'  ,sts:', old.sts  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_user:', old.last_mod_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   );
	INSERT INTO device_group_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.uuid, old_paramsVal);
end;

use guns;
drop table if exists dept_logs;
create table dept_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists dept_insert_trigger;
	 create  trigger dept_insert_trigger
		after insert
		on guns.dept
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,id:', NEW.id  ,'  ,num:', NEW.num  ,'  ,pid:', NEW.pid  ,'  ,simplename:', NEW.simplename  ,'  ,fullname:', NEW.fullname  ,'  ,levels:', NEW.levels  ,'  ,tips:', NEW.tips  ,'  ,version:', NEW.version  ,'  ,resource_tenancyid:', NEW.resource_tenancyid   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO dept_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.id, operate_paramsVal);
			END;
drop trigger if exists dept_update_trigger;
	 create trigger dept_update_trigger
				after update
				on guns.dept
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,id:', NEW.id  ,'  ,num:', NEW.num  ,'  ,pid:', NEW.pid  ,'  ,simplename:', NEW.simplename  ,'  ,fullname:', NEW.fullname  ,'  ,levels:', NEW.levels  ,'  ,tips:', NEW.tips  ,'  ,version:', NEW.version  ,'  ,resource_tenancyid:', NEW.resource_tenancyid  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,id:', old.id  ,'  ,num:', old.num  ,'  ,pid:', old.pid  ,'  ,simplename:', old.simplename  ,'  ,fullname:', old.fullname  ,'  ,levels:', old.levels  ,'  ,tips:', old.tips  ,'  ,version:', old.version  ,'  ,resource_tenancyid:', old.resource_tenancyid   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO dept_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.id, concat(old_params,new_params));
			end;
drop trigger if exists dept_delete_trigger; 
	create  trigger dept_delete_trigger
    after delete
    on guns.dept
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,id:', old.id  ,'  ,num:', old.num  ,'  ,pid:', old.pid  ,'  ,simplename:', old.simplename  ,'  ,fullname:', old.fullname  ,'  ,levels:', old.levels  ,'  ,tips:', old.tips  ,'  ,version:', old.version  ,'  ,resource_tenancyid:', old.resource_tenancyid   );
	INSERT INTO dept_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.id, old_paramsVal);
end;

use guns;
drop table if exists role_logs;
create table role_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists role_insert_trigger;
	 create  trigger role_insert_trigger
		after insert
		on guns.role
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,id:', NEW.id  ,'  ,num:', NEW.num  ,'  ,pid:', NEW.pid  ,'  ,name:', NEW.name  ,'  ,deptid:', NEW.deptid  ,'  ,tips:', NEW.tips  ,'  ,version:', NEW.version  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO role_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.id, operate_paramsVal);
			END;
drop trigger if exists role_update_trigger;
	 create trigger role_update_trigger
				after update
				on guns.role
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,id:', NEW.id  ,'  ,num:', NEW.num  ,'  ,pid:', NEW.pid  ,'  ,name:', NEW.name  ,'  ,deptid:', NEW.deptid  ,'  ,tips:', NEW.tips  ,'  ,version:', NEW.version  ,'  ,create_user:', NEW.create_user  ,'  ,create_ts:',  IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,id:', old.id  ,'  ,num:', old.num  ,'  ,pid:', old.pid  ,'  ,name:', old.name  ,'  ,deptid:', old.deptid  ,'  ,tips:', old.tips  ,'  ,version:', old.version  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO role_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.id, concat(old_params,new_params));
			end;
drop trigger if exists role_delete_trigger; 
	create  trigger role_delete_trigger
    after delete
    on guns.role
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,id:', old.id  ,'  ,num:', old.num  ,'  ,pid:', old.pid  ,'  ,name:', old.name  ,'  ,deptid:', old.deptid  ,'  ,tips:', old.tips  ,'  ,version:', old.version  ,'  ,create_user:', old.create_user  ,'  ,create_ts:', IF(NEW.create_ts IS NOT NULL,DATE_FORMAT(NEW.create_ts, '%Y-%m-%d %H:%i:%s'),'null')  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   );
	INSERT INTO role_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.id, old_paramsVal);
end;

use guns;
drop table if exists user_logs;
create table user_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;
drop trigger if exists user_insert_trigger;
	 create  trigger user_insert_trigger
		after insert
		on guns.user
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ,'  ,id:', NEW.id  ,'  ,avatar:', NEW.avatar  ,'  ,account:', NEW.account  ,'  ,password:', NEW.password  ,'  ,salt:', NEW.salt  ,'  ,account_type:', NEW.account_type  ,'  ,name:', NEW.name  ,'  ,birthday:', NEW.birthday  ,'  ,sex:', NEW.sex  ,'  ,email:', NEW.email  ,'  ,phone:', NEW.phone  ,'  ,roleid:', NEW.roleid  ,'  ,deptid:', NEW.deptid  ,'  ,status:', NEW.status  ,'  ,createtime:', NEW.createtime  ,'  ,version:', NEW.version  ,'  ,create_user:', NEW.create_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO user_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.id, operate_paramsVal);
			END;
drop trigger if exists user_update_trigger;
	 create trigger user_update_trigger
				after update
				on guns.user
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ,'  ,id:', NEW.id  ,'  ,avatar:', NEW.avatar  ,'  ,account:', NEW.account  ,'  ,password:', NEW.password  ,'  ,salt:', NEW.salt  ,'  ,account_type:', NEW.account_type  ,'  ,name:', NEW.name  ,'  ,birthday:', NEW.birthday  ,'  ,sex:', NEW.sex  ,'  ,email:', NEW.email  ,'  ,phone:', NEW.phone  ,'  ,roleid:', NEW.roleid  ,'  ,deptid:', NEW.deptid  ,'  ,status:', NEW.status  ,'  ,createtime:', NEW.createtime  ,'  ,version:', NEW.version  ,'  ,create_user:', NEW.create_user  ,'  ,last_mod_ts:',  IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')  );
				SET new_params=CONCAT(' The updated content is:' ,'  ,id:', old.id  ,'  ,avatar:', old.avatar  ,'  ,account:', old.account  ,'  ,password:', old.password  ,'  ,salt:', old.salt  ,'  ,account_type:', old.account_type  ,'  ,name:', old.name  ,'  ,birthday:', old.birthday  ,'  ,sex:', old.sex  ,'  ,email:', old.email  ,'  ,phone:', old.phone  ,'  ,roleid:', old.roleid  ,'  ,deptid:', old.deptid  ,'  ,status:', old.status  ,'  ,createtime:', old.createtime  ,'  ,version:', old.version  ,'  ,create_user:', old.create_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO user_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.id, concat(old_params,new_params));
			end;
drop trigger if exists user_delete_trigger; 
	create  trigger user_delete_trigger
    after delete
    on guns.user
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' ,'  ,id:', old.id  ,'  ,avatar:', old.avatar  ,'  ,account:', old.account  ,'  ,password:', old.password  ,'  ,salt:', old.salt  ,'  ,account_type:', old.account_type  ,'  ,name:', old.name  ,'  ,birthday:', old.birthday  ,'  ,sex:', old.sex  ,'  ,email:', old.email  ,'  ,phone:', old.phone  ,'  ,roleid:', old.roleid  ,'  ,deptid:', old.deptid  ,'  ,status:', old.status  ,'  ,createtime:', old.createtime  ,'  ,version:', old.version  ,'  ,create_user:', old.create_user  ,'  ,last_mod_ts:', IF(NEW.last_mod_ts IS NOT NULL,DATE_FORMAT(NEW.last_mod_ts, '%Y-%m-%d %H:%i:%s'),'null')   );
	INSERT INTO user_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.id, old_paramsVal);
end;
