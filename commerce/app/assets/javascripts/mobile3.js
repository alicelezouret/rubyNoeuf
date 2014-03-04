function jsonLoad(jsonurl, handler){
 var params = { dataType: 'json', async: false, cache: true, ifModified: true, url: jsonurl, success: handler } ;
 $.ajax(params).error(function(jqxhr,s,m){ alert('Erreur json'); });

}

function json_success_produits(data, textStatus, jqxhr) {
  //alert(data);
  $('#produit div h1').html(data["nom"]);
  $.each(data,function(k,v){
  $.each(data,function(k,v){
   if ( k != "nom" ) { $('#produit_'+k).html(v); }
  });
  $('#listeProduits').listview('refresh');
}
////////////////////////////////////
////////////////////////////////////
$(document).on('pageinit','#accueil',function(event){
 jsonLoad("/produits.json",json_success_produits);
 
}); // pageinit accueil
 $(document).on("click","#listeProduits > li", function(e) {
		 //alert($('span',this).html());
         jsonLoad($('span',this).html(),json_success_produit);
 });
