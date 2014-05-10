HomeController = @HomeController
PageController = @PageController

Router.map ->
    @route 'home',
        path: '/' 
        controller: HomeController
    @route 'page',
        path: '/page/:_id'
        controller: PageController
    @route 'item_form',
        controller: ItemFormController