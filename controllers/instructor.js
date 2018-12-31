var app = angular.module('instructor',['account-module','app-module']);

app.controller('instructorCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

