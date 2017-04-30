<%--
    Document   : confirmation
    Created on : Sep 9, 2009, 12:20:30 AM
    Author     : tgiunipero
--%>


<div id="singleColumn">

    <p id="confirmationText">
        <strong>Your order has been successfully processed within 2-3 business days.</strong>
        <br><br>
        Your order number:
        <strong>${orderRecord.orderConfirmation}</strong>
        <br>
        If you have a query concerning your order, feel free to <a href="#">contact us</a>.
        <br><br>
        Thank you for shopping at Electronics Store!
    </p>

    <div class="summaryColumn" >

        <table id="orderSummaryTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">order summary</th>
            </tr>

            <tr class="tableHeading">
                <td>product</td>
                <td>quantity</td>
                <td>price</td>
            </tr>

            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <td>${products[iter.index].productName}</td>
                    <td class="quantityColumn">
                        ${orderedProduct.quantity}
                    </td>
                    <td class="confirmationPriceColumn">
                        &euro; ${products[iter.index].productPrice * orderedProduct.quantity}
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="2" id="deliverySurchargeCellLeft"><strong>delivery surcharge:</strong></td>
                <td id="deliverySurchargeCellRight">&euro; ${initParam.deliverySurcharge}</td>
            </tr>

            <tr class="lightBlue">
                <td colspan="2" id="totalCellLeft"><strong>total:</strong></td>
                <td id="totalCellRight">&euro; ${orderRecord.orderAmount}</td>
            </tr>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="3" id="dateProcessedRow"><strong>date processed:</strong>
                    ${orderRecord.orderDate}
                </td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">delivery address</th>
            </tr>

            <tr>
                <td colspan="3" class="lightBlue">
                    ${customer.customerName}
                    <br>
                    ${customer.customerAddress}
                    <br>
                    Prague ${customer.customerRegion}
                    <br>
                    <hr>
                    <strong>email:</strong> ${customer.customerEmail}
                    <br>
                    <strong>phone:</strong> ${customer.customerPhone}
                </td>
            </tr>
        </table>

    </div>
</div>