package main

import (
	"database/sql"
	"fmt"
	"os"
	"strings"

	_ "github.com/go-sql-driver/mysql"
)

type Field struct {
	fieldName string
	fieldDesc string
	dataType  string
	isNull    string
	length    int
}

func main() {
	// 设置数据库连接信息
	dsn := "root:sensetime2021@tcp(10.53.24.29:3306)/oms"

	// 连接数据库
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		fmt.Println("数据库连接失败:", err)
		return
	}
	// 测试连接
	err = db.Ping()
	if err != nil {
		fmt.Println("数据库连接失败:", err)
		return
	}

	fmt.Println("数据库连接成功！")
	defer db.Close()
	// dbName := "oms"
	// tableName := "user"
	sqlStr := `SELECT COLUMN_NAME fName,column_comment fDesc,DATA_TYPE dataType,
						IS_NULLABLE isNull,IFNULL(CHARACTER_MAXIMUM_LENGTH,0) sLength
			FROM information_schema.columns 
			WHERE table_schema = ? AND table_name = ?`

	//cognitivesvc := []string{"person_face_feature"}
	device := []string{"bi_device_info",
		"device",
		"device_group"}
	guns := []string{"dept",
		"role",
		"user"}
	maps := []string{
		"space",
		"zone"}

	person := []string{"person",
		"person_group",
		"person_group_member",
		"person_image"}
	control := []string{
		"control_device_group_relation",
		"control_policy_device_relation",
		"control_policy_target_relation",
		"gate_control_policy"}
	sensebi := []string{
		"t_hello_device"}
	handler := []string{
		"system_config"}
	tableMap := make(map[string][]string)
	//tableMap["cognitivesvcx"] = cognitivesvc
	tableMap["device"] = device
	tableMap["guns"] = guns
	tableMap["map"] = maps
	tableMap["person"] = person
	tableMap["policy_control"] = control
	tableMap["sensebi"] = sensebi
	tableMap["system_config_handler"] = handler

	createsql := `
use ddd;
drop table if exists ?_logs;
create table ?_logs
(  id  int auto_increment
	primary key,
	operation      varchar(30) not null,
	operation_time datetime    not null,
	operation_id   int         null,
	operate_params text        null
)
	charset = utf8;`
	insert_trigger := `drop trigger if exists xxx_insert_trigger;
	 create  trigger xxx_insert_trigger
		after insert
		on ddd.xxx
		for each row
			BEGIN
				DECLARE operate_paramsVal TEXT DEFAULT '';

				SET operate_paramsVal = CONCAT(' The insertion reads: ' ? ); -- 列出所有字段并获取NEW中的对应值

				INSERT INTO xxx_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'insert', NOW(), NEW.fristxx, operate_paramsVal);
			END;`
	update_trigger := `drop trigger if exists xxx_update_trigger;
	 create trigger xxx_update_trigger
				after update
				on ddd.xxx
				for each row
			begin
				 DECLARE old_params TEXT DEFAULT '';
				  DECLARE new_params TEXT DEFAULT '';
				SET old_params = CONCAT(' Before the update it read: ' ?);
				SET new_params=CONCAT(' The updated content is:' <<>> ); -- 列出所有字段并获取NEW中的对应值
			
					 INSERT INTO xxx_logs (id, operation, operation_time, operation_id, operate_params)
				VALUES (NULL, 'update', NOW(), NEW.fristxx, concat(old_params,new_params));
			end;`
	delete_trigger := `drop trigger if exists xxx_delete_trigger; 
	create  trigger xxx_delete_trigger
    after delete
    on ddd.xxx
    for each row
    begin
     DECLARE old_paramsVal TEXT DEFAULT '';
     SET old_paramsVal = CONCAT(' Deleted content: ' <<>> );
	INSERT INTO xxx_logs (id, operation, operation_time, operation_id, operate_params)
    VALUES (NULL, 'delete', NOW(), old.fristxx, old_paramsVal);
end;`
	file, err := os.OpenFile("output.sql", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		fmt.Println("打开文件出错:", err)
		return
	}
	defer file.Close()

	for key, val := range tableMap {
		for _, tableName := range val {
			rows, _ := db.Query(sqlStr, key, tableName)
			insert_trigger_new := strings.ReplaceAll(insert_trigger, "xxx", tableName)
			update_trigger_new := strings.ReplaceAll(update_trigger, "xxx", tableName)
			delete_trigger_new := strings.ReplaceAll(delete_trigger, "xxx", tableName)
			insert_trigger_new = strings.ReplaceAll(insert_trigger_new, "ddd", key)
			update_trigger_new = strings.ReplaceAll(update_trigger_new, "ddd", key)
			delete_trigger_new = strings.ReplaceAll(delete_trigger_new, "ddd", key)
			var oldstr = ""
			var newstr = ""
			for rows.Next() {
				var f Field
				err = rows.Scan(&f.fieldName, &f.fieldDesc, &f.dataType, &f.isNull, &f.length)
				fmt.Println(f.dataType)
				if f.dataType == "json" {
					oldstr += ",'  ," + f.fieldName + ":',JSON_OBJECT('" + f.fieldName + "',  old." + f.fieldName + ")  "
					newstr += ",'  ," + f.fieldName + ":',JSON_OBJECT('" + f.fieldName + "',  NEW." + f.fieldName + ")  "
				} else if f.dataType == "timestamp" {
					oldstr += ",'  ," + f.fieldName + ":', IF(NEW." + f.fieldName + " IS NOT NULL,DATE_FORMAT(NEW." + f.fieldName + ", '%Y-%m-%d %H:%i:%s'),'null')  "
					newstr += ",'  ," + f.fieldName + ":',  IF(NEW." + f.fieldName + " IS NOT NULL,DATE_FORMAT(NEW." + f.fieldName + ", '%Y-%m-%d %H:%i:%s'),'null')  "
				} else {
					oldstr += ",'  ," + f.fieldName + ":', old." + f.fieldName + "  "
					newstr += ",'  ," + f.fieldName + ":', NEW." + f.fieldName + "  "
				}
				if f.fieldName == "id" {
					insert_trigger_new = strings.ReplaceAll(insert_trigger_new, "fristxx", "id")
					update_trigger_new = strings.ReplaceAll(update_trigger_new, "fristxx", "id")
					delete_trigger_new = strings.ReplaceAll(delete_trigger_new, "fristxx", "id")
				}
				if f.fieldName == "UUID" {
					insert_trigger_new = strings.ReplaceAll(insert_trigger_new, "fristxx", "uuid")
					update_trigger_new = strings.ReplaceAll(update_trigger_new, "fristxx", "uuid")
					delete_trigger_new = strings.ReplaceAll(delete_trigger_new, "fristxx", "uuid")
				}
				if f.fieldName == "uuid" {
					insert_trigger_new = strings.ReplaceAll(insert_trigger_new, "fristxx", "uuid")
					update_trigger_new = strings.ReplaceAll(update_trigger_new, "fristxx", "uuid")
					delete_trigger_new = strings.ReplaceAll(delete_trigger_new, "fristxx", "uuid")
				}
				if f.fieldName == "person_group_uuid" {
					insert_trigger_new = strings.ReplaceAll(insert_trigger_new, "fristxx", "person_group_uuid")
					update_trigger_new = strings.ReplaceAll(update_trigger_new, "fristxx", "person_group_uuid")
					delete_trigger_new = strings.ReplaceAll(delete_trigger_new, "fristxx", "person_group_uuid")
				}
				if f.fieldName == "variable" {
					insert_trigger_new = strings.ReplaceAll(insert_trigger_new, "fristxx", "variable")
					update_trigger_new = strings.ReplaceAll(update_trigger_new, "fristxx", "variable")
					delete_trigger_new = strings.ReplaceAll(delete_trigger_new, "fristxx", "variable")
				}

			}

			insert_trigger_new = strings.ReplaceAll(insert_trigger_new, "?", newstr)
			update_trigger_new = strings.ReplaceAll(update_trigger_new, "<<>>", oldstr)
			update_trigger_new = strings.ReplaceAll(update_trigger_new, "?", newstr)
			delete_trigger_new = strings.ReplaceAll(delete_trigger_new, "<<>>", oldstr)
			newCrecreatesql := strings.ReplaceAll(createsql, "ddd", key)
			newCrecreatesql = strings.ReplaceAll(newCrecreatesql, "?", tableName)
			// fmt.Println(newCrecreatesql)
			// fmt.Println(insert_trigger_new)
			// fmt.Println(update_trigger_new)
			// fmt.Println(delete_trigger_new)
			content := newCrecreatesql + "\n" + insert_trigger_new + "\n" + update_trigger_new + "\n" + delete_trigger_new + "\n"

			_, err = file.Write([]byte(content))
			if err != nil {
				fmt.Println("写入文件出错:", err)
				return
			}

		}
		fmt.Println("SQL文件写入成功！")
	}
}
