describe('Model', function() {
	it('should do something', function(){
		var myPage = affix('#my-page');
		var results = searchPage.affix('.results');
		var searchQuery = searchPage.affix('input.search_query');
		var searchApi = {
			search: function(query) {
				return  {
					done: function(callback) {
						callback([{
							title: "Yo mama",
							url: "http://yomama.example.com"
						}, {
							title: "yo dadda",
							url: "http://yodadda.example.com"
						}])
					}

				}
			}
		}
		var searchView = new SearchView('#search_page', searchApi);
		searchQuery.val('Yo');
		searchQuery.trigger('change');
		expect(results).toHaveText("Yo mama");
		expect(results).toHaveText("Yo dadda");
	})
})