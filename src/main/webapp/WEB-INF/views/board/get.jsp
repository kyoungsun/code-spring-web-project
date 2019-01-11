<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Read Page</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Board Read Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="form-group">
                    <label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
                </div>
           		<div class="form-group">
           			<label>Title</label> <input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
           		</div>
           		<div class="form-group">
           			<label>Text area</label> <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content}"/></textarea>
           		</div>
           		<div class="form-group">
           			<label>Writer</label> <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
           		</div>
           		<button data-oper="modify" class="btn btn-default">Modify</button>
           		<button data-oper="list" class="btn btn-info">List</button>

           		<form id="operForm" action="/board/modify" method="get">
           		   <input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
           		   <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
           		   <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
           		   <input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
           		   <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
           		</form>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	console.log("============");
	console.log("JS TEST");

	var bnoValue = '<c:out value="${board.bno}"/>';

	// for replyService add test
	replyService.add(
			{reply:"JS TEST", replyer:"tester", bno:bnoValue},
			function(result) {
				alert("RESULT: " + result);
			}
	);

	// for replyService getList test
	replyService.getList({bno:banoValue, page:1}, function(list) {
		for (var i = 0, len = list.length || 0; i < len; i++) {
			console.log(list[i]);
		}
	});

	// for replyService remove test
	replyService.remove(23, function(count) {
		console.log(count);

		if (count === "success") {
			alert("REMOVED");
		}
	}, function(err) {
		alert("ERROR...");
	});

	// for replyService update test
	replyService.update({
		rno : 22,
		bno : bnoValue,
		reply : "Modified Reply..."
	}, function(result) {
		alert("수정 완료...");
	});

});
</script>

<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");

	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/board/modify").submit();
	});

	$("button[data-oper='list']").on("click", function(e) {
        operForm.find("#bno").remove();
        operForm.attr("action", "/board/list").submit();
    });
});
</script>

<%@ include file="../includes/footer.jsp"%>