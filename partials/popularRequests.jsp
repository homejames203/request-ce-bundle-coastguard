<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<!-- PRODUCT LIST -->
<div class="box box-primary">
   <div class="box-header with-border">
      <h3 class="box-title">Popular Services</h3>
      <div class="box-tools pull-right">
         <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
      </div>
   </div><!-- /.box-header -->
   <div class="box-body">
      <ul class="products-list product-list-in-box">
         <c:forEach var="popForm" begin="0" end="4" items="${kapp.getCategory('popular-requests').forms}">
            <li class="item">
               <div class="product-img">
                  <img src="${bundle.location}/images/forms/${popForm.getAttributeValue('Image')}" alt="${text.escape(popForm.name)}">
               </div>
               <div class="product-info">
                  <a href="${bundle.spaceLocation}/${kapp.slug}/${popForm.slug}" class="product-title">${text.escape(popForm.name)} <span class="label label-warning pull-right"></span></a>
                  <span class="product-description">
                     ${text.escape(popForm.description)}
                  </span>
               </div>
            </li><!-- /.item -->
         </c:forEach>
      </ul>
   </div><!-- /.box-body -->
   <div class="box-footer text-center">
      <a href="javascript::;" class="uppercase"></a>
   </div><!-- /.box-footer -->
</div><!-- /.box -->