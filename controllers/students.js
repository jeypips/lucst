var app = angular.module('student',['account-module','app-module']);

app.controller('studentCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

