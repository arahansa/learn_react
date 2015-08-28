'use strict';

app.controller('simpleController', ['$scope', function($scope, $compile) {
    $scope.customers=[
                    {name:'Alphy Poxy',city:'Mbita'},
                    {name:'Kibaki Watson',city:'Kikuyu'},
                    {name:'John Legend',city:'Lake'}, 
                    {name:'Sony',city:'HB'}
                ];
    $scope.toggle = function() {
        alert('click');
    };
    
    
    $scope.person = {
  	      name: 'nextreeMember',
  	      address: 'Gasan'
	};
	$scope.owner = { name: 'kangyong'};
	
	
	$scope.nextree = { name: 'Nextree'};
	$scope.kangyong = { name: "kang", address: "incheon" };
	$scope.ann = {name : "ann", address: "us"};
	
	$scope.items = [
	                {title: 'What is Directive?',
	                 content: '특정한 행위의 기능을 가진 DOM엘리먼트.'},
	                {title: 'Custom Directive',
	                 content: '디렉티브를 직접 생성해보십시오.'},
	                {title: 'Bye~',
	                 content: '디렉티브 이야기를 마치겠습니다.'}
	            ];
	
	$scope.items2 = [
	                 {title: "hi" , content: "안녕하세요"},
	                 {title: "hi2" , content: "안녕하세요2"}
	];
	
	$scope.test = function(event, item){
		console.log("테스트");
		console.log(event);
		console.log(item);
		$(event.currentTarget).remove();
		$(event.currentTarget).prev().after("<my-reply></my-reply>");
	}
}]);

app.directive('hiHello', function() {
    return {
        restrict: 'E',
        template: 'Name: {{p.name}} </br> Address: {{p.address}}',
        scope: { p: '=p'}
		
      }
});



app.directive('nextreeDirective', function() {
    return {
        restrict: 'E',
        scope: {
          myCompany: '=companyInfo'
        },
        template: 'Name:{{myCompany.name}}'
      };
});


app.directive('myTitle', function() {
    return {
        restrict: 'E',
        replace: true,
        transclude: true,
        template: '<div ng-transclude></div>',
        controller: function() {
           var items = [];
           this.addItem = function(item) {
              items.push(item);
           }
       }
    };
 });

app.directive('myContent', function(){
    return {
        restrict: 'E',
        replace: true,
        transclude: true,
        require: '^?myTitle',
        scope: { title:'=itemTitle' },
        template : '<div>' +
                   '<div class="title" ng-click="click()">{{title}}</div>' +
                   '<div class="body" ng-show="showMe" ng-transclude></div>' +
                   '</div>',
        link: function(scope, element, attrs, controller) {
            scope.showMe = false;
            controller.addItem(scope);
            scope.click = function click(){
               scope.showMe = !scope.showMe;
            }
        }
    };
});


app.directive('myReply', function() {
    return {
        restrict: 'E',
        template: '<div class=\"reple_con dot3\">' +
           '<textarea>hm</textarea></div>' +
		   '<button ng-click="click()">확인</button><button>취소</button>',
		link: function(scope, element, attrs, controller) {
	            scope.click = function click(){
	              console.log("hi");
	            }
	    }    
      }
});
