<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:webpage>
	<t:head>
		<!-- Load the Paper.js library -->
		<script type="text/javascript" src="resources/js/paper.js"></script>

		<!-- Viewer scripts -->
		<script type="text/javascript" src="resources/js/viewer/actions.js"></script>
		<script type="text/javascript"
			src="resources/js/viewer/navigationcontroller.js"></script>
		<script type="text/javascript" src="resources/js/viewer/guiInput.js"></script>
		<script type="text/javascript"
			src="resources/js/viewer/viewerInput.js"></script>
		<script type="text/javascript" src="resources/js/viewer/keyInput.js"></script>
		<script type="text/javascript" src="resources/js/viewer/controller.js"></script>
		<script type="text/javascript" src="resources/js/viewer/communicator.js"></script>
		<script type="text/javascript" src="resources/js/viewer/gui.js"></script>
		<script type="text/javascript" src="resources/js/viewer/viewer.js"
			canvas="viewerCanvas"></script>
		<script type="text/javascript" src="resources/js/viewer/editor.js"
			canvas="viewerCanvas"></script>

		<!-- Main Method -->
		<script>
		var controller = new Controller(${book.getId()},'viewerCanvas');
		$(document).ready(function() {
			$(".button-collapse").sideNav();
		    $('select').material_select();
		});
		</script>

		<link rel="stylesheet" href="resources/css/viewer.css">
		<title>Larex - Editor</title>
	</t:head>

	<body>
		<div id="menu" class="grey lighten-4">
			<div class="mainMenu">
				<ul class="tabs">
					<li class="tab"><a href="#file">File</a></li>
					<li class="tab"><a class="active" href="#nav">Navigation</a></li>
					<li class="tab"><a href="#edit">Edit</a></li>
				</ul>
			</div>
			<div class="secondMenu">
				<div id="file" class="">
					<div class="">
						<t:menuIcon url="${pageContext.request.contextPath}/" jsClass="open" icon="folder_open"
							tooltip="Open a different book">Open</t:menuIcon>
						<t:menuIcon jsClass="export" icon="code"
							tooltip="Export as PageXML (Coming soon)">PageXML Export</t:menuIcon>
					</div>
				</div>
				<div id="nav" class="">
					<div class="">
						<t:menuIcon jsClass="moveup" icon="keyboard_arrow_up"
							tooltip="Moves the image up (Shortcut: arrow up or drag image)">Up</t:menuIcon>
						<t:menuIcon jsClass="movedown" icon="keyboard_arrow_down"
							tooltip="Moves the image down (Shortcut: arrow down or drag image)">Down</t:menuIcon>
						<t:menuIcon jsClass="moveleft" icon="keyboard_arrow_left"
							tooltip="Moves the image left (Shortcut: arrow left or drag image)">Left</t:menuIcon>
						<t:menuIcon jsClass="moveright" icon="keyboard_arrow_right"
							tooltip="Moves the image right (Shortcut: arrow right or drag image)">Right</t:menuIcon>
						<div class="menuIconDivider col"></div>
						<t:menuIcon jsClass="movecenter" icon="crop_free"
							tooltip="Centers the images position (Shortcut: space)">Center</t:menuIcon>
						<div class="menuIconDivider col"></div>
						<t:menuIcon jsClass="zoomout" icon="zoom_out"
							tooltip="Zoom the image out (Shortcut: - or scroll wheel)">Zoom out</t:menuIcon>
						<div class="menuIcon col">
							<div class="menuIconMain">
								<span class="zoomvalue">100.00</span>%
							</div>
							<span class="menuIconSecond">Zoom</span>
						</div>
						<t:menuIcon jsClass="zoomin" icon="zoom_in"
							tooltip="Zoom the image in (Shortcut: + or scroll wheel)">Zoom in</t:menuIcon>
						<div class="menuIconDivider col"></div>
						<t:menuIcon jsClass="zoomfit" icon="zoom_out_map"
							tooltip="Zooms image to fit the screen (Shortcut: space)">Zoom fit</t:menuIcon>
					</div>
				</div>
				<div id="edit" class="">
					<div class=""><t:menuIcon jsClass="invert" icon="dashboard" tooltip="Region">Region</t:menuIcon>
						<t:menuIcon jsClass="createRegionRectangle" icon="crop_5_4"
							tooltip="Create a region rectangle (Shortcut: 1)">Rectangle</t:menuIcon>
						<t:menuIcon jsClass="createRegionBorder" icon="border_left"
							tooltip="Create a region border (Shortcut: 2)">Border</t:menuIcon>
						<div class="menuIconDivider col"></div>
						<t:menuIcon jsClass="invert" icon="bubble_chart" tooltip="Fixed Result Segment">Segment</t:menuIcon>
						<t:menuIcon jsClass="createSegmentRectangle" icon="crop_5_4"
							tooltip="Create a fixed segment rectangle (Shortcut: 4)">Rectangle</t:menuIcon>
						<t:menuIcon jsClass="createSegmentPolygon" icon="star_border"
							tooltip="Create a fixed segment polygon. Back to start, double click or ESC to end (Shortcut: 3)">Polygon</t:menuIcon>
						<div class="menuIconDivider col"></div>
						<t:menuIcon jsClass="invert" icon="content_cut" tooltip="Cut">Cut</t:menuIcon>
						<t:menuIcon jsClass="createCut" icon="timeline"
							tooltip="Create a cut line. Double click or ESC to end (Shortcut: 6)">Line</t:menuIcon>
						<div class="menuIconDivider col"></div>
						<t:menuIcon jsClass="undo" icon="undo"
							tooltip="Revokes the last action (Shortcut: ctrl+z)">Undo</t:menuIcon>
						<t:menuIcon jsClass="redo" icon="redo"
							tooltip="Executes the most recent undone action (Shortcut: ctrl+y)">Redo</t:menuIcon>
					</div>
				</div>
			</div>
		</div>

		<div id="viewerRwapper" class="row">
			<div class="sidebar col s3 m1 l1">
				<t:booksidebar/>
			</div>
			<div id="viewer" class="col s5 m9 l9">
				<canvas id="viewerCanvas" class="grey darken-1" resize="true"></canvas>
			</div>
			
			<div class="sidebar col s4 m2 l2">
			<t:sidebar/>
			</div>
		</div>
<!-- 	<div id="toprightUI" class="canvasUI">
			<t:menuIcon jsClass="zoomout" icon="zoom_out"
				tooltip="Zoom the image out (Shortcut: - or scroll wheel)"></t:menuIcon>
			<t:menuIcon jsClass="zoomin" icon="zoom_in"
				tooltip="Zoom the image in (Shortcut: + or scroll wheel)"></t:menuIcon>
			<t:menuIcon jsClass="zoomfit" icon="zoom_out_map"
				tooltip="Zooms image to fit the screen (Shortcut: space)"></t:menuIcon>
		</div> -->
	
		<t:preloader/>
		<t:regionsettings/>
		<t:contextmenu/>
	</body>
</t:webpage>