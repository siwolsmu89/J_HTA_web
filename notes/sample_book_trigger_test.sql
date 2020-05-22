CREATE OR REPLACE TRIGGER sample_book_auto_stock 
AFTER 
INSERT ON sample_book_orders
FOR EACH ROW
BEGIN 
    UPDATE sample_books
    SET
        book_stock = book_stock - :NEW.order_amount
    WHERE book_no = :NEW.book_no;
END;