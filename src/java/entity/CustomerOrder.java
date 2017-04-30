/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author ankur
 */
@Entity
@Table(name = "customer_order")
@NamedQueries({
    @NamedQuery(name = "CustomerOrder.findAll", query = "SELECT c FROM CustomerOrder c")
    , @NamedQuery(name = "CustomerOrder.findByOrderId", query = "SELECT c FROM CustomerOrder c WHERE c.orderId = :orderId")
    , @NamedQuery(name = "CustomerOrder.findByOrderAmount", query = "SELECT c FROM CustomerOrder c WHERE c.orderAmount = :orderAmount")
    , @NamedQuery(name = "CustomerOrder.findByOrderDate", query = "SELECT c FROM CustomerOrder c WHERE c.orderDate = :orderDate")
    , @NamedQuery(name = "CustomerOrder.findByOrderConfirmation", query = "SELECT c FROM CustomerOrder c WHERE c.orderConfirmation = :orderConfirmation")})
public class CustomerOrder implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "order_id")
    private Integer orderId;
    
// @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "order_amount")
    private BigDecimal orderAmount;
    
    @Basic(optional = false)
    @Column(name = "order_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    
    @Basic(optional = false)
    @Column(name = "order_confirmation")
    private int orderConfirmation;
     @OneToMany(cascade = CascadeType.ALL, mappedBy = "customerOrder")
    private Collection<OrderedProduct> orderedProductCollection;
    
    @JoinColumn(name = "customer_customer_id", referencedColumnName = "customer_id")
    @ManyToOne(optional = false)
    private Customer customerCustomerId;
    
   

    public CustomerOrder() {
    }

    public CustomerOrder(Integer orderId) {
        this.orderId = orderId;
    }

    public CustomerOrder(Integer orderId, BigDecimal orderAmount, Date orderDate, int orderConfirmation) {
        this.orderId = orderId;
        this.orderAmount = orderAmount;
        this.orderDate = orderDate;
        this.orderConfirmation = orderConfirmation;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderConfirmation() {
        return orderConfirmation;
    }

    public void setOrderConfirmation(int orderConfirmation) {
        this.orderConfirmation = orderConfirmation;
    }

    public Customer getCustomerCustomerId() {
        return customerCustomerId;
    }

    public void setCustomerCustomerId(Customer customerCustomerId) {
        this.customerCustomerId = customerCustomerId;
    }


    public Collection<OrderedProduct> getOrderedProductCollection() {
        return orderedProductCollection;
    }

    public void setOrderedProductCollection(Collection<OrderedProduct> orderedProductCollection) {
        this.orderedProductCollection = orderedProductCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CustomerOrder)) {
            return false;
        }
        CustomerOrder other = (CustomerOrder) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.CustomerOrder[ orderId=" + orderId + " ]";
    }
    
}
