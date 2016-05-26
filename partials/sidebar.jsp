<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- search form -->
        <c:choose>
            <c:when test="${not empty space.getKapp('search') && (empty kapp || kapp.hasAttribute('Include in Global Search') || text.equals(kapp.slug, 'search'))}">
                <form action="${bundle.spaceLocation}/search" method="GET" class="sidebar-form">
                    <div class="input-group">
                        <c:if test="${not empty kapp}">
                            <input type="hidden" value="${text.equals(kapp.slug, "search") ? param["source"] : kapp.slug}" name="source">
                        </c:if>
                        <input type="text" name="q" placeholder="Global Search" value="${param["q"]}">
                        <span class="input-group-btn">
                            <button type="submit" id="search-btn" class="btn btn-flat states"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty kapp}">
                <form action="${bundle.kappLocation}" method="GET" class="sidebar-form">
                    <div class="input-group">
                        <input type="hidden" value="search" name="page">
                        <input type="text" name="q" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <button type="submit" id="search-btn" class="btn btn-flat states"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>
            </c:when>
        </c:choose>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li <c:if test="${activePage eq 'home'}">class="active"</c:if> >
                <a href="${bundle.kappLocation}">
                    <i class="fa fa-home"></i> <span>Home</span>
                </a>
            </li>
            <li <c:if test="${activePage eq 'request'}">class="active"</c:if> >
                <a href="${bundle.kappLocation}?page=submissions&type=request">
                    <i class="fa fa-shopping-cart"></i> <span>My Requests</span>
                </a>
            </li>
            <li <c:if test="${activePage eq 'approval'}">class="active"</c:if> >
                <a href="${bundle.kappLocation}?page=submissions&type=approval">
                    <i class="fa fa-thumbs-o-up"></i> <span>My Approvals</span>
                </a>
            </li>
            <%-- For each of the categories --%>
            <c:forEach items="${CategoryHelper.getCategories(kapp)}" var="category">
                <c:set var="formsStatusActive" value="${FormHelper.getFormsByStatus(category.category,'Active')}"/>
                <%-- If the category is not hidden, and it contains at least 1 form --%>
                <c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true' && not formsStatusActive}">
                        <%-- Set Classes in LI Based on active page and if there are non-empty subcategories --%>
                        <li class="<c:if test="${fn:contains(activePage,category.name)}">active </c:if><c:if test="${category.hasNonEmptySubcategories()}">treeview</c:if>" >
                            <a href="${bundle.kappLocation}?page=category&category=${text.escape(category.slug)}">
                                <i class="fa ${category.getAttribute('fa-logo').value}"></i> 
                                <span>${text.escape(category.name)}</span>
                                <%-- If Subs exist, angle-left, otherwise show form count --%>
                                <c:choose>
                                    <c:when test="${category.hasNonEmptySubcategories()}">
                                        <i class="fa fa-angle-left pull-right"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="label label-primary pull-right">${fn:length(category.forms)}</span>
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <c:if test="${category.hasNonEmptySubcategories()}">
                                <ul class="treeview-menu">
                                    <c:forEach items="${category.getSubcategories()}" var="subCategory">
                                        <li <c:if test="${activePage eq subCategory.name}">class="active"</c:if> >
                                            <a href="${bundle.kappLocation}?page=category&category=${text.escape(subCategory.slug)}">
                                                <i class="fa fa-circle-o"></i> <span>${text.escape(subCategory.name)}</span>
                                                <span class="label label-primary pull-right">${fn:length(subCategory.getForms())}</span>
                                            </a>
                                        </li>
                                    </c:forEach>                                    
                                </ul>
                            </c:if>
                        </li>
                </c:if>
            </c:forEach>
            <c:if test="${fn:toLowerCase(identity.user.getAttribute('Catalog Manager').value) eq 'true'}">
                <li <c:if test="${activePage eq 'dashboard'}">class="active"</c:if> >
                    <a href="${bundle.kappLocation}?page=dashboard">
                        <i class="fa fa-tachometer"></i> <span>Management Dashboard</span>
                    </a>
                </li>
            </c:if>
            <!--
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
            -->
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>