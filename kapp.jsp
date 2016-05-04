<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<c:choose>
    <c:when test="${identity.anonymous}">
        <c:set var="kapp" scope="request" value="${kapp}"/>
        <c:redirect url="/${space.slug}/app/login?kapp=${kapp.slug}"/>
    </c:when>
    <c:otherwise>
        <bundle:layout page="${bundle.path}/layouts/layout.jsp">
            <bundle:variable name="head">
                <title>Kinetic Data ${text.escape(kapp.name)}</title>
            </bundle:variable>

            <!-- Set variable used to count and display submissions -->
            <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 999)}"/>
            
            <c:choose>
                <c:when test="${not empty space.getKapp('admin') && not empty space.getKapp('admin').getForm('assets') && not empty space.getKapp('admin').getForm('knowledge')}">
                    <c:set scope="request" var="tileClass" value="col-lg-3 col-xs-6"/>
                </c:when>
                <c:when test="${not empty space.getKapp('admin') && (not empty space.getKapp('admin').getForm('assets') && empty space.getKapp('admin').getForm('knowledge')) || (empty space.getKapp('admin').getForm('assets') &&not empty space.getKapp('admin').getForm('knowledge'))}">
                    <c:set scope="request" var="tileClass" value="col-lg-4 col-xs-4"/>
                </c:when>
                <c:otherwise>
                    <c:set scope="request" var="tileClass" value="col-xs-6"/>
                </c:otherwise>
            </c:choose>

            <section class="content-header">
                <h1>
                    Enterprise Request Management System
                    <small>Version ${kapp.getAttributeValue('KAPP Version')}</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#">
                        <i class="fa fa-home"></i> 
                        Home</a>
                    </li>
                </ol>
            </section>

            <section class="content">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="${tileClass}">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>${fn:length(submissionsList)}</h3>
                                <p>My Requests</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-shopping-cart"></i>
                            </div>
                            <a href="${bundle.kappLocation}?page=submissions&type=request" class="small-box-footer">View Your Requests <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div><!-- ./col -->

                    <div class="${tileClass}">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>${fn:length(SubmissionHelper.retrieveRecentSubmissions('Approval', 999))}</h3>
                                <p>My Approvals</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-thumbs-o-up"></i>
                            </div>
                            <a href="${bundle.kappLocation}?page=submissions&type=approval" class="small-box-footer">View Your Approvals <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div><!-- ./col -->

                    <c:if test="${not empty space.getKapp('admin').getForm('assets')}">
                        <c:set scope="request" var="assetList" value="${SubmissionHelper.myAssetSubmissions()}"/>
                        <div class="${tileClass}">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>${fn:length(assetList)}</h3>
                                    <p>My Assets</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-mobile"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div><!-- ./col -->
                    </c:if>
                    <c:if test="${not empty space.getKapp('admin').getForm('knowldege')}">
                        <div class="${tileClass}">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>728</h3>
                                    <p>Knowledge Base</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-lightbulb-o"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div><!-- ./col -->
                    </c:if>
                </div><!-- /.row -->

                <div class="row">
                    <div class="col-md-8">
                        <c:import url="${bundle.path}/partials/submissions.jsp" charEncoding="UTF-8"/>
                    </div>
                    <div class="col-md-4">
                        <c:import url="${bundle.path}/partials/popularRequests.jsp" charEncoding="UTF-8"/>
                    </div>
                </div>
            </section>
        </bundle:layout>
    </c:otherwise>
</c:choose>