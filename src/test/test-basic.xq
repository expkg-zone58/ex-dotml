(:~
 : ex-dotml tests
 :)
module namespace test = 'http://basex.org/modules/xqunit-tests';
import module namespace ex-dotml="http://www.martin-loetzsch.de/DOTML";

declare variable $test:simple:=
<graph xmlns="http://www.martin-loetzsch.de/DOTML">
  <node id="test"/>
</graph>;

declare %unit:test
(:~
 : check graph node converts
 :) 
function  test:simple(){
  let $s:= ex-dotml:to-dot($test:simple)
  return unit:assert(starts-with($s,"digraph "))
};
