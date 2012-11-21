
function loadDirectoryTree(sid){
  var w = 192,
  h = 620,
  i = 0,
  barHeight = 20,
  barWidth = w * .5,
  duration = 400,
  root;

  var tree = d3.layout.tree()
    .size([h, 100]);
  
  var diagonal = d3.svg.diagonal()
    .projection(function(d) { return [d.y, d.x]; });

  var tvis = d3.select(sid).append("svg:svg")
    .attr("width", w)
    .attr("height", h)
    .append("svg:g")
    .attr("transform", "translate(0, 12)");

  d3.json("/topo/test.json?na=6&nb=10&nc=6", function(json) {
    json.x0 = 0;
    json.y0 = 0;
    root = json;
    function collapse(d) {
      if (d.children) {
        d._children = d.children;
        d._children.forEach(collapse);
        d.children = null;
      }
    }
    
    root.children.forEach(collapse);
    update(root);
  });
  
  function update(source) {
    d3.select(sid + ' svg').attr("height", h);

    // Compute the flattened node list. TODO use d3.layout.hierarchy.
    var nodes = tree.nodes(root);
    
    // Compute the "layout".
    nodes.forEach(function(n, i) {
      n.x = i * barHeight ;
    });
    
    // Update the nodes…
    var node = tvis.selectAll("g.node")
      .data(nodes, function(d) { return d.id || (d.id = ++i); });
    
    var nodeEnter = node.enter().append("svg:g")
      .attr("class", "node")
      .attr("id", function(d){ return d.id })
      .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
      .style("opacity", 1e-6);

    // Enter any new nodes at the parent's previous position.
    nodeEnter.append("svg:rect")
      .attr("y", -barHeight / 2)
      .attr("height", barHeight)
      .attr("width", barWidth)
      .style("fill", color)
      .on("click", click);
    
    nodeEnter.append("svg:text")
      .attr("dy", 3.5)
      .attr("dx", 5.5)
      .text(function(d) { return d.name; });
    
    // Transition nodes to their new position.
    nodeEnter.transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; })
      .style("opacity", 1);
    
    node.transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; })
      .style("opacity", 1)
      .select("rect")
      .style("fill", color);
    
    // Transition exiting nodes to the parent's new position.
    node.exit().transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
      .style("opacity", 1e-6)
      .remove();
    
    // Update the links…
    var link = tvis.selectAll("path.link")
      .data(tree.links(nodes), function(d) { return d.target.id; });
    
    // Enter any new links at the parent's previous position.
    link.enter().insert("svg:path", "g")
      .attr("class", "link")
      .attr("d", function(d) {
        var o = {x: source.x0, y: source.y0};
        return diagonal({source: o, target: o});
      })
      .transition()
      .duration(duration)
      .attr("d", diagonal);
    
    // Transition links to their new position.
    link.transition()
      .duration(duration)
      .attr("d", diagonal);
    
    // Transition exiting nodes to the parent's new position.
    link.exit().transition()
      .duration(duration)
      .attr("d", function(d) {
        var o = {x: source.x, y: source.y};
        return diagonal({source: o, target: o});
      })
      .remove();
    
    // Stash the old positions for transition.
    nodes.forEach(function(d) {
      d.x0 = d.x;
      d.y0 = d.y;
    });

    console.log('Update directory tree completed!');
  }

  // Toggle children on click.
  function click(d) {
    var isRefresh;
    
    if (d.children) {
      d._children = d.children;
      d.children = null;
      isRefresh = false;
    } else {
      d.children = d._children;
      d._children = null;
      isRefresh = true;
    }
    isRefresh = d.level == 0 ? tree : isRefresh;

    // Compute new tree height
    h = (2+countNodes(root)) * barHeight;
    update(d);

    // Make request path
    if (isRefresh && (d.children || d._children)){
      var cur = d;
      var ids = [cur.id];
      while(cur.parent){
        cur = cur.parent;
        ids.push(cur.id);
      }
      var path = ids.join(',');
      updateTchart(path);
      updateChart(path);
    }
  }

  function color(d) {
    return d._children ? "#3182bd" : d.children ? "#c6dbef" : "#fd8d3c";
  }
  
  console.log('Load directory tree completed!');
}