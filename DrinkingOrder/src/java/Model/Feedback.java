package Model;

import DAO.FeedbackDAO;
import java.util.Date;
import javax.xml.bind.DatatypeConverter;

public class Feedback {
    private int id;
    private int orderDetailId;
    private int rating;
    private String comment;
    private boolean isDeleted;
    private Date createdAt;
    private int createdBy;
    private byte[] imgeURL;
    private String userName;

    public String getUserName() {
        return new FeedbackDAO().getUserNameFeedback(id);
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    

    public byte[] getImgeURL() {
        return imgeURL;
    }

    public void setImgeURL(byte[] imgeURL) {
        this.imgeURL = imgeURL;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }
    
    public String getImage() {
        if (imgeURL == null) return "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
        
        String imageBase64 = DatatypeConverter.printBase64Binary(imgeURL);
        return "data:image/png;base64," + imageBase64;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", orderDetailId=" + orderDetailId + ", rating=" + rating + ", comment=" + comment + ", isDeleted=" + isDeleted + ", createdAt=" + createdAt + ", createdBy=" + createdBy + ", imgeURL=" + imgeURL + '}';
    }
    
    

}