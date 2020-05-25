create or replace TRIGGER update_review_point_trigger_2
BEFORE
UPDATE ON sample_book_reviews
FOR EACH ROW
DECLARE
    CURSOR review_list (param_book_no sample_books.book_no%TYPE) IS
    SELECT review_point
    FROM sample_book_reviews
    WHERE book_no = param_book_no;

    v_total_point     NUMBER := 0;
    v_row_count       NUMBER := 0;
    v_avg_point       NUMBER;
    
    o_point           NUMBER := :OLD.review_point;
    n_point           NUMBER := :NEW.review_point;

BEGIN
    FOR review IN review_list (:NEW.book_no) LOOP
        v_total_point := v_total_point + review.review_point;
        v_row_count := v_row_count + 1;
    END LOOP;
    
    v_total_point := v_total_point - o_point + n_point;

    v_avg_point := TRUNC((v_total_point) / (v_row_count), 1);

    UPDATE sample_books
        SET
            book_point = v_avg_point
    WHERE book_no = :NEW.book_no;

END;