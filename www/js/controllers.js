angular.module('app.controllers', [])
     
.controller('searchPresentCtrl', function ($scope, $stateParams, $state, $ionicHistory, $ionicViewSwitcher, API, $ionicLoading) {
	$scope.data = {
		holidays: [
			{id: '', label: '-- Select --'}
		]
	}
	// Show loading until holiday options are loaded
	$ionicLoading.show()
	API.get('holidays', {}, function(holidays, err) {
		$ionicLoading.hide()
		if (err)
			alert('Error occured while loading holidays, please try later');

		angular.forEach(holidays, function(holiday) {
			$scope.data.holidays.push({id: holiday.id, label: holiday.label})
		})

		$scope.search = {
			holiday: '',
			age: '',
			gender: '',
		}

		$scope.submit = function(form) {
			if (form.$valid) {
				$ionicViewSwitcher.nextDirection('forward');
				$state.go('searchResults', $scope.search);
			}
		}
	})
})
   
.controller('historyCtrl', ['$scope', '$stateParams', // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
function ($scope, $stateParams) {


}])
   
.controller('searchResultsCtrl', function ($scope, $stateParams, $state, $ionicHistory, $ionicViewSwitcher, $ionicLoading, API) {
	$scope.validateParams = function() {
		return ($stateParams.holiday !== null && $stateParams.gender !== null && $stateParams.age !== null);
	}

	$scope.goToSearch = function() {
		console.log( 'going to search' );
		$ionicViewSwitcher.nextDirection('back');
		$state.go('searchPresent', $scope.search);
	}
	
	if (!$scope.validateParams()) {
		return $state.go('searchPresent');
	}

	$scope.presents = []

	$scope.load = function() {
		$ionicLoading.show()
		API.get('presents', $stateParams, function(presents, err) {
			$ionicLoading.hide()
			if (err)
				alert('Error occured while loading presents, please try it later');
			else
				$scope.presents = presents
		})
	}

	$scope.load()

})

.controller('showPresentCtrl', function($scope, $stateParams, $ionicLoading, API, $window) {
	$ionicLoading.show()
	$scope.openUrl = function(url) {
		url = encodeURI(url)
		return $window.open(url, '_system', 'location=yes');
	}
	API.get('presents/'+$stateParams.id, {}, function(present) {
		$ionicLoading.hide()
		$scope.present = present
	})
})