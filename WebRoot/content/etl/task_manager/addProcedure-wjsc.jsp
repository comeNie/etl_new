<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
 <head>
  <title>步骤新增</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="${pageContext.request.contextPath }/styles/bui-bootstrap/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/styles/bui-bootstrap/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/styles/bui-bootstrap/assets/css/page-min.css" rel="stylesheet" type="text/css" />  
 </head>
 <body>
  
  <div class="container">
  	<h3>步骤新增</h3>
  	<hr>
	<form id ="N_Form" class="form-horizontal" action="${pageContext.request.contextPath}/etl/procedure/addStepwjsc.do" method="post">
		<div class="row">
			<div class="control-group span8">
				<label class="control-label">步骤类型：</label>
				<div class="controls">
					<input name="scene.sceneId" type="hidden" value="${param.rwid }" />
					<input name="stepType.stepTypeId" type="hidden" value="${param.lxid }" /><span class="detail-text"> ${sessionScope.steptypemap[param.lxid] }</span>
				</div>
			</div>
			<div class="control-group span16">
				<label class="control-label"><s>*</s>步骤序号：</label>
				<div class="controls">
					<input name="step" type="text" data-rules="{required:true,number:true,bh:'${param.index }'}" class="input-normal control-text">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span16">
				<label class="control-label"><s>*</s>上一步：</label>
				<div class="controls bui-form-group"  id="previousStepid" style="width: 480px;height: auto;" data-rules="{checkRange:1}" data-messages="{checkRange:'至少勾选一项！'}" >
		        </div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span8">
				<label class="control-label"><s>*</s>步骤名称：</label>
				<div class="controls">
					<input name="stepName" type="text" data-rules="{required:true}" class="input-normal control-text">
				</div>
			</div>
			<div class="control-group span8">
				<label class="control-label"><s>*</s>运行位置类型：</label>
				<div class="controls">
					<select data-rules="{required:true}" id="yxwzlx" name="runPositionType" onchange="loadwz()">
						<option value="1">服务器集群</option>
						<option value="2">指定服务器</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span8">
				<label class="control-label"><s>*</s>运行位置：</label>
				<div class="controls">
					<select data-rules="{required:true}" id="yxwz" name="type">
					</select>
					<input type="hidden" id="yxwza" value="" name=""/>
				</div>
			</div>
			<div class="control-group span8">
				<label class="control-label"><s>*</s>FTP资源选择：</label>
				<div class="controls">
					<select data-rules="{required:true}" id="zylx" name="resourceName" style="width:auto;">
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span16">
				<label class="control-label"><s>*</s>上传目录：</label>
				<div class="controls">
					<input name="upPath" type="text" data-rules="{required:true}" class="input-normal control-text" />&nbsp;注：动态目录举例/dev/\${yyyyMMdd}/
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span16">
				<label class="control-label">动态目录偏移量：</label>
				<div class="controls">
					<input name="upPathOffset" id="upPathOffset" type="text" data-rules="{number:true}" value="0" class="input-normal control-text">&nbsp;（天）
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span16">
				<label class="control-label">文件名追加日期：</label>
				<div class="controls">
					<select name="isAppendTime" id="isAppendTime">
						<option value="1">不追加</option>
						<option value="2">文件名前</option>
						<option value="3">文件名后缀前</option>
						<option value="4">文件名后</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span16">
				<label class="control-label">文件名日期格式：</label>
				<div class="controls">
					<input name="appendTimePattern" id="appendTimePattern" type="text" value="" class="input-normal control-text">&nbsp;如：yyyyMMdd（不追加则不填）
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span8">
				<label class="control-label">文件名日期偏移量：</label>
				<div class="controls">
					<input name="appendTimeOffset" id="appendTimeOffset" data-rules="{number:true}" type="text" value="0" class="input-normal control-text">
				</div>
			</div>
			<div class="control-group span8">
				<label class="control-label">是否压缩成GZ：</label>
				<div class="controls">
					<select name="isGz" id="isGz">
						<option value="0">否</option>
						<option value="1">是</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span8">
				<label class="control-label">内存最大值：</label>
				<div class="controls">
					<input name="memMax" type="text" value="128" class="input-normal control-text">
				</div>
			</div>
			<div class="control-group span8">
				<label class="control-label">内存最小值：</label>
				<div class="controls">
					<input name="memMin" type="text" value="64" class="input-normal control-text">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span8">
				<label class="control-label">并发量：</label>
				<div class="controls">
					<input name="threadNum" value="1" type="text" class="input-normal control-text">
				</div>
			</div>
			<div class="control-group span8">
				<label class="control-label">运行方式：</label>
				<div class="controls">
					<select name="runType">
						<option value="0">进程</option>
						<option value="1">线程</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span8">
				<label class="control-label">是否等待前置步骤执行完成：</label>
				<div class="controls">
					<select name="isWaitPre">
						<option value="0" selected="selected">否</option>
						<option value="1">是</option>
					</select>
				</div>
			</div>
			<div class="control-group span8">
				<label class="control-label">创建人：</label>
				<div class="controls">
					<input name="createOp" type="text" class="input-normal control-text"/>
				</div>
			</div>
		</div>
      	<div class="row">
        	<div class="form-actions offset3">
          		<button type="submit" class="button button-primary">保存</button>
          		<button type="button" class="button" id="cancelButton">取消</button>
        	</div>
      	</div>
    </form>
  </div>
  <script type="text/javascript" src="${pageContext.request.contextPath }/styles/bui-bootstrap/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/styles/bui-bootstrap/assets/js/bui-min-jerry.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/styles/bui-bootstrap/assets/js/config-min.js"></script>
  <script type="text/javascript">
	var jldata = [];
  	$("#cancelButton").click(function(){
  		location.href="${pageContext.request.contextPath}/etl/procedure/toEditProcedure.do?sceneId=${param.rwid }";
  	});
  	
  	function loadwz(){
  		var lx = $("#yxwzlx").val();
  		var wz = $("#yxwz");
  		var wza = $("#yxwza");
  		if (lx == 1){
  			wz.attr("name","serverCluster.serverClusterId");
  			wza.attr("name","node.nodeCode");
  		} else {
  			wz.attr("name","node.nodeCode");
  			wza.attr("name","serverCluster.serverClusterId");
  		}
  		var data = lxdata[lx];
  		wz.html("");
		for(var i = 0; i < data.length; i++){
			wz.append('<option value="'+data[i].value+'">'+data[i].text+'</option>');
		}	
  	}
  	function conteion(str,arr){
 		for (var i = 0; i < arr.length; i++){
 			if (str == arr[i]) {
 				return true;
 			}
 		}
 		return false;
 	}
  	
  	 $(document).ready(function(){
  		$.ajax({
  			type:'post',
  			url:'${pageContext.request.contextPath}/etl/procedure/queryStepNameList.do',
  			data:{sceneId:'${param.rwid }'},
  			dataType:'json',
  			success:function(data){
  				var  html = '<label class="checkbox"><input name="previousStep" type="checkbox" value="-1"/>无</label>';
  				for (var i = 0; i < data.length; i++) {
					html = html + '<label class="checkbox"><input name="previousStep" type="checkbox" class="bui-form-field-checkbox bui-form-check-field bui-form-field" aria-disabled="false" value="'+data[i].STEP_TYPE_ID+'" />'+data[i].STEP_TYPE_NAME+'</label>';
					//html = html + '<input name="previousSteps" type="checkbox" value="'+data[i].STEP_TYPE_ID+'" />'+data[i].STEP_TYPE_NAME;
				}
  				/*
  				if(data.length == 0){
  					html = '<label class="checkbox"><input name="previousStep" type="checkbox" value="-1" checked="checked"/>无</label>';
  				}*/
  				$("#previousStepid").html(html);
  				BUI.use('bui/form',function(Form){
  					Form.Rules.add({
  				        name : 'bh',  //规则名称
  				        msg : '请填写除{0}数字以外的编号。',//默认显示的错误信息
  				        validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
  				        	  var bv = baseValue.split(',')
	  				          if(value && conteion(value,bv)){
	  				            return formatMsg;
	  				          }
  				        }
  				      }); 
	  				var N_Form = new Form.HForm({
	  			        srcNode : '#N_Form',
	  			        type:'post',
	  			        submitType : 'ajax',
	  			        callback : function(data){
	  			        	if(data=="1"){
	  			        		BUI.Message.Alert("步骤创建成功!",function(){
	  			        			location.href="${pageContext.request.contextPath}/etl/procedure/toEditProcedure.do?sceneId=${param.rwid }";
	  							},"success");
	  			        		//history.back();
	  			        	}else{
	  			        		BUI.Message.Alert("步骤创建失败!<br>",function(){},"error");
	  			        	}
	  			          
	  			        }
	  			     }).render();
  				});
  			}
  		});
  		
  		$.ajax({
  			type:'post',
  			url:'${pageContext.request.contextPath}/etl/procedure/queryyxlxList.do',
  			dataType:'json',
  			success:function(data){
  				lxdata = data;
  				loadwz();
  			}
  		});
  		
  		$.ajax({
  			type:'post',
  			url:'${pageContext.request.contextPath}/etl/procedure/getFtpList.do',
  			dataType:'json',
  			success:function(data){
  				var zylx = $("#zylx");
  				zylx.html("");
  				for(var i = 0; i < data.length; i++){
  					zylx.append('<option value="'+data[i].NAME+'">'+data[i].NAME+'</option>');
  				}
  			}
  		});
  		
  	 });
 
  </script>

<body>
</html> 