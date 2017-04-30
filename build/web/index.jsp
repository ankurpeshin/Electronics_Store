<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Apr 1, 2017, 11:58:20 AM
    Author     : ankur
--%>
<%--<sql:query var="category" dataSource="jdbc/myDatasource">
    select * from product_category
</sql:query>--%>
    

    
<div id="indexLeftColumn">
                <div id="welcomeText">
                    <p>[ welcome text ]</p>
                    
                    categoryImagePath: ${initParam.categoryImagePath}
                    productImagePath: ${initParam.productImagePath}
                </div>
            </div>

<div id="indexRightColumn">
                <c:forEach var="currCategory" items="${categoryElex}">
                     <div class="categoryBox">
                        <a href="category?${currCategory.categoryId}">
                            <img src="${initParam.categoryImagePath}${currCategory.categoryId}.png"
                                 alt="${currCategory.categoryName}"
                                 style="height: 180px; width: 180px">
                        </a>
                    </div>
                </c:forEach>
               
            </div>
