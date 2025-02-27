package KTEL;

public class Cards {
    private String cardNumber;
    private String expiryDate;
    private int cvv;
    private String holderName;
    private double amount;

    public Cards(String cardNumber, String expiryDate, int cvv, String holderName, double amount) {
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.cvv = cvv;
        this.holderName = holderName;
        this.amount = amount;
    }

    public String getcardNumber() {
        return cardNumber;
    }

    public void setcardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getexpiryDate() {
        return expiryDate;
    }

    public void setexpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getcvv() {
        return cvv;
    }

    public void setcvv(int cvv) {
        this.cvv = cvv;
    }

    public String getholderName() {
        return holderName;
    }

    public void setholderName(String holderName) {
        this.holderName = holderName;
    }

    public double getamount() {
        return amount;
    }

    public void setamount(double amount) {
        this.amount = amount;
    }

}