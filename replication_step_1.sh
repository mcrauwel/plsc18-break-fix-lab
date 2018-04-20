# Let's add databases and tables to the master
/home/demo-user/sandboxes/normal-repl/master/use -u root <<EOF
drop database if exists pl18;
create database pl18;
use pl18;
drop table if exists test_table;
create table test_table(ident bigint primary key auto_increment,
                  text varchar(256),
                  timestamp timestamp default current_timestamp);
EOF
# Lets give time to replicate
sleep 3;
# User creation and other stuff is already replicated. We can purge the master binlogs
/home/demo-user/sandboxes/normal-repl/master/use -u root <<EOF
purge binary logs before '2019-01-01';
EOF
# Let's move replication data to tables
# And point replication to the usual mysql port
/home/demo-user/sandboxes/normal-repl/node1/use -u root <<EOF
stop slave;
set global master_info_repository='TABLE';
set global relay_log_info_repository='TABLE';
change master to master_port=3306;
start slave;
EOF
# Create an innocent database user
/home/demo-user/sandboxes/normal-repl/master/use -u root <<EOF
create user ''@'127.0.0.1' identified by '';
set global server_id=0;
EOF
# Let's add some data to the master
/home/demo-user/sandboxes/normal-repl/master/use -u root <<EOF
use pl18;
drop procedure if exists insert_data;
delimiter $$
create procedure insert_data()
begin
declare counter int;
-- set counter = 0;
-- while counter < 10
-- do
-- insert into test_table values (null,conv(floor(rand()*99999999999999),21+sleep(1),36),null);
set counter = sleep(floor(rand()*10));
insert into test_table values (null,conv(floor(rand()*99999999999999),21,36),null);
-- set counter = counter + 1;
-- end while;
end $$
delimiter ;
set global event_scheduler=ON;
drop event if exists fill_table;
create event fill_table on schedule every 1 minute do call insert_data;
EOF
# Let's add some data to the slave
/home/demo-user/sandboxes/normal-repl/node1/use -u root <<EOF
use pl18;
insert into test_table values (5,'Good data, do not remove',null);
EOF
