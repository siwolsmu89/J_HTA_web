CREATE TABLE sample_todo_users (
    user_id VARCHAR2(20) PRIMARY KEY,
    user_name VARCHAR2(100) NOT NULL,
    user_password VARCHAR2(20) NOT NULL,
    user_email VARCHAR2(256) NOT NULL,
    user_created_date DATE DEFAULT SYSDATE
);

CREATE TABLE sample_todos (
    todo_no NUMBER(6) PRIMARY KEY,
    todo_title VARCHAR2(200) NOT NULL,
    todo_content VARCHAR2(2000) NOT NULL,
    todo_day DATE NOT NULL,
    todo_completed_day DATE,
    todo_status VARCHAR2(100) DEFAULT '처리예정',
    user_id VARCHAR2(20) REFERENCES sample_todo_users (user_id),
    todo_created_date DATE DEFAULT SYSDATE
);

CREATE SEQUENCE sample_todo_seq;