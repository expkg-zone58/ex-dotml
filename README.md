# ex-dotml
The dotML library provides conversion from `dotML` format to Graphviz[1] dot.

This application includes an XSLT transform to convert `DotML` to `dot` developed by Martin Loetzsch. 
`DotML`[2] is a XML based syntax for the input language 'Dot' used by Graphviz.
## Example
````
import module namespace dotml="http://www.martin-loetzsch.de/DOTML";

<graph xmlns="http://www.martin-loetzsch.de/DOTML">
<node id="a"/>
<node id="b"/>
<edge from="a" to="b"/>
</graph>

!dotml:to-dot(.)
````

Result:
````
digraph g {compound="true";bgcolor="";fontcolor="";fontname="";fontsize="";label="";margin="";nodesep="";rankdir="";ranksep="";ratio="";size="";node[label="a", color="",fillcolor="",fixedsize="",fontcolor="",fontname="",fontsize="",height="",shape="",style="",URL="",width="",] {a};node[label="b", color="",fillcolor="",fixedsize="",fontcolor="",fontname="",fontsize="",height="",shape="",style="",URL="",width="",] {b};edge[arrowhead="",arrowsize="",arrowtail="",constraint="",color="",decorate="",dir="",fontcolor="",fontname="",fontsize="",headlabel="",headport="",label="",labeldistance="",labelfloat="",labelfontcolor="",labelfontname="",labelfontsize="",minlen="",samehead="",sametail="",style="",taillabel="",tailport="",URL="",lhead="",ltail=""] a -> b;}
````

## References
[1] http://www.graphviz.org/
[2] http://www.martin-loetzsch.de/DOTML/
