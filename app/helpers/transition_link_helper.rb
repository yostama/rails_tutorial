module TransitionLinkHelper
  def render_new_link(url, klass: 'btn btn-default')
    link_to '新規作成', url, class: klass
  end

  def render_detail_link(url, klass: 'btn btn-default')
    link_to '詳細', url, class: klass
  end

  def render_edit_link(url, klass: 'btn btn-default')
    link_to '編集', url, class: klass
  end

  def render_update_link(url, klass: 'btn btn-default')
    link_to '更新', url, class: klass
  end

  def render_delete_link(url, klass: 'btn btn-danger')
    link_to '削除', url, method: :delete, data: { confirm: '本当に削除してもよろしいですか?' }, class: klass
  end

  def render_return_link(url, klass: 'btn btn-light')
    link_to '戻る', url, class: klass
  end

  def render_save_submit(form, klass: 'btn btn-lg btn-primary')
    text = form.object.persisted? ? '更新する' : '登録する'
    form.submit text, class: klass
  end
end
