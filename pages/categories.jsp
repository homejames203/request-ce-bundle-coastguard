<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>${kapp.getAttributeValue('Company Name')}</title>
    </bundle:variable>
     <section class="content-header">
        <h1>
           All Categories
        </h1>
        <ol class="breadcrumb">
            <li><a href="${bundle.kappLocation}">
                <i class="fa fa-home"></i> 
                Home</a>
            </li>
        </ol>
    </section>


    <section class="content">
        <div class="row">
            <c:forEach var="category" items="${CategoryHelper.getCategories(kapp)}">
                <div class="col-sm-12">
                    <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${category.slug}">
                        <div class="info-box">
                            <span class="info-box-icon bg-aqua">
                                <c:if test="${form.getAttributeValue('Icon')}">
                                    <i class="fa ${form.getAttributeValue('Icon')}"/></i>
                                </c:if>
                            </span>

                            <div class="info-box-content">
                                <span class="info-box-text">${category.name}</span>
                                <span class="info-box-number">${fn:length(category.forms)}</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                    </a>
                    <c:set var="currentCat" value="${category}" scope="request"/>
                    <jsp:include page="../partials/subCategory.jsp"/>
                </div>
                
            </c:forEach>
        </div>
    </section>
</bundle:layout>