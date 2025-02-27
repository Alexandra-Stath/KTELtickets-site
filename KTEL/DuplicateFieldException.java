package KTEL;

public class DuplicateFieldException extends Exception {

    public DuplicateFieldException() {
        super("DuplicateField Exception Occurred");
    }

    // Constructor with a custom message
    public DuplicateFieldException(String message) {
        super(message);
    }

}
