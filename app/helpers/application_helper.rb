module ApplicationHelper
  ACTION_ALIASES = {
     'create' => 'new',
     'update' => 'edti',
    'destroy' => 'remove'
  }
  def page_title
    action_name = ACTION_ALIASES[controller.action_name] || controller.action_name
    scope = [controller.controller_name, action_name].join('.')

    t(scope, scope: 'titles')
  end
end
