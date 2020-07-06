INSERT INTO sample_todos
    (todo_no, todo_title, todo_content, todo_day, user_id)
VALUES 
    (sample_todo_seq.NEXTVAL, '일정' || sample_todo_seq.CURRVAL, '테스트 일정', SYSDATE + sample_todo_seq.CURRVAL, 'kimkim');
    
commit;


SELECT todo_no, todo_title, todo_content, todo_day, todo_completed_day, todo_status, user_id, todo_created_date, 
								 ROW_NUMBER() OVER(ORDER BY todo_day) AS RN 
						  FROM sample_todos 
						  WHERE todo_day > SYSDATE;