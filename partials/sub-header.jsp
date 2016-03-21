<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<nav class="navbar navbar-default" id="kapp-sub-nav">
    <div class="container">
        <ul class="nav navbar-header unstyled visible-xs"  role="navigation">
          <li role="presentation" style="display:inline-block">
            <a href="/kinetic/${space.slug}/${kapp.slug}/"><i class="fa fa-home fa-lg visible-xs" style="display: inline-block !important"></i> ${text.escape(kapp.name)}</a>
          </li>
          <li  role="presentation" class="collapsed" data-toggle="collapse" data-target="#sub-header" aria-expanded="false" style="display:inline-block">
            <a href="#"><span class="sr-only">Toggle navigation</span>
            More...</a>
          </li>
        </ul>
        <div class="collapse navbar-collapse" id="sub-header">
            <ul  class="nav navbar-nav navbar-left" role="navigation">
                <li class="<c:if test="${empty param.page}">active</c:if> hidden-xs">
                    <a href="/kinetic/${space.slug}/${kapp.slug}/"><i class="fa fa-home fa-lg visible-xs"></i> <span class="hidden-xs">${text.escape(kapp.name)}</span></a>
                </li>
                <li role="presentation" <c:if test="${param.page == 'requests' || param.type == 'requests'}">class="active"</c:if>>
                    <a href="/kinetic/${space.slug}/${kapp.slug}?page=requests">My Requests</a>
                </li>
                <li role="presentation" <c:if test="${param.page == 'approvals' || param.type == 'approvals'}">class="active"</c:if>>
                    <a href="/kinetic/${space.slug}/${kapp.slug}?page=approvals">My Approvals</a>
                </li>
                <li role="presentation" <c:if test="${param.page == 'approvals'}">class="active"</c:if>>
                    <a href="/kinetic/${space.slug}/${kapp.slug}?page=approvals">My Approvals 2</a>
                </li>
                <li role="presentation" <c:if test="${param.page == 'approvals'}">class="active"</c:if>>
                    <a href="/kinetic/${space.slug}/${kapp.slug}?page=approvals">My Approvals 3</a>
                </li>
                <li role="presentation" <c:if test="${param.page == 'approvals'}">class="active"</c:if>>
                    <a href="/kinetic/${space.slug}/${kapp.slug}?page=approvals">My Approvals 4</a>
                </li>
            </ul>
        </div>
    </div>
</nav>