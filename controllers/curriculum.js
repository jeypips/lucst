var app = angular.module('curriculum',['account-module','app-module']);

app.controller('curriculumCtrl',function($scope,app) {
	
	$scope.formHolder = {};
	$scope.app = app;

	app.data($scope);
	app.list($scope);
	
});

