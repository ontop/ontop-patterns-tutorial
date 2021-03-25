[QueryItem="bgee-q1"]
PREFIX orth: <http://purl.org/net/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dcterms: <http://purl.org/dc/terms/>

SELECT ?gene_name ?gene_description ?gene_page {
   VALUES ?gene_name {"boss"}
   ?gene a orth:Gene ; 
      rdfs:seeAlso ?gene_page ;
      dcterms:description ?gene_description ;  
      rdfs:label ?gene_name .
}
[QueryItem="bgee-q2"]
PREFIX orth: <http://purl.org/net/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX genex: <http://purl.org/genex#>

SELECT DISTINCT ?organ  {
   VALUES ?gene_name {"boss"}
   #infer semantically related terms  that are synonymous via owl:equivalentClass property
   ## ?gene a orth:Gene . #explicit mapping for orth:Gene 
   ?gene a obo:SO_0000704 ; ## inferred mapping with owl:equivalentClass orth:Gene
      rdfs:label ?gene_name .
   ?gene genex:isExpressedIn ?organ . 
   ?organ a genex:AnatomicalEntity .
}
[QueryItem="bgee-q3"]
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT  ?gene_name  ?gene_page   {
   ?organ obo:RO_0002292 ?gene .
   ?organ rdfs:label "brain".
   ?gene rdfs:seeAlso ?gene_page ;
      rdfs:label ?gene_name .
}