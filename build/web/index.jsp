<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Apr 1, 2017, 11:58:20 AM
    Author     : ankur
--%>
<sql:query var="category" dataSource="jdbc/myDatasource">
    select * from product_category
</sql:query>
    

    
            <div id="left">
                <div id="welcomeText">
                    <p>[ welcome text ]</p>
                    
                    categoryImagePath: ${initParam.categoryImagePath}
                    productImagePath: ${initParam.productImagePath}
                </div>
            </div>

            <div id="right">
                <c:forEach var="currCategory" items="${category.rows}">
                     <div class="categoryBox">
                        <a href="category?${currCategory.category_id}">
                            <img src="${initParam.categoryImagePath}${currCategory.category_id}.png"
                                 alt="${currCategory.category_name}"
                                 style="height: 180px; width: 180px">
                        </a>
                    </div>
                </c:forEach>
               
            </div>
