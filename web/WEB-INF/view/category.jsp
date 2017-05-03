<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : category
    Created on : Apr 1, 2017, 9:53:13 PM
    Author     : ankur
--%>

<br/>
<div id="categoryLeftColumn">

                    <c:forEach var="category" items="${categoryElex}">

                        <c:choose>
            <c:when test="${category.categoryName == selectedCategory.categoryName}">
                                <div class="categoryButton" id="selectedCategory">
                                    <span class="categoryText">
                                        ${category.categoryName}
                                    </span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <a href="category?${category.categoryId}" class="categoryButton">
                    <span class="categoryText">
                                        ${category.categoryName}
                    </span>
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </div>

<div id="categoryRightColumn">

    <p id="categoryTitle">${selectedCategory.categoryName}</p>

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
                                &dollar; ${product.productPrice} / unit
                            </td>
                            <td>
                                <form action="addToCart" method="post">
                                    <input type="hidden"
                                           name="productId"
                                           value="${product.productId}">
                                    <input type="submit" style="font-family: cursive;box-shadow: #000"
                                           value="add to cart">
                                </form>
                            </td>
                        </tr>

                    </c:forEach>
                </table>
            </div>
