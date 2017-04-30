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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ankur
 */
@Entity
@Table(name = "product_catalog")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductCatalog.findAll", query = "SELECT p FROM ProductCatalog p")
    , @NamedQuery(name = "ProductCatalog.findByProductId", query = "SELECT p FROM ProductCatalog p WHERE p.productId = :productId")
    , @NamedQuery(name = "ProductCatalog.findByProductName", query = "SELECT p FROM ProductCatalog p WHERE p.productName = :productName")
    , @NamedQuery(name = "ProductCatalog.findByProductPrice", query = "SELECT p FROM ProductCatalog p WHERE p.productPrice = :productPrice")
    , @NamedQuery(name = "ProductCatalog.findByProductDesc", query = "SELECT p FROM ProductCatalog p WHERE p.productDesc = :productDesc")
    , @NamedQuery(name = "ProductCatalog.findByLastUpdate", query = "SELECT p FROM ProductCatalog p WHERE p.lastUpdate = :lastUpdate")})
public class ProductCatalog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "product_id")
    private Integer productId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "product_name")
    private String productName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "product_price")
    private BigDecimal productPrice;
    @Size(max = 255)
    @Column(name = "product_desc")
    private String productDesc;
    @Basic(optional = false)
    @NotNull
    @Column(name = "last_update")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastUpdate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productCatalog")
    private Collection<OrderedProduct> orderedProductCollection;
    @JoinColumn(name = "product_category_category_id", referencedColumnName = "category_id")
    @ManyToOne(optional = false)
    private ProductCategory productCategoryCategoryId;

    public ProductCatalog() {
    }

    public ProductCatalog(Integer productId) {
        this.productId = productId;
    }

    public ProductCatalog(Integer productId, String productName, BigDecimal productPrice, Date lastUpdate) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.lastUpdate = lastUpdate;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    @XmlTransient
    public Collection<OrderedProduct> getOrderedProductCollection() {
        return orderedProductCollection;
    }

    public void setOrderedProductCollection(Collection<OrderedProduct> orderedProductCollection) {
        this.orderedProductCollection = orderedProductCollection;
    }

    public ProductCategory getProductCategoryCategoryId() {
        return productCategoryCategoryId;
    }

    public void setProductCategoryCategoryId(ProductCategory productCategoryCategoryId) {
        this.productCategoryCategoryId = productCategoryCategoryId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductCatalog)) {
            return false;
        }
        ProductCatalog other = (ProductCatalog) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductCatalog[ productId=" + productId + " ]";
    }
    
}
