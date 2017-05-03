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

<div class="container" id="portfolio">

	<div class="row-fluid">
		<h1>Welcome to Electronics Store : Browse our products</h1>
			<div class="span12">
                            
                         <c:forEach var="currCategory" items="${categoryElex}">
                         <div class="span3 project">
                        <a href="category?${currCategory.categoryId}">
                            <img src="${initParam.categoryImagePath}${currCategory.categoryId}.png"
                                 alt="${currCategory.categoryName}"
                                 style="height: 180px; width: 180px">
                        </a>
                        </div>
                        </c:forEach>   
                            
                            
		</div>
	</div>
</div>
    

