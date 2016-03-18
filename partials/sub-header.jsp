<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<section class="menu sub-nav">
    <ul class="nav nav-pills" role="navigation">
        <li role="presentation" <c:if test="${empty param.page}">class="active"</c:if>>
            <a href="/kinetic/${space.slug}/${kapp.slug}/">${text.escape(kapp.name)}</a>
        </li>
        <li role="presentation" <c:if test="${param.page == 'requests'}">class="active"</c:if>>
            <a href="/kinetic/${space.slug}/${kapp.slug}?page=requests">My Requests</a>
        </li>
        <li role="presentation" <c:if test="${param.page == 'approvals'}">class="active"</c:if>>
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
</section>