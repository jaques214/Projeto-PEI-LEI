(:db:add("BuyTeckDB", "C:/Users/Jaques/Downloads/LEI/Ano2/1_Semestre/PEI/Trabalhos/PEI_AC_8190214_8170180_8170110/BuyTeckDB/BuyTeck.xml"):)
declare namespace m = "http://www.buyteck.pt/Main";
declare namespace s = "http://www.buyteck.pt/SellerTypes";
declare namespace p = "http://www.buyteck.pt/ProductTypes";
declare namespace n = "http://www.buyteck.pt/NegotiationTypes";
declare namespace c = "http://www.buyteck.pt/CommonTypes";

(:declare function local:count-sellers($name) as element()*
{
for $a in doc("BuyTeck.xml")//m:seller_list/s:seller
return <number_sellers>{count($a)}</number_sellers>
};:)

declare function local:validate-schema($schema) as element()*
{
  for $doc in db:open('BuyTeckDB')
  return validate:xsd($doc, $schema)
};

let $m := local:validate-schema('Main.xsd')
return $m

(:let $s := local:validate-schema('SellerTypes.xsd')
return $s

let $p := local:validate-schema('ProductTypes.xsd')
return $p

let $n := local:validate-schema('NegotiationTypes.xsd')
return $n

let $c := local:validate-schema('CommonTypes.xsd')
return $c:)