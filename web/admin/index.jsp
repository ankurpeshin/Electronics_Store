<%--
 * Copyright (c) 2010, Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software
 * except in compliance with the terms of the license at:
 * http://developer.sun.com/berkeley_license.html

 * author: tgiunipero
--%>


<div id="adminMenu" class="alignLeft">
    <p><a href="<c:url value='viewCustomers'/>">view all customers</a></p>

    <p><a href="<c:url value='viewOrders'/>">view all orders</a></p>

    <p><a href="<c:url value='logout'/>">log out</a></p>
</div>

<%-- customerList is requested --%>
<c:if test="${!empty customerList}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="4">customers</th>
        </tr>

        <tr class="tableHeading">
            <td>customer id</td>
            <td>name</td>
            <td>email</td>
            <td>phone</td>
        </tr>

        <c:forEach var="customer" items="${customerList}" varStatus="iter">

            <tr class="${((iter.index % 2) == 1) ? 'lightBlue' : 'white'} tableRow"
                onclick="document.location.href='customerRecord?${customer.customerId}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="customerRecord?${customer.customerId}" class="noDecoration">${customer.customerId}</a></td>
                <td><a href="customerRecord?${customer.customerId}" class="noDecoration">${customer.customerName}</a></td>
                <td><a href="customerRecord?${customer.customerId}" class="noDecoration">${customer.customerEmail}</a></td>
                <td><a href="customerRecord?${customer.customerId}" class="noDecoration">${customer.customerPhone}</a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<%-- orderList is requested --%>
<c:if test="${!empty orderList}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="4">orders</th>
        </tr>

        <tr class="tableHeading">
            <td>order id</td>
            <td>confirmation number</td>
            <td>amount</td>
            <td>date created</td>
        </tr>

        <c:forEach var="order" items="${orderList}" varStatus="iter">

            <tr class="${((iter.index % 2) == 1) ? 'lightBlue' : 'white'} tableRow"
                onclick="document.location.href='orderRecord?${order.orderId}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="orderRecord?${order.orderId}" class="noDecoration">${order.orderId}</a></td>
                <td><a href="orderRecord?${order.orderId}" class="noDecoration">${order.orderConfirmation}</a></td>
                <td><a href="orderRecord?${order.orderId}" class="noDecoration">
                        <fmt:formatNumber type="currency"
                                          currencySymbol="&dollar; "
                                          value="${order.orderAmount}"/></a></td>

                <td><a href="orderRecord?${order.orderId}" class="noDecoration">
                        <fmt:formatDate value="${order.orderDate}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<%-- customerRecord is requested --%>
<c:if test="${!empty customerRecord}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="2">customer details</th>
        </tr>
        <tr>
            <td style="width: 290px"><strong>customer id:</strong></td>
            <td>${customerRecord.customerId}</td>
        </tr>
        <tr>
            <td><strong>name:</strong></td>
            <td>${customerRecord.customerName}</td>
        </tr>
        <tr>
            <td><strong>email:</strong></td>
            <td>${customerRecord.customerEmail}</td>
        </tr>
        <tr>
            <td><strong>phone:</strong></td>
            <td>${customerRecord.customerPhone}</td>
        </tr>
        <tr>
            <td><strong>address:</strong></td>
            <td>${customerRecord.customerAddress}</td>
        </tr>
        <tr>
            <td><strong>city region:</strong></td>
            <td>${customerRecord.customerRegion}</td>
        </tr>
        <tr>
            <td><strong>credit card number:</strong></td>
            <td>${customerRecord.customerCcnumber}</td>
        </tr>

        <tr><td colspan="2" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='orderRecord?${order.orderId}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="orderRecord?${order.orderId}" class="noDecoration">
                <strong>view order summary &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>

<%-- orderRecord is requested --%>
<c:if test="${!empty orderRecord}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="2">order summary</th>
        </tr>
        <tr>
            <td><strong>order id:</strong></td>
            <td>${orderRecord.orderId}</td>
        </tr>
        <tr>
            <td><strong>confirmation number:</strong></td>
            <td>${orderRecord.orderConfirmation}</td>
        </tr>
        <tr>
            <td><strong>date processed:</strong></td>
            <td>
                <fmt:formatDate value="${orderRecord.orderDate}"
                                type="both"
                                dateStyle="short"
                                timeStyle="short"/></td>
        </tr>

        <tr>
            <td colspan="2">
                <table class="embedded detailsTable">
                   <tr class="tableHeading">
                        <td class="rigidWidth">product</td>
                        <td class="rigidWidth">quantity</td>
                        <td>price</td>
                    </tr>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                        <tr>
                            <td>
                                <fmt:message key="${products[iter.index].productName}"/>
                            </td>
                            <td>
                                ${orderedProduct.quantity}
                            </td>
                            <td class="confirmationPriceColumn">
                                <fmt:formatNumber type="currency" currencySymbol="&dollar; "
                                                  value="${products[iter.index].productPrice * orderedProduct.quantity}"/>
                            </td>
                        </tr>

                    </c:forEach>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <tr>
                        <td colspan="2" id="deliverySurchargeCellLeft"><strong>delivery surcharge:</strong></td>
                        <td id="deliverySurchargeCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&dollar; "
                                              value="${initParam.deliverySurcharge}"/></td>
                    </tr>

                    <tr>
                        <td colspan="2" id="totalCellLeft"><strong>total amount:</strong></td>
                        <td id="totalCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&dollar; "
                                              value="${orderRecord.orderAmount}"/></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='customerRecord?${customer.customerId}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="customerRecord?${customer.customerId}" class="noDecoration">
                    <strong>view customer details &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>