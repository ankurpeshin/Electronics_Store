/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author ankur
 */
@Embeddable
public class OrderedProductPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "customer_order_order_id")
    private int customerOrderOrderId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "product_catalog_product_id")
    private int productCatalogProductId;

    public OrderedProductPK() {
    }

    public OrderedProductPK(int customerOrderOrderId, int productCatalogProductId) {
        this.customerOrderOrderId = customerOrderOrderId;
        this.productCatalogProductId = productCatalogProductId;
    }

    public int getCustomerOrderOrderId() {
        return customerOrderOrderId;
    }

    public void setCustomerOrderOrderId(int customerOrderOrderId) {
        this.customerOrderOrderId = customerOrderOrderId;
    }

    public int getProductCatalogProductId() {
        return productCatalogProductId;
    }

    public void setProductCatalogProductId(int productCatalogProductId) {
        this.productCatalogProductId = productCatalogProductId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) customerOrderOrderId;
        hash += (int) productCatalogProductId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderedProductPK)) {
            return false;
        }
        OrderedProductPK other = (OrderedProductPK) object;
        if (this.customerOrderOrderId != other.customerOrderOrderId) {
            return false;
        }
        if (this.productCatalogProductId != other.productCatalogProductId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderedProductPK[ customerOrderOrderId=" + customerOrderOrderId + ", productCatalogProductId=" + productCatalogProductId + " ]";
    }
    
}
