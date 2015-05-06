(:~
 : build utils 
 : @author Andy Bunce
 : @copyright Quodatum Ltd
 : @licence Apache 2
 : @since may-2015
 :)
module namespace build = 'quodatum.utils.build';
declare default function namespace 'quodatum.utils.build'; 

(:~
 : file paths below $src
 : $src typically from resolve-uri
 :)
 declare function files($src as xs:string) as xs:string*
 {
   fn:filter(file:list($src,fn:true()),
          function ($f){file:is-file($src || $f)}
        )
          !fn:translate(.,"\","/") 
 };

(:~
 : read data with uri from items in $paths using $fetch
 : then save using $write
 :) 
declare function transform($paths  as xs:string*,
                           $fetch,
                           $write )
{
 for $path in $paths
 let $data:=$fetch($path)
 return $write($path,$data)
};

(:~
 : read data with uri from items in $paths using $fetch
 : then apply  $merge to paths and data matching sequences
 :) 
declare function merge($paths  as xs:string*,
                      $fetch  ,
                      $merge)
{
 let $data:= $paths!$fetch(.)
 return $merge($paths,$data)
};
