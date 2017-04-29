<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : category
    Created on : Apr 1, 2017, 9:53:13 PM
    Author     : ankur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<sql:query var="categories" dataSource="jdbc/myDatasource">
    select * from product_category
</sql:query>
<sql:query var="selectedCategory" dataSource="jdbc/myDatasource">
    SELECT category_name FROM product_category WHERE category_id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>    
<sql:query var="categoryProducts" dataSource="jdbc/myDatasource">
    SELECT * FROM product_catalog WHERE product_category_category_id = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>
    
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/elexStore.css">
        <title>Product Category</title>
    </head>
    <body>
        <div id="main">
            <div id="header">
                <div id="widgetBar">

                    <div class="headerWidget">
                        [ language toggle ]
                    </div>

                    <div class="headerWidget">
                        [ checkout button ]
                    </div>

                    <div class="headerWidget">
                        [ shopping cart widget ]
                    </div>

                </div>

                <a href="#">
                    <img src="#" id="logo" alt="Affable Bean logo">
                </a>

                <img src="#" id="logoText" alt="the affable bean">
            </div>

            <div id="categoryLeftColumn">
                <div class="categoryButton" id="selectedCategory">
                    <c:forEach var="category" items="${categories.rows}">

                        <c:choose>
                            <c:when test="${category.category_id == pageContext.request.queryString}">
                                <div class="categoryButton" id="selectedCategory">
                                    <span class="categoryText">
                                        ${category.category_name}
                                    </span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <a href="category?${category.category_id}" class="categoryButton">
                                    <div class="categoryText">
                                        ${category.category_name}
                                    </div>
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </div>
            </div>

            <div id="categoryRightColumn">
                <p id="categoryTitle">${selectedCategory.rows[0].category_name}</p>

                <table id="productTable">
                      <c:forEach var="product" items="${categoryProducts.rows}" varStatus="iter">

                  <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                    <td>
                        <img src="${initParam.categoryImagePath}products/${product.product_id}.png"
                          alt="${product.product_name}"
                          style="height: 100px; width: 100px">
                     </td>
            <td>
                ${product.product_name}
                <br>
                <span class="smallText">${product.product_desc}</span>
            </td>
            <td>
                &euro; ${product.product_price} / unit
            </td>
            <td>
                <form action="addToCart" method="post">
                    <input type="hidden"
                           name="productId"
                           value="${product.product_id}">
                    <input type="submit"
                           value="add to cart">
                </form>
            </td>
        </tr>

    </c:forEach>
                </table>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText">[ footer text ]</p>
            </div>
        </div>
    </body>
</html>