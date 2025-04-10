Redmine::Plugin.register :motivation_center do
  name 'Motivation Center 🔥'
  author 'Sami Hindi @ Renuo'
  description 'This is a simple redmine plugin boilerplate to help you get started with your own plugins.'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings default: {'message' => 'Keep up the great work! 💪'}, partial: 'settings/motivation_settings'

  menu :admin_menu, :motivation_center, {
    controller: 'motivation',
    action: 'index'
  },
  caption: 'Motivation Center'
end
