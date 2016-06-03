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
                <div class="col-sm-6">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${category.slug}">
                                <h3 class="box-title">
                                    <c:if test="${form.getAttributeValue('Icon')}">
                                        <i class="fa ${form.getAttributeValue('Icon')}"/></i>
                                    </c:if>
                                    ${category.name}
                                </h3>
                            </a>
                        </div>
                        <div class="box-body clearfix">
                            <c:set var="currentCat" value="${category}" scope="request"/>
                            <jsp:include page="../partials/subCategory.jsp"/>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</bundle:layout>