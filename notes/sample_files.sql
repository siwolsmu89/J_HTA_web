CREATE TABLE sample_files(
    file_no NUMBER(5) PRIMARY KEY,
    file_title VARCHAR2(500) NOT NULL,
    file_name VARCHAR2(300) NOT NULL,
    file_create_date DATE DEFAULT SYSDATE
);

CREATE SEQUENCE sample_file_seq NOCACHE;