class Todo < ApplicationRecord
  enum status: %i(incomplete complete)

  belongs_to :user

  validates :title, presence: true
  validates :status, inclusion: { in: statuses.keys }

  scope :incomplete, -> { where(status: Todo.statuses[:incomplete]) }

  after_initialize :set_default, if: :new_record?

  scope :like_title, -> (title) { where('title LIKE ?', "%#{title}%") }
  scope :search, -> (search_form) {
    self.like_title(search_form.title).where(status: search_form.status)
  }

  private

  def set_default
    self.status ||= Todo.statuses[:incomplete]
  end
end
