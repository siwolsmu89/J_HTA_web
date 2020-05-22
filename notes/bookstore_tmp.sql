-- 최근 입고된 도서
-- 책번호순으로 내림차순 정렬했을 때 5번째 책까지 조회하기
SELECT book_no, book_title, book_writer, book_price, book_registered_date
FROM (SELECT ROWNUM, book_no, book_title, book_writer, book_price, book_registered_date
      FROM sample_books
      ORDER BY book_no DESC)
WHERE ROWNUM <= 5;

-- 최근 가입한 사용자
-- 가입일순으로 내림차순 정렬했을 때 5번째 사용자까지 조회하기
SELECT user_id, user_name, user_email, user_registered_date
FROM (SELECT ROWNUM, user_id, user_name, user_email, user_registered_date
      FROM sample_book_users
      ORDER BY user_registered_date DESC)
WHERE ROWNUM <= 5;

SELECT book_no, book_title, book_writer, 
						  book_genre, book_publisher, book_price, book_discount_price, 
						  book_registered_date, book_stock, book_point, book_likes, 
						  (SELECT COUNT(*) FROM sample_book_reviews WHERE book_no = B.book_no) as review_count 
				   FROM sample_books B 
				   WHERE book_no=10011;
                   
SELECT review_no, review_point, review_content, review_registered_date,
        (SELECT user_name FROM sample_book_users WHERE user_id = R.user_id) as user_name
FROM sample_book_reviews R
WHERE book_no = 10011;

INSERT INTO sample_book_reviews 
    (review_no, review_point, review_content, review_registered_date, book_no, user_id)
VALUES 
    (sample_review_seq.NEXTVAL, 5, '엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기엄청 길게 리뷰 써보기', SYSDATE, 10061, 'JasikZasik');
    
    commit;
    
    SELECT review_no, review_point, review_content, review_registered_date, 
       			 		 (SELECT user_name FROM sample_book_users WHERE user_id = R.user_id) as user_name 
				  FROM sample_book_reviews R 
				  WHERE book_no =10061;