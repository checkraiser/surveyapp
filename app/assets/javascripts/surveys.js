$(function() {

    for (var i = 0; i < 5; i++){
            var x = function(i){
                var selector = 'select#select2-' + i;    
             $(selector).select2({ width: 'resolve' }).on("select2-selecting", function(e) {
               $('textarea#survey_questions_attributes_'+i+'_content').append(e.object.text);          
            });      
            
            
            $('a#' + i).click(function(e){        
                  e.preventDefault();        
                $(selector).select2("open");          
            }); 
        }(i);
           
    }
    
            
       
   
    
});