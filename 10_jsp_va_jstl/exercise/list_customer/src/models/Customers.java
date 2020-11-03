package models;

public class Customers {
    private String name;
    private String birthday;
    private String address;
    private String imageAvatar;

    public Customers() {
    }

    public Customers(String name, String birthday, String address, String imageAvatar) {
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.imageAvatar = imageAvatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImageAvatar() {
        return imageAvatar;
    }

    public void setImageAvatar(String imageAvatar) {
        this.imageAvatar = imageAvatar;
    }
}
