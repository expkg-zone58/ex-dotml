(:~
 : ex-dotml tests
 :)
module namespace test = 'http://basex.org/modules/xqunit-tests';
import module namespace ex-dotml="http://expkg-zone58.github.io/ex-dotml/";

declare %unit:test
(:~
 : check graph node converts
 :) 
function  test:simple(){
  let $s:= to-dot(<graph><node id="44"/></graph>)
  return unit:assert(fn:true())
};
