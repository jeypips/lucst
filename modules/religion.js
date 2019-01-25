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
			
			scope.religion = {};
			scope.religion.id = 0;			
			
			scope.religions = []; //list
			
		};
		
		function validate(scope) {
			
			var controls = scope.formHolder.religion.$$controls;
			
			angular.forEach(controls,function(elem,i) {
				
				if (elem.$$attr.$attr.required) elem.$touched = elem.$invalid;
									
			});

			return scope.formHolder.religion.$invalid;
			
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
			
			scope.religion = {};
			scope.religion.id = 0;						
			
			$http({
			  method: 'POST',
			  url: 'handlers/religions/list.php'
			}).then(function success(response) {
				
				scope.religions = angular.copy(response.data);
				
				bui.hide();
				
			}, function error(response) {
				
				bui.hide();

			});			
			
			$('#content').html(loading);
			$('#content').load('lists/religions.html', function() {
				$timeout(function() { $compile($('#content')[0])(scope); },100);								
				// instantiate datable
				$timeout(function() {
					$('#religions').DataTable({
						"ordering": false
					});	
				},200);
				
			});		
			
		};
		
		self.religion = function(scope,row) {			

			scope.religion = {};
			scope.religion.id = 0;

			bui.show();

			mode(scope,row);
			
			$('#content').load('forms/religion.html',function() {
				$timeout(function() {
					
					$compile($('#content')[0])(scope);
					
					if (row != null) {
						
						$http({
						  method: 'POST',
						  url: 'handlers/religions/view.php',
						  data: {id: row.id}
						}).then(function success(response) {

							scope.religion = angular.copy(response.data);
							
							bui.hide();
							
						}, function error(response) {
							
							bui.hide();				
							
						});
						
					} else {
						
						scope.religion = {};
						scope.religion.id = 0;
						
					};
					
					bui.hide();
					
				}, 500);
			});						
			
		};
		
		self.cancel = function(scope) {			
			
			scope.religion = {};
			scope.religion.id = 0;			
			
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
			  url: 'handlers/religions/save.php',
			  data: {religion: scope.religion}
			}).then(function success(response) {
				
				bui.hide();
				if (scope.religion.id == 0) growl.show('btn btn-success',{from: 'top', amount: 55},'New religion info successfully added');				
				else growl.show('btn btn-success',{from: 'top', amount: 55},'Religion Info successfully updated');				
				mode(scope,scope.religion);		
				
			}, function error(response) {
				
				bui.hide();				
				
			});				
			
		};
		
		self.delete = function(scope,row) {
			
			var onOk = function() {
				
				if (scope.$id > 2) scope = scope.$parent;			
				
				$http({
				  method: 'POST',
				  url: 'handlers/religions/delete.php',
				  data: {id: [row.id]}
				}).then(function mySucces(response) {

					self.list(scope);
					
					growl.show('btn btn-danger',{from: 'top', amount: 55},'Religion Info successfully deleted.');
					
				}, function myError(response) {
					 
				  // error
					
				});

			};

			bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this record?',onOk,function() {});
				
		};
		
	};
	
	return new app();
	
});