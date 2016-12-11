angular.module('app.services', [])

.factory('BlankFactory', [function(){

}])
.factory('API', function($http) {
	let endpoint = function(path) {
		return 'http://192.168.1.13:3000/api/'+path
	}

	return {
		get: function(url, params, callback) {
			$http({
				method: 'GET', 
				url: endpoint(url),
				params: params
			})
			.success(function(data, status, headers, config) {
				if (typeof(callback) == "function")
					return callback(data, false, status, headers, config)
			})
			.error(function(data, status, headers, config) {
				if (typeof(callback) == "function")
					return callback(data, true, status, headers, config)
			})
		},

		post: function(url, data, callback) {
			$http({
				method: 'POST', 
				url: endpoint(url),
				data: data
			})
			.success(function(data, status, headers, config) {
				if (typeof(callback) == "function")
					return callback(data, false, status, headers, config)
			})
			.error(function(data, status, headers, config) {
				if (typeof(callback) == "function")
					return callback(data, true, status, headers, config)
			})
		}
	}
})
.service('BlankService', [function(){

}]);