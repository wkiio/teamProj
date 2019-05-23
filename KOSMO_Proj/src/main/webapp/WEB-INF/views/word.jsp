<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


  <style>
    text:hover {
        stroke: black;
    }
  </style>
  <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
  <script src="Bootstrap/js/d3.layout.cloud.js"></script>

  <div id="cloud"></div>
  <script type="text/javascript">
    var weight = 3,   // change me
        width = 1800,
        height = 750;
    var fill = d3.scale.category20();
    d3.csv("/baby/words.csv", function(d) {
        return {
          text: d.word,
          size: +d.freq*weight
        }
      },
      function(data) {
        d3.layout.cloud().size([width, height]).words(data)
          //.rotate(function() { return ~~(Math.random() * 2) * 90; })
          .rotate(0)
          .font("Impact")
          .fontSize(function(d) { return d.size; })
          .on("end", draw)
          .start();

        function draw(words) {
          d3.select("#cloud").append("svg")
              .attr("width", width)
              .attr("height", height)
            .append("g")
              .attr("transform", "translate(" + width/2 + "," + height/2 + ")")
            .selectAll("text")
              .data(words)
            .enter().append("text")
              .style("font-size", function(d) { return d.size + "px"; })
              .style("font-family", "Impact")
              .style("fill", function(d, i) { return fill(i); })
              .attr("text-anchor", "middle")
              .attr("class", "wordCloudText")
              .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
              })
            .text(function(d) { return d.text; });

          //////
          $(".wordCloudText").each(function(){
          	$(this).on('click', function(){
          		//location.href("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+$(this).html());
          		window.open("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+$(this).html());
          		console.log($(this).html());	
          	});
          });
          //////
        }
      });

  </script>

