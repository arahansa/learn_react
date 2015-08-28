/**
 * 
 */
'use strict';



app.controller('testController',  function($scope) {
    $scope.items =[];
	$scope.addReply = addReply;
	$scope.tempcontent="";
	$scope.items = [
                    {id: 1, nick: "아라한사" , content: "안녕하세요 댓글입니다11 "},
                    {id: 2, nick: "Kevin" , content: "안녕하세요2 댓글입니다. "}             
    ];
    function addReply(){
    	var data = { id: $scope.items.length+1, nick: $("#nick").val(), content: $("#reply").val()};
    	$("#reply").val("");
    	$scope.items.push(data);
    }
   
});

app.directive('myReply', function($compile){
	return {
		restrict: 'E',
		//scope: { item: '=' },
		template: '<div class="myreply">'+
				  '<span class="nick">{{item.nick}} :</span><span class=\"reple_con dot3\">{{item.content}}</span>' +
		   		  '<button ng-click="modify(item)">수정</button><button ng-click="del( $index )">삭제</button></div>',
		link: function(scope, element, attrs, controller) {
		            scope.modify = function click(item){ //수정버튼
		              $(element).find(".reple_con", "button").remove();
		              console.log("저장 전 "+item.content);
		              scope.tempcontent = item.content;
		              console.log("tempcontent :"+scope.tempcontent);
		              $(element).html($compile('<form-modify></form-modify>')(scope));
		            }
		            scope.del = function del( index ){
		            	console.log(index); 
		            	scope.items.splice(index ,1);
		            }
		} 
	} 
});

app.directive('formModify', function($compile){
	return {
		restrict: 'E',
		//scope: {item: '='},
		template: '<form><textarea cols="40" id="modifyContent">{{item.content}}</textarea>'+
			      '<button ng-click="send(item)">확인</button><button ng-click="cancel()">취소</button>'+
				  '</form>',
		link: function(scope, element, attrs, controller) {
			  scope.send = function click(item){
			        console.log("디비로 전송!");
			        console.log(item);
			        console.log($("#modifyContent").val());
			        item.content = $("#modifyContent").val();
			        $(element).find("button", "form").remove();
		            $(element).html($compile('<my-reply></my-reply>')(scope));
			  }
			  scope.cancel = function cancel(  ){
				  $(element).find("button", "form").remove();
				  
				  //console.log("아이디 :"+item.id+"받아올 콘텐츠 :"+scope.tempcontent);
				  
				  //scope.items[index].content = scope.tempcontent;
				  //scope.items[index].content = "하하";
				  
				  $(element).html($compile('<my-reply></my-reply>')(scope));
			  }
	    }
	}
});

