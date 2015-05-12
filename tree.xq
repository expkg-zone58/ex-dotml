(:~
 : convert path(s) to tree
 :)
declare function local:build($name as xs:string,$items as element(item)*)
as element(item){
  <item><name>{$name}</name>{if($items)then <children type="array">{$items}</children> else ()}</item> 
};

(:~
 :  convert path form to tree
 :)
declare function local:tree($path as xs:string){
  fn:fold-right(
    filter(tokenize($path,"/"), boolean#1),
    (),
    local:build#2 
   )
};

(:~
 : i
 :)
declare function local:merge($a1 as element(item)?,$a2 as element(item)?){
 if($a1/name=$a2/name) then
      let $n1:=$a1/children/item/name
      let $n2:=$a2/children/item/name
         
      let $t:=(
        for $x in distinct-values($n1[.=$n2]) (:both:)
        return local:merge($a1/children/item[name=$x],$a2/children/item[name=$x]),
        
        for $x in distinct-values($n1[fn:not(.=$n2)]) (:only $a1 :)
        return $a1/children/item[name=$x],
        
        for $x in distinct-values($n2[fn:not(.=$n1)]) (:only $a2 :)
        return $a2/children/item[name=$x]
      )
      return local:build($a1/name,for $x in $t order by $x/name return $x)
 else ($a1,$a2)                        
};

let $a:=("/",
"/api/environment/",
"/api/execute/",
"/api/library/",
"/api/library/",
"/api/library/{$id}/",
"/api/library/{$id}/",
"/api/state/",
"/api/~testbed/",
"/api/state/",
"/api/state/",
"/api/suite/",
"/api/suite/{$suite}/",

"/api/execute/zz")

return fn:fold-right($a,
                     (),
                     function($a,$b){local:merge(local:tree($a),$b)}
                    )

