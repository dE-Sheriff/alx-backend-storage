-- Write a SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.
-- Context: Nothing related to MySQL, but perfect for user email validation - distribute the logic to the database itself!

DROP TRIGGER IF EXISTS validate_email;

DELIMITER / /

CREATE TRIGGER validate_email
BEFORE UPDATE ON `users`
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = FALSE;
    ELSE
        SET NEW.valid_email = OLD.valid_email;
    END IF;
END //

DELIMITER;
