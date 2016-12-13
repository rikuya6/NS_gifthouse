module ApplicationHelper

  def page_title
    title = 'ギフト家'
    title = 'ギフト家' + ' | ' + @page_title if @page_title
    title
  end

  def show?
    action_name == 'show'
  end

  def edit?
    action_name == 'edit'
  end

  def new_or_create?
    (action_name == 'new') || (action_name == 'create')
  end
end
