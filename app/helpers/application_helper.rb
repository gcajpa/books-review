module ApplicationHelper
  ACTION_ALIASES = {
    'create' => 'new',
    'update' => 'edit',
    'destroy' => 'remove'
  }

  def page_title
    action_name = ACTION_ALIASES[controller.action_name] || controller.action_name
    scope = [controller.controller_name, action_name].join('.')
    if action_name == 'index'
      t(scope, scope: 'titles', name: @user.name)
    else
      t(scope, scope: 'titles')
    end
  end
end
