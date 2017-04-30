/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.ProductCatalog;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ankur
 */
@Stateless
public class ProductCatalogFacade extends AbstractFacade<ProductCatalog> {

    @PersistenceContext(unitName = "ElectronicStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductCatalogFacade() {
        super(ProductCatalog.class);
    }
    
}
