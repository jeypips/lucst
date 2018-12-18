angular.module('app-module', ['bootstrap-modal','ui.bootstrap','block-ui','bootstrap-growl']).factory('app', function($http,$timeout,$compile,bui,growl,bootstrapModal) {

	function app() {

		var self = this;

		var loading = '<div class="col-sm-offset-4 col-sm-8"><button type="button" class="btn btn-dark" title="Loading" disabled><i class="fa fa-spinner fa-spin"></i>&nbsp; Please wait...</button></div>';		

		self.data = function(scope) {
			
			scope.formHolder = {};
			
			scope.btns = {
				ok: { btn: false, label: 'Save'},
				cancel: { btn: false, label: 'Cancel'},
			};
			
			scope.user = {};
			scope.user.id = 0;			
			
			scope.users = []; //list
			
		};
		
		function validate(scope) {
			
			var controls = scope.formHolder.user.$$controls;
			
			angular.forEach(controls,function(elem,i) {
				
				if (elem.$$attr.$attr.required) elem.$touched = elem.$invalid;
									
			});

			return scope.formHolder.user.$invalid;
			
		};
		
		function mode(scope,row) {
			
			if (row == null) {
				scope.btns.ok.label = 'Save';
				scope.btns.ok.btn = false;
				scope.btns.cancel.label = 'Cancel';
				scope.btns.cancel.btn = false;
			} else {
				scope.btns.ok.label = 'Update';
				scope.btns.cancel.label = 'Close';
				scope.btns.ok.btn = true;
			}
			
		};
		
		self.list = function(scope) {
			
			bui.show();

			if (scope.$id > 2) scope = scope.$parent;			

			scope.user = {};
			scope.user.id = 0;						

			$http({
			  method: 'POST',
			  url: 'handlers/users/list.php'
			}).then(function success(response) {
				
				scope.users = angular.copy(response.data);

				bui.hide();
				
			}, function error(response) {
				
				bui.hide();

			});			
			
			$('#content').html(loading);
			$('#content').load('lists/users.html', function() {
				$timeout(function() { $compile($('#content')[0])(scope); },100);								
				// instantiate datable
				$timeout(function() {
					$('#users').DataTable({
						"ordering": false
					});	
				},200);
				
			});	
		};
		
		self.user = function(scope,row) {			

			scope.user = {};
			scope.user.id = 0;

			bui.show();

			mode(scope,row);
			
			$('#content').load('forms/user.html',function() {
				$timeout(function() {
					
					$compile($('#content')[0])(scope);
					
					if (row != null) {
						
						$http({
						  method: 'POST',
						  url: 'handlers/users/view.php',
						  data: {id: row.id}
						}).then(function success(response) {

							scope.user = angular.copy(response.data);
							
							bui.hide();
							
						}, function error(response) {
							
							bui.hide();				
							
						});
						
					} else {
						
						scope.user = {};
						scope.user.id = 0;
						
					};
					
					bui.hide();
					
				}, 500);
			});						
			
		};
		
		self.cancel = function(scope) {			
			
			scope.user = {};
			scope.user.id = 0;			
			
			self.list(scope);
			
		};
		
		self.edit = function(scope) {
			
			scope.btns.ok.btn = !scope.btns.ok.btn;
			
		};
		
		self.save = function(scope) {

			if (validate(scope)) {
				growl.show('btn btn-danger',{from: 'top', amount: 55},'Some fields are required');				
				return;
			};

			$http({
			  method: 'POST',
			  url: 'handlers/users/save.php',
			  data: {user: scope.user}
			}).then(function success(response) {
				
				bui.hide();
				if (scope.user.id == 0) growl.show('btn btn-success',{from: 'top', amount: 55},'New account info successfully added');				
				else growl.show('btn btn-success',{from: 'top', amount: 55},'Account Info successfully updated');				
				mode(scope,scope.user);		
				
			}, function error(response) {
				
				bui.hide();				
				
			});				
			
		};
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				if (scope.$id > 2) scope = scope.$parent;			
				
				$http({
				  method: 'POST',
				  url: 'handlers/users/delete.php',
				  data: {id: [row.id]}
				}).then(function mySucces(response) {

					self.list(scope);
					
					growl.show('btn btn-danger',{from: 'top', amount: 55},'Account Info successfully deleted.');
					
				}, function myError(response) {
					 
				  // error
					
				});

			};

			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this record?',onOk,function() {});
				
		};	
		
	};
	
	return new app();
	
});