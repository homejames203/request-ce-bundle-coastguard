<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:forEach var="subcategory" items="${currentCat.getSubcategories()}">
    <c:choose>
        <c:when test="${subcategory.hasNonEmptySubcategories()}">
            <div class="col-xs-12">
        </c:when>
        <c:otherwise>
            <div class="col-md-3 col-sm-6 col-xs-12">
        </c:otherwise>
    </c:choose>
        <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${category.slug}">
            <div class="info-box">
                <span class="info-box-icon bg-yellow">
                    <c:if test="${form.getAttributeValue('Icon')}">
                        <i class="fa fa-${form.getAttributeValue('Icon')}"/></i>
                    </c:if>
                </span>

                <div class="info-box-content">
                    <span class="info-box-text">${text.escape(subcategory.getName())}</span>
                    <span class="info-box-number">${fn:length(subcategory.forms)}</span>
                </div>
                <!-- /.info-box-content -->
            </div>
        </a>
        <c:set var="currentCat" value="${subcategory}" scope="request"/>
        <jsp:include page="subCategory.jsp"/>
    </div>
</c:forEach>