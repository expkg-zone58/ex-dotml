(:~
: The dotML library provides conversion from <code>dotML</code> format to Graphviz dot.
: 'DotML' is a XML based syntax for the input language 'Dot' used by Graphviz.
: This application includes an XSLT transform to convert 'DotML' to 'dot' developed by Martin Loetzsch. 
: The <code>dotml:to-dot()</code> function invokes this transform. 
: @see http://www.martin-loetzsch.de/DOTML/
: @version 0.2.1
:)
module namespace dotml="http://www.martin-loetzsch.de/DOTML";

import module namespace xslt="http://basex.org/modules/xslt";

(:~
 : transform DotML to dot 
 : @param $dotml The dotML node to convert.
 : @return graphviz dot string
:)
declare function dotml:to-dot($dotml as element(dotml:graph)) as xs:string
{
 xslt:transform($dotml, fn:resolve-uri( "dotml2dot.xsl"))
};

