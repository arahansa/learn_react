'use strict';


app.controller('replyController', function ($scope, $http) {
	$scope.init = init;
	$scope.submit = submit;
	$scope.showChildReplies = showChildReplies;
	$scope.edit = edit;
	$scope.deleteReply = deleteReply;
	$scope.test = test;
	

	/** 나중에 삭제 */
	$scope.replies=[
	 {replyId: 1, nick:'바라미테스트', dayWriteStr: '2014-02-25 10:28', msg: '오래전부터 박배우 작품들 바왔지만 박배우는 차 타고나서 지금 혼나러간다고 하는 대사처럼 약간 울음 삼키는 듯한 대사가 압권인듯 내감성이 마이 나만 감성이 마이너인가.. 나는 세기보다는 차도현쪽이고 박배우 짠내 폴폴 풍길때 안쓰러워 죽겠던데ㅜㅜ', userseq: '1234', numChildReplies: 4},
	 {replyId: 2, nick:'바라미1', dayWriteStr: '2014-02-25 10:28', msg: '오래전부터 박배우 작품들 바왔지만 박배우는 차 타고나서 지금 혼나러간다고 하는 대사처럼 약간 울음 삼키는 듯한 대사가 압권인듯 내감성이 마이 나만 감성이 마이너인가.. 나는 세기보다는 차도현쪽이고 박배우 짠내 폴폴 풍길때 안쓰러워 죽겠던데ㅜㅜ', userseq: '1211', numChildReplies: 1},
	 {replyId: 3, nick:'바라미2', dayWriteStr: '2014-02-25 10:28', msg: '안녕하세요2', userseq: '1200', numChildReplies: 2}
	];
	
    function init(pagenumber){
		console.log(pagenumber+"의 글을 읽습니다.!");
		var req = {method: "GET", url: '/rest/replies'};
		$http(req)
			.success(function(data) { console.log(data); $scope.replies=data; })
			.error(function() { alert("댓글 읽어오는데 에러 발생"); });
	}
    
    function submit() {
    	var req = {
    			method: "POST",
    			url: '/angular/reply/write',
    			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    		    transformRequest: function(obj) {
    		        var str = [];
    		        for(var p in obj)
    		        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
    		        return str.join("&");
    		    },
    			data: {
    				nick: $scope.nick, 
    				msg: $scope.message
    			}    	
    	};
    	
    	$http(req).success(function(data) {
        	console.log("응답 댓글");
    		console.log(data);
        	$scope.replies.push(data);
        })
        .error(function(res) {
          console.log(res);
        });
    };
    
    function showChildReplies(event){
		$(event.currentTarget).parent().siblings(".re_reple").slideToggle(150);
		$(event.currentTarget).toggleClass('up');	
	}
    
    function edit(event, reply){
    	var currentObj = $(event.currentTarget).parent().parent();
    	currentObj.prev().remove();
    	angular.element(currentObj).
    		before("<my-reply></my-reply>");
		
    }
    function deleteReply(event, reply){
    	console.log(event);
    	console.log(reply);
    }

	function test(){
		console.log( "hello world" );
	}
    
   
});




