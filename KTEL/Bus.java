package KTEL;

public class Bus {
    private int seatNumber;
    private boolean reserved;

    public Bus(int seatNumber, boolean reserved) {
        this.seatNumber = seatNumber;
        this.reserved = reserved;
    }

    public int seatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public boolean reserved() {
        return reserved;
    }

    public void setReserved(boolean reserved) {
        this.reserved = reserved;
    }
}