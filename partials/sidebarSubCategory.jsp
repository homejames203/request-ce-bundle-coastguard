<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<ul class="treeview-menu">
    <c:forEach items="${sidebarSubCat.getSubcategories()}" var="sidebarSubCategory">
        <li <c:if test="${activePage eq sidebarSubCategory.name}">class="active"</c:if> >
            <a href="${bundle.kappLocation}?page=category&category=${text.escape(sidebarSubCategory.slug)}">
                <i class="fa fa-angle-right"></i><span>${text.escape(sidebarSubCategory.name)}</span>
            </a>
            <c:if test="${sidebarSubCategory.hasNonEmptySubcategories()}">
                <c:set var="sidebarSubCat" value="${sidebarSubCategory}" scope="request"/>
                <jsp:include page="sidebarSubCategory.jsp"/>
            </c:if>
        </li>
    </c:forEach>                                    
</ul>