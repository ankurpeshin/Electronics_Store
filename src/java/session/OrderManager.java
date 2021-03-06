/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import cart.ShoppingCart;
import cart.ShoppingCartItem;
import entity.Customer;
import entity.CustomerOrder;
import entity.OrderedProduct;
import entity.OrderedProductPK;
import entity.ProductCatalog;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ankur
 */
@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class OrderManager {
    
    @PersistenceContext(unitName = "ElectronicStorePU")
    private EntityManager em;
    @Resource
    private SessionContext context;
    @EJB
    private ProductCatalogFacade productFacade;
    @EJB
    private CustomerOrderFacade customerOrderFacade;
    @EJB
    private OrderedProductFacade orderedProductFacade;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public int placeOrder(String name, String email, String phone, 
            String address, String cityRegion, String ccNumber, ShoppingCart cart) {
        try{
        Customer customer = addCustomer(name, email, phone, address, cityRegion, ccNumber);
        CustomerOrder order = addOrder(customer, cart);
        addOrderedItems(order, cart);
        return order.getOrderId();
        }
        catch(Exception ex){
          context.setRollbackOnly();
        return 0;  
        }
        
        
    }
    
    private Customer addCustomer(String name, String email, String phone, String address, String cityRegion, String ccNumber) {
    
    Customer customer = new Customer();
    customer.setCustomerName(name);
    customer.setCustomerEmail(email);
    customer.setCustomerPhone(phone);
    customer.setCustomerAddress(address);
    customer.setCustomerRegion(cityRegion);
    customer.setCustomerCcnumber(ccNumber);
    
     em.persist(customer);

    return customer;
    }

    private CustomerOrder addOrder(Customer customer, ShoppingCart cart) {
         // set up customer order
    CustomerOrder order = new CustomerOrder();
    order.setCustomerCustomerId(customer);
    order.setOrderAmount(BigDecimal.valueOf(cart.getTotal()));

    // create confirmation number
    Random random = new Random();
    int i = random.nextInt(999999999);
    order.setOrderConfirmation(i);
    em.persist(order);
    return order;
    }

    private void addOrderedItems(CustomerOrder order, ShoppingCart cart) {
        em.flush();
        List<ShoppingCartItem> items = cart.getItems();

    // iterate through shopping cart and create OrderedProducts
        for (ShoppingCartItem scItem : items) {

        int productId = scItem.getProduct().getProductId();

        // set up primary key object
        OrderedProductPK orderedProductPK = new OrderedProductPK();
        orderedProductPK.setCustomerOrderOrderId(order.getOrderId());
        orderedProductPK.setProductCatalogProductId(productId);

        // create ordered item using PK object
        OrderedProduct orderedItem = new OrderedProduct(orderedProductPK);

        // set quantity
        orderedItem.setQuantity(scItem.getQuantity());
        
        em.persist(orderedItem);
    }
    }
    
    public Map getOrderDetails(int orderId) {

        Map orderMap = new HashMap();

        // get order
        CustomerOrder order = customerOrderFacade.find(orderId);

        // get customer
        Customer customer = order.getCustomerCustomerId();

        // get all ordered products
        List<OrderedProduct> orderedProducts = orderedProductFacade.findByOrderId(orderId);

        // get product details for ordered items
        List<ProductCatalog> products = new ArrayList<ProductCatalog>();

        for (OrderedProduct op : orderedProducts) {

            ProductCatalog p = (ProductCatalog) productFacade.find(op.getOrderedProductPK().getProductCatalogProductId());
            products.add(p);
        }

        // add each item to orderMap
        orderMap.put("orderRecord", order);
        orderMap.put("customer", customer);
        orderMap.put("orderedProducts", orderedProducts);
        orderMap.put("products", products);

        return orderMap;
    }
}