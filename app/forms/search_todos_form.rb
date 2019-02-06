class SearchTodosForm < SearchForm::Base
  attribute :title, String
  attribute :status, Integer

  def initialize(search_params)
    super
    self.status = ['incomplete'] unless search_params[:status]&.any?(&:present?)
  end
end
