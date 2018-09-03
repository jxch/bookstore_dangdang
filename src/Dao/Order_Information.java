package Dao;

public class Order_Information {
    public String name;
    public String address;
    public String zipCode;
    public String telephone;
    public String mobilePhone;
    public String toString(){
        return name+","+address+","+zipCode+","+telephone+","+mobilePhone;
    }
}
