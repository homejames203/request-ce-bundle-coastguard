// $(function (){
//    // Loop over each Form Section and Add Appropriate Classes
//    $('div.box form section').each(function(){
//       // If the Section ONLY contains form buttons, add the box-footer class 
//       if( $(this).find('button[data-button-type]').length > 0 && $(this).children().length === $(this).find('button[data-button-type]').length ){
//          // Check to make sure it wasn't already added to the section via the builder
//          if( !$(this).hasClass('box-footer') ){
//             $(this).children().not('h1').wrapAll('<div class="box-footer"></div>');
//          }
//       // Wrap all other Sections with Box-Body. If the sections have a visible header, wrap it with box-header
//       } else{
//          $(this).children().not('h1').wrapAll('<div class="box-body"></div>');
//          $(this).children('h1').replaceWith('<div class="box-header with-border"><h3 class="box-title">' + $(this).children('h1').text() + '</h3></div>');
//       }




//    });

//    // Loop over each Form and see if no sections exist. If none do, then wrap with box-body
//    $('div.box form').each(function(){
//       if ( $(this).find('section').length === 0 ){
//          $(this).children().wrapAll('<div class="box-body"></div>');
//       }
//    });

// });


