/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enterprise.web.jdbc;

/**
 *
 * @author mythr
 */
public class items {
    
    int itemid,quantity;
    String items;

    public items(int itemid, int quantity, String items) {
        this.itemid = itemid;
        this.quantity = quantity;
        this.items = items;
    }

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }
    
}
