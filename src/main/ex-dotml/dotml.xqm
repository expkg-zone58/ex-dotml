(:~
: dotml module
: @see http://www.martin-loetzsch.de/DOTML/
:)
module namespace ex-dotml="http://expkg-zone58.github.io/ex-dotml";
declare default function namespace 'http://expkg-zone58.github.io/ex-dotml';

declare namespace dotml="http://www.martin-loetzsch.de/DOTML";

import module namespace xslt="http://basex.org/modules/xslt";

(:~ 
: @return graphviz dot string
: note xslt:transform can not return output text so result is wrapped
:)
declare function to-dot($dotml)  as xs:string
{
 let $d:=xslt:transform($dotml, fn:resolve-uri( "dotml2dot.xsl"))
 return $d/fn:string() 
};

