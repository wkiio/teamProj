var words = sortByFrequency([
	"가",
	"나",
	"다",
	"라면",
	"가위",
	"바위",
	"보",
	"육아",
	"기저귀",
	"three",
	"유모차",
	"카풀",
	"캘린더",
	"회원가입",
	"로그인",
	"빈문자",
	"로또",
	"분석",
	"저장",
	"삭제",
	"실패",
	"덕유산",
	"도봉산",
	"수락산",
	"백두산",
	"한라산",
	"파이썬",
	"자바",
	"하품",
	"노트북",
	"컴퓨터",
	"이불",
	"휴대폰",
	"아이폰",
	"안경",
	"숙제",
	"프로젝트",
	"스프링",
	"오라클",
	"크롤링",
	"스크랩",
	"파이참",
	"주피터",
	"아장",
	"집",
	"가자",
	"가산동",
	"인천",
	"경북",
	"서울",
	"대전",
	"대구",
	"부산",
	"경남",
	"충남",
	"아장아장"
]).map(function(d, i) {
	//console.log(d);
	return { text: d, size: -i };
});

var fontName = "Impact",
	cWidth = 1850,
	cHeight = 700,
	svg,
	wCloud,
	bbox,
	ctm,
	bScale,
	bWidth,
	bHeight,
	bMidX,
	bMidY,
	bDeltaX,
	bDeltaY;

var cTemp = document.createElement("canvas"),
	ctx = cTemp.getContext("2d");
ctx.font = "100px " + fontName;

var fRatio = Math.min(cWidth, cHeight) / ctx.measureText(words[0].text).width,
	fontScale = d3.scale
		.linear()
		.domain([
			d3.min(words, function(d) {
				return d.size;
			}),
			d3.max(words, function(d) {
				return d.size;
			})
		])
		//.range([20,120]),
		.range([20, 100 * fRatio / 2]), // tbc
	fill = d3.scale.category20();

d3.layout
	.cloud()
	.size([cWidth, cHeight])
	.words(words)
	//.padding(2) // controls
	.rotate(function() {
		return ~~(Math.random() * 2) * 90;
	})
	.font(fontName)
	.fontSize(function(d) {
		return fontScale(d.size);
	})
	.on("end", draw)
	.start();

function draw(words, bounds) {
	// move and scale cloud bounds to canvas
	// bounds = [{x0, y0}, {x1, y1}]
	bWidth = bounds[1].x - bounds[0].x;
	bHeight = bounds[1].y - bounds[0].y;
	bMidX = bounds[0].x + bWidth / 2;
	bMidY = bounds[0].y + bHeight / 2;
	bDeltaX = cWidth / 2 - bounds[0].x + bWidth / 2;
	bDeltaY = cHeight / 2 - bounds[0].y + bHeight / 2;
	bScale = bounds ? Math.min(cWidth / bWidth, cHeight / bHeight) : 1;

	console.log(
		"bounds (" +
			bounds[0].x +
			", " +
			bounds[0].y +
			", " +
			bounds[1].x +
			", " +
			bounds[1].y +
			"), width " +
			bWidth +
			", height " +
			bHeight +
			", mid (" +
			bMidX +
			", " +
			bMidY +
			"), delta (" +
			bDeltaX +
			", " +
			bDeltaY +
			"), scale " +
			bScale
	);

	// the library's bounds seem not to correspond to reality?
	// try using .getBBox() instead?

	svg = d3
		.select(".cloud")
		.append("svg")
		.attr("width", cWidth)
		.attr("height", cHeight);

	wCloud = svg
		.append("g")
		//.attr("transform", "translate(" + [bDeltaX, bDeltaY] + ") scale(" + 1 + ")") // nah!
		.attr(
			"transform",
			"translate(" + [bWidth >> 1, bHeight >> 1] + ") scale(" + bScale + ")"
		) // nah!
		.selectAll("text")
		.data(words)
		.enter()
		.append("text")
		.style("font-size", function(d) {
			return d.size + "px";
		})
		.style("font-family", fontName)
		.style("fill", function(d, i) {
			return fill(i);
		})
		.attr("text-anchor", "middle")
		.transition()
		.duration(500)
		.attr("transform", function(d) {
			return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
		})
		.text(function(d) {
			return d.text;
		});

	// TO DO: function to find min and max x,y of all words
	// and use it as the group's bbox
	// then do the transformation
	bbox = wCloud.node(0).getBBox();
	//ctm = wCloud.node().getCTM();
	console.log(
		"bbox (x: " +
			bbox.x +
			", y: " +
			bbox.y +
			", w: " +
			bbox.width +
			", h: " +
			bbox.height +
			")"
	);
}

function sortByFrequency(arr) {
	var f = {};
	arr.forEach(function(i) {
		f[i] = 0;
	});
	var u = arr.filter(function(i) {
		return ++f[i] == 1;
	});
	return u.sort(function(a, b) {
		return f[b] - f[a];
	});
}
