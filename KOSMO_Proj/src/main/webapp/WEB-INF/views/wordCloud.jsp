<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@font-face {
	font-family: 'overwatch';
	src: url('fonts/koverwatch.woff2');
}
</style>

<body>
	<div class="cloud" style="width:100%;height:750px;margin-top: 30px"></div>
	<script>

        var svg = d3.select(""cloud"").append("svg").attr("width", width).attr("height", height);
        d3.csv("worddata.csv", function (data) {
            showCloud(data)
            setInterval(function(){
                 showCloud(data)
            },2000) 
        });
        //scale.linear: 선형적인 스케일로 표준화를 시킨다. 
        //domain: 데이터의 범위, 입력 크기
        //range: 표시할 범위, 출력 크기 
        //clamp: domain의 범위를 넘어간 값에 대하여 domain의 최대값으로 고정시킨다.
        wordScale = d3.scale.linear().domain([0, 100]).range([0, 150]).clamp(true);
        var keywords = ["자리야", "트레이서", "한조"]
        var svg = d3.select("svg").append("g").attr("transform", "translate(" + width/2 + "," + height/2 + ")");

        function showCloud(data) {
            d3.layout.cloud().size([width, height])
                //클라우드 레이아웃에 데이터 전달
                .words(data)
                .rotate(function (d) {
                    return d.text.length > 3 ? 0 : 90;
                })
                //스케일로 각 단어의 크기를 설정
                .fontSize(function (d) {
                    return wordScale(d.frequency);
                })
                //클라우드 레이아웃을 초기화 > end이벤트 발생 > 연결된 함수 작동  
                .on("end", draw)
                .start();

            function draw(words) { 
                var cloud = svg.selectAll("text").data(words)
                //Entering words
                cloud.enter()
                    .append("text")
                    .style("font-family", "overwatch")
                    .style("fill", function (d) {
                        return (keywords.indexOf(d.text) > -1 ? "#fbc280" : "#405275");
                    })
                    .style("fill-opacity", .5)
                    .attr("text-anchor", "middle") 
                    .attr('font-size', 1)
                    .text(function (d) {
                        return d.text;
                    }); 
                cloud
                    .transition()
                    .duration(600)
                    .style("font-size", function (d) {
                        return d.size + "px";
                    })
                    .attr("transform", function (d) {
                        return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
                    })
                    .style("fill-opacity", 1); 
            }
        }
    </script>
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script
		src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js"
		type="text/JavaScript"></script>
</body>
