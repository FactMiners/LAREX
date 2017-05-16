<%@tag description="Edit Segment Window" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col s12">
	<ul class="collapsible row" data-collapsible="accordion">
		<li>
			<div class="collapsible-header">
				<i class="material-icons">dashboard</i>
				<span>
					Regions
				</span>
			</div>
			<div id="sidebarRegions" class="collapsible-body">
				<div class="settings-regions">
					<ul class="collection">
						<li class="regionlegendAll collection-item">
							--Show all--
							<span class="secondary-content switch"> 
								<label><input type="checkbox"> 
									<span class="lever"></span>
								</label>
							</span>	
						</li>
						<c:forEach var="type" items="${segmenttypes}">
							<li class="regionlegend collection-item" data-type="${type.key}">
								<span class="regionSettings" data-type="${type.key}">
									<div class="legendicon ${type.key}"></div>${type.key}
								</span>
								
								<span class="secondary-content ">
									<span class="switch">
										<label><input type="checkbox"> 
											<span class="lever"></span>
										</label>
									</span>
								</span>
							</li>
						</c:forEach>
						<li class="collection-item regionCreate">
							<span>
								--Create--
							</span>
						</li>
					</ul>
				</div>
			</div>
		</li>
		<li>
			<div class="collapsible-header active">
				<i class="material-icons">settings</i>Parameters
			</div>
			<div class="collapsible-body">
				<div id="parameter-settings">
					<div class="hide">
						<p class="settings-input" >Binary Thresh</p>
						<p class="settings-input">
							<input value="" id="binarythreash" class="input-number"
								type="number" class="validate" size="4" />
						</p>
					</div>
					<div>
						<p class="settings-input">Text Dilation</p>
						<p class="settings-input">
							<input value="" id="textdilationX" class="input-number textdilationX" type="number" class="validate" /> :
							<input value="" id="textdilationY" class="input-number textdilationY" type="number" class="validate" />
						</p>
					</div>
					<div>
						<p class="settings-input">Image Dilation</p>
						<p class="settings-input">
							<input value="" id="imagedilationX"
								class="input-number imagedilationX" type="number" class="validate" />
							: <input value="" id="imagedilationY"
								class="input-number imagedilationY" type="number" class="validate" />
						</p>
					</div>
				</div>
			</div>
	</ul>
	<a class="col s12 waves-effect waves-light btn doSegment">Segment</a>
	
	<a class="col s12 waves-effect waves-light btn disabled tooltipped" 
	data-position="bottom" data-delay="50" data-tooltip="Comming soon">
		Export PageXML 
	</a>
</div>