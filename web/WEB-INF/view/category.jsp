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
<%--<sql:query var="categories" dataSource="jdbc/myDatasource">
    select * from product_category
</sql:query>
<sql:query var="selectedCategory" dataSource="jdbc/myDatasource">
    SELECT categoryName FROM product_category WHERE categoryId = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>    
<sql:query var="categoryProducts" dataSource="jdbc/myDatasource">
    SELECT * FROM product_catalog WHERE product_category_categoryId = ?
    <sql:param value="${pageContext.request.queryString}"/>
</sql:query>--%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/elexStore.css">
        <title>Product Category</title>
    </head>
    <body>
        <div id="main">
            <!--            <div id="header">
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
                        </div>-->

            <div id="categoryLeftColumn">
                <div class="categoryButton" id="selectedCategory">
                    <c:forEach var="category" items="${categoryElex}">

                        <c:choose>
                            <c:when test="${category.categoryId == pageContext.request.queryString}">
                                <div class="categoryButton" id="selectedCategory">
                                    <span class="categoryText">
                                        ${category.categoryName}
                                    </span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <a href="category?${category.categoryId}" class="categoryButton">
                                    <div class="categoryText">
                                        ${category.categoryName}
                                    </div>
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </div>
            </div>

            <div id="categoryRightColumn">
                <p id="categoryTitle">
                    <span style="background-color: #f5eabe; padding: 7px;">${selectedCategory.categoryName}</span>
                </p>

                <table id="productTable">
                    <c:forEach var="product" items="${categoryProducts}" varStatus="iter">

                        <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                            <td>
                                <img src="${initParam.categoryImagePath}products/${product.productId}.png"
                                     alt="${product.productName}"
                                     style="height: 100px; width: 100px">
                            </td>
                            <td>
                                ${product.productName}
                                <br>
                                <span class="smallText">${product.productDesc}</span>
                            </td>
                            <td>
                                &euro; ${product.productPrice} / unit
                            </td>
                            <td>
                                <form action="addToCart" method="post">
                                    <input type="hidden"
                                           name="productId"
                                           value="${product.productId}">
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